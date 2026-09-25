import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/mock_asset_loader.dart';
import '../../../core/services/storage/local_store.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../learn/data/local_progress_repository.dart';
import '../../learn/data/mock_content_repository.dart';
import '../../learn/domain/content_item.dart';
import '../../learn/domain/content_repository.dart';
import '../../learn/domain/course.dart';
import '../../learn/domain/course_progress.dart';
import '../../learn/domain/daily_tip.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../../qa/data/mock_qa_repository.dart';
import '../../qa/domain/expert.dart';
import '../../qa/domain/qa_repository.dart';
import '../../qa/domain/question.dart';
import '../../shop/data/mock_product_repository.dart';
import '../../shop/domain/product.dart';
import '../../shop/domain/product_repository.dart';
import '../../shop/domain/seller.dart';
import '../../tracker/domain/pregnancy_status.dart';
import '../../tracker/presentation/tracker_providers.dart';
import '../domain/feed_service.dart';
import '../domain/home_feed.dart';

part 'home_providers.g.dart';

@Riverpod(keepAlive: true)
MockAssetLoader mockAssetLoader(Ref ref) => MockAssetLoader();

@Riverpod(keepAlive: true)
ContentRepository contentRepository(Ref ref) =>
    MockContentRepository(ref.watch(mockAssetLoaderProvider));

@Riverpod(keepAlive: true)
QaRepository qaRepository(Ref ref) =>
    MockQaRepository(ref.watch(mockAssetLoaderProvider));

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) =>
    MockProductRepository(ref.watch(mockAssetLoaderProvider));

@Riverpod(keepAlive: true)
ProgressRepository progressRepository(Ref ref) {
  final uid = ref.watch(currentUserProvider)?.uid;
  return LocalProgressRepository(ref.watch(localStoreProvider), uid ?? 'guest');
}

@Riverpod(keepAlive: true)
FeedService feedService(Ref ref) => const FeedService();

// Catalogue providers. Cached for the session; Firestore streams replace
// these when the backend is connected.

@Riverpod(keepAlive: true)
Future<List<ContentItem>> contentLibrary(Ref ref) =>
    ref.watch(contentRepositoryProvider).fetchContent();

@Riverpod(keepAlive: true)
Future<List<Course>> courses(Ref ref) =>
    ref.watch(contentRepositoryProvider).fetchCourses();

@Riverpod(keepAlive: true)
Future<List<DailyTip>> dailyTips(Ref ref) =>
    ref.watch(contentRepositoryProvider).fetchTips();

@Riverpod(keepAlive: true)
Future<List<BabySize>> babySizes(Ref ref) =>
    ref.watch(contentRepositoryProvider).fetchBabySizes();

@Riverpod(keepAlive: true)
Future<List<Question>> questions(Ref ref) =>
    ref.watch(qaRepositoryProvider).fetchQuestions();

@Riverpod(keepAlive: true)
Future<List<Expert>> experts(Ref ref) =>
    ref.watch(qaRepositoryProvider).fetchExperts();

@Riverpod(keepAlive: true)
Future<List<Product>> products(Ref ref) =>
    ref.watch(productRepositoryProvider).fetchProducts();

@Riverpod(keepAlive: true)
Future<List<Seller>> sellers(Ref ref) =>
    ref.watch(productRepositoryProvider).fetchSellers();

/// An expert by id, for badges and bylines.
@Riverpod(keepAlive: true)
Expert? expertById(Ref ref, String? id) {
  if (id == null) return null;
  final all = ref.watch(expertsProvider).value ?? const [];
  for (final expert in all) {
    if (expert.id == id) return expert;
  }
  return null;
}

/// Course progress for the signed-in user.
@Riverpod(keepAlive: true)
class CourseProgressController extends _$CourseProgressController {
  @override
  Map<String, CourseProgress> build() =>
      ref.watch(progressRepositoryProvider).readAll();

  /// Marks [lessonId] done and remembers where she got to.
  Future<void> completeLesson({
    required Course course,
    required String lessonId,
  }) async {
    final existing = state[course.id];
    final completed = {...?existing?.completedLessonIds, lessonId};
    final allDone = course.lessons.every(
      (lesson) => completed.contains(lesson.id),
    );
    final progress = CourseProgress(
      courseId: course.id,
      completedLessonIds: [
        for (final lesson in course.lessons)
          if (completed.contains(lesson.id)) lesson.id,
      ],
      lastLessonId: lessonId,
      updatedAt: DateTime.now(),
      completedAt: allDone ? (existing?.completedAt ?? DateTime.now()) : null,
    );
    await ref.read(progressRepositoryProvider).save(progress);
    state = {...state, course.id: progress};
  }
}

/// The personalised home feed. Null while the catalogue is still loading.
@riverpod
HomeFeed? homeFeed(Ref ref) {
  final content = ref.watch(contentLibraryProvider).value;
  final courses = ref.watch(coursesProvider).value;
  final tips = ref.watch(dailyTipsProvider).value;
  final products = ref.watch(productsProvider).value;
  final questions = ref.watch(questionsProvider).value;
  final sizes = ref.watch(babySizesProvider).value;
  if (content == null ||
      courses == null ||
      tips == null ||
      products == null ||
      questions == null ||
      sizes == null) {
    return null;
  }

  return ref
      .watch(feedServiceProvider)
      .build(
        profile: ref.watch(userProfileControllerProvider),
        timeline: ref.watch(cycleTimelineProvider),
        sources: (
          content: content,
          courses: courses,
          tips: tips,
          products: products,
          questions: questions,
          babySizes: sizes,
          progress: ref.watch(courseProgressControllerProvider),
        ),
      );
}
