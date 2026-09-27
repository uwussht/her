import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/localized_text.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/shop/domain/product.dart';
import 'package:her_circle/features/shop/domain/product_recommender.dart';
import 'package:her_circle/features/shop/domain/shop_catalogue.dart';
import 'package:her_circle/features/shop/domain/subscription.dart';
import 'package:her_circle/features/tracker/domain/cycle.dart';
import 'package:her_circle/features/tracker/domain/cycle_timeline.dart';
import 'package:her_circle/features/tracker/domain/prediction_service.dart';
import 'package:her_circle/features/tracker/domain/tracker_enums.dart';

LocalizedText t(String ru, {String? en}) =>
    LocalizedText({'ru': ru, 'en': en ?? ru});

Product product(
  String id, {
  ProductCategory category = ProductCategory.wellness,
  int price = 5000,
  int? oldPrice,
  String sellerId = 's_global',
  double rating = 4.5,
  int reviewCount = 10,
  bool inStock = true,
  List<CyclePhase> phases = const [],
  List<LifeStage> stages = const [],
  List<Interest> interests = const [],
  String? titleRu,
  String? titleEn,
}) {
  return Product(
    id: id,
    category: category,
    title: t(titleRu ?? id, en: titleEn ?? id),
    description: t('description of $id'),
    price: price,
    oldPrice: oldPrice,
    sellerId: sellerId,
    rating: rating,
    reviewCount: reviewCount,
    inStock: inStock,
    phases: phases,
    stages: stages,
    interests: interests,
  );
}

CycleTimeline timelineFrom(DateTime? lastPeriod, {int cycleLength = 28}) {
  final cycles = lastPeriod == null
      ? <Cycle>[]
      : [Cycle(id: 'c1', startDate: lastPeriod)];
  return CycleTimeline(
    cycles: cycles,
    logs: const {},
    prediction: const PredictionService().predict(
      cycles: cycles,
      fallbackCycleLength: cycleLength,
    ),
  );
}

