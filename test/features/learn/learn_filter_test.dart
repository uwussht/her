import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/localized_text.dart';
import 'package:her_circle/features/learn/domain/content_item.dart';
import 'package:her_circle/features/learn/domain/learn_filter.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';

LocalizedText t(String ru, {String? kk, String? en}) =>
    LocalizedText({'ru': ru, 'kk': kk ?? ru, 'en': en ?? ru});

ContentItem item(
  String id, {
  ContentType type = ContentType.article,
  ContentCategory category = ContentCategory.cycleHealth,
  AccessTier tier = AccessTier.free,
  int minutes = 10,
  int views = 0,
  DateTime? published,
  List<LifeStage> stages = const [],
  List<Interest> interests = const [],
  int? week,
  String? titleRu,
  String? titleEn,
}) {
  return ContentItem(
    id: id,
    type: type,
    category: category,
    tier: tier,
    title: t(titleRu ?? id, en: titleEn ?? id),
    summary: t('summary $id'),
    durationMinutes: minutes,
    viewCount: views,
    publishedAt: published,
    stages: stages,
    interests: interests,
    pregnancyWeek: week,
  );
}

void main() {
  const catalogue = LearnCatalogue();

  group('categories', () {
    test('the 18+ section is hidden from under-16s', () {
      expect(
        catalogue.categoriesFor(AgeGroup.age10to15),
        isNot(contains(ContentCategory.intimacy)),
      );
      expect(
        catalogue.categoriesFor(AgeGroup.age16to24),
        contains(ContentCategory.intimacy),
      );
      // Unknown age is treated as an adult, since the quiz asks first.
      expect(catalogue.categoriesFor(null), contains(ContentCategory.intimacy));
    });
  });

  group('filtering', () {
    final items = [
      item('article', minutes: 5),
      item('video', type: ContentType.video, minutes: 20),
      item('premium', tier: AccessTier.premium),
      item('nutrition', category: ContentCategory.nutrition),
      item('adult', category: ContentCategory.intimacy),
    ];

    List<String> ids(
      LearnFilter filter, {
      AgeGroup? age,
      Set<String> marks = const {},
    }) => catalogue
        .apply(items: items, filter: filter, ageGroup: age, bookmarks: marks)
        .map((item) => item.id)
        .toList();

    test('by category', () {
      expect(ids(const LearnFilter(category: ContentCategory.nutrition)), [
        'nutrition',
      ]);
    });

    test('by type', () {
      expect(ids(const LearnFilter(type: ContentType.video)), ['video']);
    });

    test('free only hides premium', () {
      expect(
        ids(const LearnFilter(freeOnly: true)),
        isNot(contains('premium')),
      );
    });

    test('bookmarked only', () {
      expect(ids(const LearnFilter(bookmarkedOnly: true), marks: {'video'}), [
        'video',
      ]);
      expect(ids(const LearnFilter(bookmarkedOnly: true)), isEmpty);
    });

    test('18+ items are hidden from under-16s even without a category', () {
      expect(
        ids(const LearnFilter(), age: AgeGroup.age10to15),
        isNot(contains('adult')),
      );
      expect(ids(const LearnFilter()), contains('adult'));
    });

    test('filters combine', () {
      final result = ids(
        const LearnFilter(
          category: ContentCategory.cycleHealth,
          freeOnly: true,
          type: ContentType.article,
        ),
      );
      expect(result, ['article']);
    });
  });

  group('search', () {
    final items = [
      item('a', titleRu: 'Железо и месячные', titleEn: 'Iron and your period'),
      item('b', titleRu: 'Приливы', titleEn: 'Hot flashes'),
    ];

    List<String> search(String query) => catalogue
        .apply(
          items: items,
          filter: LearnFilter(query: query),
        )
        .map((item) => item.id)
        .toList();

    test('matches the title in any language and ignores case', () {
      expect(search('железо'), ['a']);
      expect(search('IRON'), ['a']);
      expect(search('flash'), ['b']);
    });

    test('matches the summary', () {
      expect(search('summary b'), ['b']);
    });

    test('a blank query keeps everything', () {
      expect(search('   ').length, 2);
    });

    test('no match returns nothing', () {
      expect(search('zzz'), isEmpty);
    });
  });

  group('sorting', () {
    final items = [
      item('old', published: DateTime(2026), views: 50, minutes: 30),
      item('new', published: DateTime(2026, 9), views: 10, minutes: 20),
      item('popular', published: DateTime(2026, 5), views: 900, minutes: 15),
      item(
        'short',
        published: DateTime(2026, 6),
        views: 5,
        minutes: 3,
        stages: const [LifeStage.pregnant],
      ),
    ];

    List<String> sorted(LearnSort sort, {LifeStage? stage}) => catalogue
        .apply(
          items: items,
          filter: LearnFilter(sort: sort),
          lifeStage: stage,
        )
        .map((item) => item.id)
        .toList();

    test('newest first', () {
      expect(sorted(LearnSort.newest).first, 'new');
    });

    test('most popular first', () {
      expect(sorted(LearnSort.popular).first, 'popular');
    });

    test('shortest first', () {
      expect(sorted(LearnSort.shortest).first, 'short');
    });

    test('recommended puts a stage match first', () {
      expect(
        sorted(LearnSort.recommended, stage: LifeStage.pregnant).first,
        'short',
      );
    });

    test('recommended falls back to popularity without a profile', () {
      expect(sorted(LearnSort.recommended).first, 'popular');
    });
  });

  group('pregnancy school', () {
    final items = [
      item('w12', category: ContentCategory.pregnancySchool, week: 12),
      item('w18', category: ContentCategory.pregnancySchool, week: 18),
      item('w34', category: ContentCategory.pregnancySchool, week: 34),
      item('not-weekly', category: ContentCategory.pregnancySchool),
      item('other'),
    ];

    test('orders by week when she is not pregnant', () {
      expect(
        catalogue
            .pregnancySchoolFor(items: items, currentWeek: null)
            .map((item) => item.id),
        ['w12', 'w18', 'w34'],
      );
    });

    test('puts the nearest week to hers first', () {
      expect(
        catalogue
            .pregnancySchoolFor(items: items, currentWeek: 20)
            .map((item) => item.id),
        ['w18', 'w12', 'w34'],
      );
    });
  });

  test('LearnFilter tracks whether anything is active', () {
    expect(const LearnFilter().isActive, isFalse);
    expect(const LearnFilter(query: '  ').isActive, isFalse);
    expect(const LearnFilter(freeOnly: true).isActive, isTrue);
    expect(
      const LearnFilter(category: ContentCategory.nutrition).isActive,
      isTrue,
    );
  });

  test('clearing a category is distinct from leaving it alone', () {
    const filter = LearnFilter(category: ContentCategory.nutrition);
    expect(filter.copyWith(freeOnly: true).category, ContentCategory.nutrition);
    expect(filter.copyWith(clearCategory: true).category, isNull);
  });
}
