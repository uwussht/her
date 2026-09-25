import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/localized_text.dart';
import 'package:her_circle/core/services/mock_asset_loader.dart';
import 'package:her_circle/core/services/storage/local_store.dart';
import 'package:her_circle/core/services/storage/preferences_service.dart';
import 'package:her_circle/features/home/presentation/home_providers.dart';
import 'package:her_circle/features/learn/domain/course.dart';
import 'package:her_circle/features/learn/domain/course_progress.dart';
import 'package:her_circle/features/learn/presentation/learn_providers.dart';
import 'package:her_circle/features/premium/domain/premium_status.dart';
import 'package:her_circle/features/premium/presentation/premium_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

LocalizedText t(String value) => LocalizedText({'ru': value, 'en': value});

Lesson lesson(String id, {bool quiz = false, int minutes = 10}) =>
    Lesson(id: id, title: t(id), durationMinutes: minutes, isQuiz: quiz);

final course = Course(
  id: 'c1',
  title: t('Course'),
  modules: [
    CourseModule(
      id: 'm1',
      title: t('m1'),
      lessons: [lesson('l1'), lesson('l2')],
    ),
    CourseModule(
      id: 'm2',
      title: t('m2'),
      lessons: [lesson('l3'), lesson('l4', quiz: true, minutes: 5)],
    ),
  ],
);

void main() {
  group('Course', () {
    test('flattens lessons in order and sums time', () {
      expect(course.lessons.map((l) => l.id), ['l1', 'l2', 'l3', 'l4']);
      expect(course.lessonCount, 4);
      expect(course.totalMinutes, 35);
    });

    test('finds lessons, numbers and neighbours', () {
      expect(course.lessonById('l3')!.id, 'l3');
      expect(course.lessonById('nope'), isNull);
      expect(course.lessonNumber('l3'), 3);
      expect(course.lessonNumber('nope'), isNull);
      expect(course.lessonAfter('l1')!.id, 'l2');
      // Crosses a module boundary.
      expect(course.lessonAfter('l2')!.id, 'l3');
      expect(course.lessonAfter('l4'), isNull);
      expect(course.moduleOf('l3')!.id, 'm2');
    });

    test('a quiz needs questions to be playable', () {
      expect(course.lessonById('l4')!.isQuiz, isTrue);
      expect(course.lessonById('l4')!.isPlayableQuiz, isFalse);
      final withQuestions = lesson('q', quiz: true).copyWith(
        questions: [
          QuizQuestion(
            question: t('q'),
            options: [t('a'), t('b')],
            correctIndex: 1,
          ),
        ],
      );
      expect(withQuestions.isPlayableQuiz, isTrue);
    });
  });

  group('CourseProgress', () {
    test('tracks the fraction done and the next lesson', () {
      final progress = CourseProgress(
        courseId: 'c1',
        completedLessonIds: const ['l1', 'l2'],
        lastLessonId: 'l2',
        updatedAt: DateTime(2026, 9, 20),
      );

      expect(progress.fractionOf(course), 0.5);
      expect(progress.isStarted, isTrue);
      expect(progress.isComplete, isFalse);
      expect(progress.nextLesson(course)!.id, 'l3');
    });

    test('a finished course has no next lesson', () {
      final progress = CourseProgress(
        courseId: 'c1',
        completedLessonIds: const ['l1', 'l2', 'l3', 'l4'],
        updatedAt: DateTime(2026, 9, 20),
        completedAt: DateTime(2026, 9, 20),
      );
      expect(progress.fractionOf(course), 1);
      expect(progress.nextLesson(course), isNull);
      expect(progress.isComplete, isTrue);
    });

    test('completing out of order still resumes at the first gap', () {
      final progress = CourseProgress(
        courseId: 'c1',
        completedLessonIds: const ['l2', 'l3'],
        updatedAt: DateTime(2026, 9, 20),
      );
      expect(progress.nextLesson(course)!.id, 'l1');
    });

    test('survives a JSON round trip', () {
      final progress = CourseProgress(
        courseId: 'c1',
        completedLessonIds: const ['l1'],
        lastLessonId: 'l1',
        updatedAt: DateTime(2026, 9, 20),
      );
      expect(CourseProgress.fromJson(progress.toJson()), progress);
    });
  });

  group('controllers', () {
    late ProviderContainer container;
    late InMemoryLocalStore store;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      store = InMemoryLocalStore();
      container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          localStoreProvider.overrideWithValue(store),
          mockAssetLoaderProvider.overrideWithValue(
            MockAssetLoader.preloaded(const {}),
          ),
        ],
      );
      addTearDown(container.dispose);
      container.listen(courseProgressControllerProvider, (_, _) {});
      container.listen(bookmarksControllerProvider, (_, _) {});
    });

    test(
      'completing lessons advances and finally completes the course',
      () async {
        final notifier = container.read(
          courseProgressControllerProvider.notifier,
        );

        await notifier.completeLesson(course: course, lessonId: 'l1');
        var progress = container.read(courseProgressControllerProvider)['c1']!;
        expect(progress.completedLessonIds, ['l1']);
        expect(progress.isComplete, isFalse);
        expect(progress.nextLesson(course)!.id, 'l2');

        for (final id in ['l2', 'l3', 'l4']) {
          await notifier.completeLesson(course: course, lessonId: id);
        }
        progress = container.read(courseProgressControllerProvider)['c1']!;
        expect(progress.isComplete, isTrue);
        expect(progress.completedAt, isNotNull);
        // Stored, not just held in memory.
        expect(store.readJson('learn.progress.guest'), isNotNull);
      },
    );

    test('completing the same lesson twice does not duplicate it', () async {
      final notifier = container.read(
        courseProgressControllerProvider.notifier,
      );
      await notifier.completeLesson(course: course, lessonId: 'l1');
      await notifier.completeLesson(course: course, lessonId: 'l1');
      expect(
        container
            .read(courseProgressControllerProvider)['c1']!
            .completedLessonIds,
        ['l1'],
      );
    });

    test('bookmarks toggle and persist', () async {
      final notifier = container.read(bookmarksControllerProvider.notifier);

      expect(await notifier.toggle('c_pms'), isTrue);
      expect(container.read(bookmarksControllerProvider), {'c_pms'});
      expect(await notifier.toggle('c_pms'), isFalse);
      expect(container.read(bookmarksControllerProvider), isEmpty);

      await notifier.toggle('c_iron');
      container.invalidate(bookmarksControllerProvider);
      expect(container.read(bookmarksControllerProvider), {'c_iron'});
    });

    test('premium unlocks through the demo switch and persists', () async {
      expect(container.read(hasPremiumProvider), isFalse);

      await container.read(premiumControllerProvider.notifier).toggleDemo();
      expect(container.read(hasPremiumProvider), isTrue);
      expect(container.read(premiumControllerProvider), PremiumStatus.trial);

      container.invalidate(premiumControllerProvider);
      expect(container.read(hasPremiumProvider), isTrue);

      await container.read(premiumControllerProvider.notifier).toggleDemo();
      expect(container.read(premiumControllerProvider), PremiumStatus.free);
    });
  });
}
