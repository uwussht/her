import 'package:flutter/foundation.dart';

import '../../../core/l10n/app_locales.dart';
import '../../profile/domain/personalization.dart';
import 'content_item.dart';

/// How the Learn list is sorted.
enum LearnSort {
  /// Best match for her stage and interests.
  recommended,
  newest,
  popular,
  shortest,
}

/// The state of the Learn library filters.
@immutable
class LearnFilter {
  const LearnFilter({
    this.category,
    this.type,
    this.freeOnly = false,
    this.bookmarkedOnly = false,
    this.query = '',
    this.sort = LearnSort.recommended,
  });

  final ContentCategory? category;
  final ContentType? type;

  /// Hides premium items.
  final bool freeOnly;
  final bool bookmarkedOnly;
  final String query;
  final LearnSort sort;

  bool get isActive =>
      category != null ||
      type != null ||
      freeOnly ||
      bookmarkedOnly ||
      query.trim().isNotEmpty;

  LearnFilter copyWith({
    ContentCategory? category,
    bool clearCategory = false,
    ContentType? type,
    bool clearType = false,
    bool? freeOnly,
    bool? bookmarkedOnly,
    String? query,
    LearnSort? sort,
  }) {
    return LearnFilter(
      category: clearCategory ? null : (category ?? this.category),
      type: clearType ? null : (type ?? this.type),
      freeOnly: freeOnly ?? this.freeOnly,
      bookmarkedOnly: bookmarkedOnly ?? this.bookmarkedOnly,
      query: query ?? this.query,
      sort: sort ?? this.sort,
    );
  }
}

/// Filters and sorts the Learn library.
///
/// Pure, so the age gate and the search rules are unit-tested rather than
/// verified by tapping through the UI.
class LearnCatalogue {
  const LearnCatalogue();

  /// Categories she may browse: the 18+ section is hidden from minors.
  List<ContentCategory> categoriesFor(AgeGroup? ageGroup) => [
    for (final category in ContentCategory.values)
      if (!(category.isAdultOnly && (ageGroup?.isUnder16 ?? false))) category,
  ];

  List<ContentItem> apply({
    required List<ContentItem> items,
    required LearnFilter filter,
    AgeGroup? ageGroup,
    LifeStage? lifeStage,
    List<Interest> interests = const [],
    Set<String> bookmarks = const {},
    AppLocale locale = AppLocale.ru,
  }) {
    final query = filter.query.trim().toLowerCase();
    final result = [
      for (final item in items)
        if (_matches(
          item: item,
          filter: filter,
          query: query,
          ageGroup: ageGroup,
          bookmarks: bookmarks,
          locale: locale,
        ))
          item,
    ];

    result.sort(
      (a, b) => switch (filter.sort) {
        LearnSort.newest => _compareDates(b.publishedAt, a.publishedAt),
        LearnSort.popular => b.viewCount.compareTo(a.viewCount),
        LearnSort.shortest => a.durationMinutes.compareTo(b.durationMinutes),
        LearnSort.recommended => _relevance(
          b,
          lifeStage,
          interests,
        ).compareTo(_relevance(a, lifeStage, interests)),
      },
    );
    return result;
  }

  bool _matches({
    required ContentItem item,
    required LearnFilter filter,
    required String query,
    required AgeGroup? ageGroup,
    required Set<String> bookmarks,
    required AppLocale locale,
  }) {
    if (item.isAdultOnly && (ageGroup?.isUnder16 ?? false)) return false;
    if (filter.category != null && item.category != filter.category) {
      return false;
    }
    if (filter.type != null && item.type != filter.type) return false;
    if (filter.freeOnly && item.isPremium) return false;
    if (filter.bookmarkedOnly && !bookmarks.contains(item.id)) return false;
    if (query.isEmpty) return true;

    // Search the title and summary in every language, so a Russian query
    // still finds an item she first saw in Kazakh.
    final haystack = [
      ...item.title.values.values,
      ...item.summary.values.values,
    ].join(' ').toLowerCase();
    return haystack.contains(query);
  }

  static int _compareDates(DateTime? a, DateTime? b) {
    if (a == null && b == null) return 0;
    if (a == null) return -1;
    if (b == null) return 1;
    return a.compareTo(b);
  }

  static int _relevance(
    ContentItem item,
    LifeStage? stage,
    List<Interest> interests,
  ) {
    var score = 0;
    if (stage != null && item.stages.contains(stage)) score += 6;
    score += 3 * item.interests.where(interests.contains).length;
    if (!item.isPremium) score += 1;
    // Popularity only breaks ties: the multiplier is larger than any
    // realistic view count, so it can never outweigh a stage match.
    return score * 100000000 + item.viewCount;
  }

  /// Pregnancy School grouped by week, nearest week first.
  List<ContentItem> pregnancySchoolFor({
    required List<ContentItem> items,
    required int? currentWeek,
  }) {
    final weekly = [
      for (final item in items)
        if (item.category == ContentCategory.pregnancySchool &&
            item.pregnancyWeek != null)
          item,
    ]..sort((a, b) => a.pregnancyWeek!.compareTo(b.pregnancyWeek!));
    if (currentWeek == null) return weekly;
    weekly.sort(
      (a, b) => (a.pregnancyWeek! - currentWeek).abs().compareTo(
        (b.pregnancyWeek! - currentWeek).abs(),
      ),
    );
    return weekly;
  }
}