void main() {
  const catalogue = ShopCatalogue();
  const recommender = ProductRecommender();

  group('categories', () {
    test('intimate health is hidden from under-16s', () {
      expect(
        catalogue.categoriesFor(AgeGroup.age10to15),
        isNot(contains(ProductCategory.intimateHealth)),
      );
      expect(
        catalogue.categoriesFor(AgeGroup.age25to34),
        contains(ProductCategory.intimateHealth),
      );
    });
  });

  group('filtering', () {
    final products = [
      product(
        'pads',
        category: ProductCategory.periodCare,
        price: 1890,
        sellerId: 's_aru',
      ),
      product(
        'pillow',
        category: ProductCategory.pregnancy,
        price: 15900,
        oldPrice: 18900,
        sellerId: 's_mama',
      ),
      product(
        'serum',
        category: ProductCategory.beauty,
        price: 8400,
        sellerId: 's_dala',
      ),
      product('lube', category: ProductCategory.intimateHealth, price: 4100),
      product('gone', price: 100, inStock: false),
    ];

    List<String> ids(ShopFilter filter, {AgeGroup? age}) => catalogue
        .apply(
          products: products,
          filter: filter,
          ageGroup: age,
          localSellerIds: const {'s_aru', 's_dala', 's_mama'},
        )
        .map((product) => product.id)
        .toList();

    test('by category', () {
      expect(ids(const ShopFilter(category: ProductCategory.periodCare)), [
        'pads',
      ]);
    });

    test('by maximum price', () {
      expect(
        ids(const ShopFilter(maxPrice: 5000)),
        containsAll(['pads', 'lube']),
      );
      expect(ids(const ShopFilter(maxPrice: 5000)), isNot(contains('pillow')));
    });

    test('discounted only', () {
      expect(ids(const ShopFilter(discountedOnly: true)), ['pillow']);
    });

    test('local brands only', () {
      expect(
        ids(const ShopFilter(localBrandsOnly: true)),
        isNot(contains('lube')),
      );
    });

    test('adult-only products are hidden from under-16s', () {
      expect(
        ids(const ShopFilter(), age: AgeGroup.age10to15),
        isNot(contains('lube')),
      );
      expect(ids(const ShopFilter()), contains('lube'));
    });

    test('search matches the title and description in any language', () {
      expect(ids(const ShopFilter(query: 'PADS')), ['pads']);
      expect(ids(const ShopFilter(query: 'description of serum')), ['serum']);
      expect(ids(const ShopFilter(query: 'nothing')), isEmpty);
    });

    test('out-of-stock products still list, so she can see them', () {
      // The card shows an out-of-stock badge rather than hiding the product.
      expect(ids(const ShopFilter()), contains('gone'));
    });

    test('the price filter knows the catalogue maximum', () {
      expect(catalogue.maxPriceIn(products), 15900);
      expect(catalogue.maxPriceIn(const []), 0);
    });
  });

  group('sorting', () {
    final products = [
      product('cheap', price: 1000, rating: 3.9, reviewCount: 5),
      product('dear', price: 20000, rating: 4.2, reviewCount: 50),
      product('loved', price: 5000, rating: 4.9, reviewCount: 200),
      product(
        'stage',
        price: 7000,
        rating: 4.0,
        stages: const [LifeStage.pregnant],
      ),
    ];

    List<String> sorted(ShopSort sort, {LifeStage? stage}) => catalogue
        .apply(
          products: products,
          filter: ShopFilter(sort: sort),
          lifeStage: stage,
        )
        .map((product) => product.id)
        .toList();

    test('price ascending and descending', () {
      expect(sorted(ShopSort.priceAsc).first, 'cheap');
      expect(sorted(ShopSort.priceDesc).first, 'dear');
    });

    test('by rating', () {
      expect(sorted(ShopSort.rating).first, 'loved');
    });

    test('most reviewed', () {
      expect(sorted(ShopSort.newest).first, 'loved');
    });

    test('recommended puts a stage match first, then rating', () {
      expect(
        sorted(ShopSort.recommended, stage: LifeStage.pregnant).first,
        'stage',
      );
      expect(sorted(ShopSort.recommended).first, 'loved');
    });
  });

  group('ProductRecommender', () {
    final now = DateTime(2026, 9, 20);
    final products = [
      product(
        'pads',
        category: ProductCategory.periodCare,
        phases: const [CyclePhase.period, CyclePhase.predictedPeriod],
      ),
      product('ovutest', phases: const [CyclePhase.fertile]),
      product(
        'preg-oil',
        category: ProductCategory.pregnancy,
        stages: const [LifeStage.pregnant],
      ),
      product('cooling', stages: const [LifeStage.menopause]),
      product(
        'sold-out',
        category: ProductCategory.periodCare,
        phases: const [CyclePhase.period],
        inStock: false,
      ),
    ];

    test('period essentials three days before the period', () {
      final reason = recommender.reasonFor(
        ageGroup: AgeGroup.age25to34,
        lifeStage: LifeStage.trackingCycle,
        timeline: timelineFrom(DateTime(2026, 8, 26)),
        on: now,
      );
      expect(reason, OfferReason.periodSoon);

      final picks = recommender.recommend(
        products: products,
        reason: reason,
        lifeStage: LifeStage.trackingCycle,
      );
      expect(picks.first.id, 'pads');
      // Out-of-stock products are never recommended.
      expect(picks.map((p) => p.id), isNot(contains('sold-out')));
    });

    test('four days out is too early', () {
      expect(
        recommender.reasonFor(
          ageGroup: AgeGroup.age25to34,
          lifeStage: LifeStage.trackingCycle,
          timeline: timelineFrom(DateTime(2026, 8, 27)),
          on: now,
        ),
        OfferReason.general,
      );
    });

    test('stage overrides the cycle', () {
      expect(
        recommender.reasonFor(
          ageGroup: AgeGroup.age25to34,
          lifeStage: LifeStage.pregnant,
          timeline: timelineFrom(now),
          on: now,
        ),
        OfferReason.pregnancy,
      );
      expect(
        recommender.reasonFor(
          ageGroup: AgeGroup.age45plus,
          lifeStage: LifeStage.menopause,
          timeline: timelineFrom(now),
          on: now,
        ),
        OfferReason.menopause,
      );
    });

    test('nothing relevant yields an empty list rather than filler', () {
      final picks = recommender.recommend(
        products: [product('unrelated')],
        reason: OfferReason.general,
      );
      expect(picks, isEmpty);
    });

    test('excluded ids are skipped, so a product page can omit itself', () {
      final picks = recommender.recommend(
        products: products,
        reason: OfferReason.periodNow,
        excludeIds: const {'pads'},
      );
      expect(picks.map((p) => p.id), isNot(contains('pads')));
    });
  });

  group('SubscriptionScheduler', () {
    const scheduler = SubscriptionScheduler();
    final from = DateTime(2026, 9, 20);

    test('a monthly box lands three days before the predicted period', () {
      final first = scheduler.firstDelivery(
        cadence: BoxCadence.monthly,
        from: from,
        nextPeriodStart: DateTime(2026, 10, 2),
      );
      expect(first, DateTime(2026, 9, 29));
    });

    test('a monthly box without a forecast ships in a month', () {
      expect(
        scheduler.firstDelivery(cadence: BoxCadence.monthly, from: from),
        DateTime(2026, 10, 20),
      );
    });

    test('a target in the past is pushed forward', () {
      // The period is already due, so the lead time has passed.
      final first = scheduler.firstDelivery(
        cadence: BoxCadence.monthly,
        from: from,
        nextPeriodStart: DateTime(2026, 9, 21),
      );
      expect(first.isAfter(from), isTrue);
      expect(first, DateTime(2026, 9, 27));
    });

    test('a trimester box ships straight away', () {
      expect(
        scheduler.firstDelivery(cadence: BoxCadence.trimester, from: from),
        DateTime(2026, 9, 22),
      );
    });

    test('upcoming deliveries follow the cadence', () {
      final monthly = Subscription(
        id: 's1',
        productId: 'p_box_period',
        cadence: BoxCadence.monthly,
        startedAt: from,
        nextDelivery: DateTime(2026, 9, 29),
      );
      expect(monthly.upcoming(cycleLength: 30), [
        DateTime(2026, 9, 29),
        DateTime(2026, 10, 29),
        DateTime(2026, 11, 28),
      ]);

      final trimester = monthly.copyWith(cadence: BoxCadence.trimester);
      expect(trimester.upcoming(count: 2).last, DateTime(2026, 12, 28));
      expect(BoxCadence.trimester.deliveryCount, 3);
    });
  });
}
