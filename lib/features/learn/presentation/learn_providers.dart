import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/l10n/locale_controller.dart';
import '../../../core/services/storage/local_store.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../home/presentation/home_providers.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../../tracker/domain/pregnancy_status.dart';
import '../data/local_bookmark_repository.dart';
import '../domain/bookmark_repository.dart';
import '../domain/content_item.dart';
import '../domain/course.dart';
import '../domain/learn_filter.dart';

part 'learn_providers.g.dart';

@Riverpod(keepAlive: true)
BookmarkRepository bookmarkRepository(Ref ref) {
  final uid = ref.watch(currentUserProvider)?.uid;
  return LocalBookmarkRepository(ref.watch(localStoreProvider), uid ?? 'guest');
}

@Riverpod(keepAlive: true)
LearnCatalogue learnCatalogue(Ref ref) => const LearnCatalogue();

/// Saved items.
@Riverpod(keepAlive: true)
class BookmarksController extends _$BookmarksController {
  @override
  Set<String> build() => ref.watch(bookmarkRepositoryProvider).read();

  bool contains(String id) => state.contains(id);

  /// Returns true when the item ended up bookmarked.
  Future<bool> toggle(String id) async {
    final next = {...state};
    final added = next.add(id);
    if (!added) next.remove(id);
    state = next;
    await ref.read(bookmarkRepositoryProvider).save(next);
    return added;
  }
}

/// The Learn library filters.
@riverpod
class LearnFilterController extends _$LearnFilterController {
  @override
  LearnFilter build() => const LearnFilter();

  void setCategory(ContentCategory? category) => state = state.copyWith(
    category: category,
    clearCategory: category == null,
  );

  void setType(ContentType? type) =>
      state = state.copyWith(type: type, clearType: type == null);

  void setQuery(String query) => state = state.copyWith(query: query);

  void setSort(LearnSort sort) => state = state.copyWith(sort: sort);

  void toggleFreeOnly() => state = state.copyWith(freeOnly: !state.freeOnly);

  void toggleBookmarkedOnly() =>
      state = state.copyWith(bookmarkedOnly: !state.bookmarkedOnly);

  void clear() => state = const LearnFilter();
}

/// The filtered, sorted Learn list.
@riverpod
List<ContentItem> learnResults(Ref ref) {
  final items = ref.watch(contentLibraryProvider).value ?? const [];
  final profile = ref.watch(userProfileControllerProvider);
  return ref
      .watch(learnCatalogueProvider)
      .apply(
        items: items,
        filter: ref.watch(learnFilterControllerProvider),
        ageGroup: profile?.ageGroup,
        lifeStage: profile?.lifeStage,
        interests: profile?.interests ?? const [],
        bookmarks: ref.watch(bookmarksControllerProvider),
        locale: ref.watch(localeControllerProvider),
      );
}

/// Categories she may browse, with the 18+ section hidden from minors.
@riverpod
List<ContentCategory> visibleCategories(Ref ref) => ref
    .watch(learnCatalogueProvider)
    .categoriesFor(ref.watch(userProfileControllerProvider)?.ageGroup);

/// One library item by id.
@riverpod
ContentItem? contentById(Ref ref, String id) {
  final items = ref.watch(contentLibraryProvider).value ?? const [];
  for (final item in items) {
    if (item.id == id) return item;
  }
  return null;
}

@riverpod
Course? courseById(Ref ref, String? id) {
  if (id == null) return null;
  final courses = ref.watch(coursesProvider).value ?? const [];
  for (final course in courses) {
    if (course.id == id) return course;
  }
  return null;
}

/// Pregnancy School, ordered around her current week.
@riverpod
List<ContentItem> pregnancySchool(Ref ref) {
  final items = ref.watch(contentLibraryProvider).value ?? const [];
  final profile = ref.watch(userProfileControllerProvider);
  final lmp = profile?.lastPeriodStart;
  final week = lmp == null
      ? null
      : PregnancyStatus.fromLastPeriod(lmp, DateTime.now())?.week;
  return ref
      .watch(learnCatalogueProvider)
      .pregnancySchoolFor(items: items, currentWeek: week);
}

/// Locale tag for date and PDF formatting.
@riverpod
String localeTag(Ref ref) =>
    ref.watch(localeControllerProvider).locale.toLanguageTag();
