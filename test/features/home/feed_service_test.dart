import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/localized_text.dart';
import 'package:her_circle/core/utils/date_utils.dart';
import 'package:her_circle/features/home/domain/feed_service.dart';
import 'package:her_circle/features/home/domain/home_feed.dart';
import 'package:her_circle/features/learn/domain/content_item.dart';
import 'package:her_circle/features/learn/domain/course.dart';
import 'package:her_circle/features/learn/domain/course_progress.dart';
import 'package:her_circle/features/learn/domain/daily_tip.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/profile/domain/user_profile.dart';
import 'package:her_circle/features/qa/domain/question.dart';
import 'package:her_circle/features/shop/domain/product.dart';
import 'package:her_circle/features/tracker/domain/cycle.dart';
import 'package:her_circle/features/tracker/domain/cycle_timeline.dart';
import 'package:her_circle/features/tracker/domain/prediction_service.dart';
import 'package:her_circle/features/tracker/domain/pregnancy_status.dart';
import 'package:her_circle/features/tracker/domain/tracker_enums.dart';

LocalizedText t(String value) => LocalizedText({'ru': value, 'en': value});

ContentItem content(
  String id, {
  ContentType type = ContentType.article,
  ContentCategory category = ContentCategory.cycleHealth,
  List<LifeStage> stages = const [],
  List<Interest> interests = const [],
  int? pregnancyWeek,
  String? courseId,
  AccessTier tier = AccessTier.free,
  int views = 0,
}) {
  return ContentItem(
    id: id,
    type: type,
    category: category,
    title: t(id),
    summary: t('summary $id'),
    durationMinutes: 5,
    stages: stages,
    interests: interests,
    pregnancyWeek: pregnancyWeek,
    courseId: courseId,
    tier: tier,
    viewCount: views,
  );
}

Product product(
  String id, {
  required ProductCategory category,
  List<CyclePhase> phases = const [],
  List<LifeStage> stages = const [],
  List<Interest> interests = const [],
  double rating = 4.5,
}) {
  return Product(
    id: id,
    category: category,
    title: t(id),
    description: t('d $id'),
    price: 1000,
    sellerId: 's1',
    phases: phases,
    stages: stages,
    interests: interests,
    rating: rating,
  );
}

Question question(String id, {int upvotes = 0, bool answered = true}) {
  return Question(
    id: id,
    body: t(id),
    category: ContentCategory.cycleHealth,
    askedAt: DateTime(2026, 9, 1),
    upvotes: upvotes,
    answers: [
      if (answered)
        Answer(
          id: 'a_$id',
          questionId: id,
          expertId: 'exp',
          body: t('answer'),
          answeredAt: DateTime(2026, 9, 2),
        ),
    ],
  );
}

CycleTimeline timelineFrom(DateTime? lastPeriod, {int cycleLength = 28}) {
  final cycles = lastPeriod == null
      ? <Cycle>[]
      : [
          Cycle(
            id: 'c1',
            startDate: lastPeriod,
            periodEndDate: lastPeriod.addDays(4),
          ),
        ];
  return CycleTimeline(
    cycles: cycles,
    logs: const {},
    prediction: const PredictionService().predict(
      cycles: cycles,
      fallbackCycleLength: cycleLength,
    ),
  );
}

UserProfile profileWith({
  AgeGroup age = AgeGroup.age25to34,
  LifeStage stage = LifeStage.trackingCycle,
  List<Interest> interests = const [],
  DateTime? lastPeriodStart,
}) {
  return UserProfile(
    uid: 'u1',
    ageGroup: age,
    lifeStage: stage,
    interests: interests,
    lastPeriodStart: lastPeriodStart,
    createdAt: DateTime(2026),
  );
}

FeedSources sources({
  List<ContentItem> content = const [],
  List<Course> courses = const [],
  List<DailyTip> tips = const [],
  List<Product> products = const [],
  List<Question> questions = const [],
  List<BabySize> babySizes = const [],
  Map<String, CourseProgress> progress = const {},
}) {
  return (
    content: content,
    courses: courses,
    tips: tips,
    products: products,
    questions: questions,
    babySizes: babySizes,
    progress: progress,
  );
}

void main() {
  const service = FeedService();
  final now = DateTime(2026, 9, 20);

  group('for you ranking', () {
    test('life stage outranks a matching interest', () {
      final feed = service.build(
        profile: profileWith(
          stage: LifeStage.pregnant,
          interests: const [Interest.nutrition],
        ),
        timeline: timelineFrom(null),
        sources: sources(
          content: [
            content('interest-only', interests: const [Interest.nutrition]),
            content('stage-match', stages: const [LifeStage.pregnant]),
          ],
        ),
        now: now,
      );

      expect(feed.forYou.first.id, 'stage-match');
    });

    test('more matching interests rank higher', () {
      final feed = service.build(
        profile: profileWith(
          interests: const [Interest.nutrition, Interest.mentalHealth],
        ),
        timeline: timelineFrom(null),
        sources: sources(
          content: [
            content('one', interests: const [Interest.nutrition]),
            content(
              'two',
              interests: const [Interest.nutrition, Interest.mentalHealth],
            ),
          ],
        ),
        now: now,
      );

      expect(feed.forYou.map((item) => item.id).take(2), ['two', 'one']);
    });

    test('popular items break ties', () {
      final feed = service.build(
        profile: profileWith(),
        timeline: timelineFrom(null),
        sources: sources(
          content: [
            content('quiet', views: 10),
            content('popular', views: 900),
          ],
        ),
        now: now,
      );

      expect(feed.forYou.first.id, 'popular');
    });

    test('the carousel is capped', () {
      final feed = service.build(
        profile: profileWith(),
        timeline: timelineFrom(null),
        sources: sources(
          content: [for (var i = 0; i < 20; i++) content('c$i', views: i)],
        ),
        now: now,
      );

      expect(feed.forYou.length, FeedService.forYouCount);
    });

    test('18+ content is hidden from under-16s', () {
      final items = [
        content('adult', category: ContentCategory.intimacy),
        content('safe'),
      ];
      final teen = service.build(
        profile: profileWith(
          age: AgeGroup.age10to15,
          stage: LifeStage.firstPeriod,
        ),
        timeline: timelineFrom(null),
        sources: sources(content: items),
        now: now,
      );
      final adult = service.build(
        profile: profileWith(),
        timeline: timelineFrom(null),
        sources: sources(content: items),
        now: now,
      );

      expect(teen.forYou.map((item) => item.id), isNot(contains('adult')));
      expect(adult.forYou.map((item) => item.id), contains('adult'));
    });
  });

  group('pregnancy', () {
    final lmp = DateTime(2026, 5, 18); // 125 days before 20 Sep 2026: week 18.

    test('dates the pregnancy and picks the baby size', () {
      final feed = service.build(
        profile: profileWith(stage: LifeStage.pregnant, lastPeriodStart: lmp),
        timeline: timelineFrom(lmp),
        sources: sources(
          babySizes: [
            BabySize(week: 18, name: t('sweet potato')),
            BabySize(week: 19, name: t('mango')),
            BabySize(week: 20, name: t('banana')),
          ],
        ),
        now: now,
      );

      expect(feed.pregnancy!.week, 18);
      expect(feed.pregnancy!.trimester, 2);
      expect(feed.babySize!.name.values['en'], 'sweet potato');
      expect(feed.pregnancy!.dueDate, DateTime(2026, 5, 18).addDays(280));
    });

    test('week-by-week lessons only show near the current week', () {
      final feed = service.build(
        profile: profileWith(stage: LifeStage.pregnant, lastPeriodStart: lmp),
        timeline: timelineFrom(lmp),
        sources: sources(
          content: [
            content(
              'w19',
              pregnancyWeek: 19,
              stages: const [LifeStage.pregnant],
            ),
            content(
              'w34',
              pregnancyWeek: 34,
              stages: const [LifeStage.pregnant],
            ),
          ],
        ),
        now: now,
      );

      final ids = feed.forYou.map((item) => item.id);
      expect(ids, contains('w19'));
      expect(ids, isNot(contains('w34')));
    });

    test('week-specific lessons are hidden when she is not pregnant', () {
      final feed = service.build(
        profile: profileWith(),
        timeline: timelineFrom(null),
        sources: sources(content: [content('w19', pregnancyWeek: 19)]),
        now: now,
      );
      expect(feed.forYou, isEmpty);
      expect(feed.pregnancy, isNull);
    });
  });

  group('tip of the day', () {
    final tips = [
      DailyTip(
        id: 'period',
        text: t('period'),
        phases: const [CyclePhase.period],
      ),
      DailyTip(id: 'any', text: t('any')),
    ];

    test('prefers a tip for the current phase', () {
      final feed = service.build(
        profile: profileWith(),
        // Period started today, so today is a period day.
        timeline: timelineFrom(now),
        sources: sources(tips: tips),
        now: now,
      );
      expect(feed.tip!.id, 'period');
    });

    test('is stable within a day and changes between days', () {
      final pool = [
        for (var i = 0; i < 5; i++) DailyTip(id: 't$i', text: t('t$i')),
      ];
      HomeFeed feedOn(DateTime date) => service.build(
        profile: profileWith(),
        timeline: timelineFrom(null),
        sources: sources(tips: pool),
        now: date,
      );

      expect(feedOn(now).tip!.id, feedOn(now).tip!.id);
      expect(feedOn(now).tip!.id, isNot(feedOn(now.addDays(1)).tip!.id));
    });
  });

  group('continue course', () {
    final course = Course(
      id: 'course1',
      title: t('course1'),
      modules: [
        CourseModule(
          id: 'm1',
          title: t('m1'),
          lessons: [
            Lesson(id: 'l1', title: t('l1'), durationMinutes: 5),
            Lesson(id: 'l2', title: t('l2'), durationMinutes: 5),
          ],
        ),
      ],
    );
    final second = Course(
      id: 'course2',
      title: t('course2'),
      modules: [
        CourseModule(
          id: 'm1',
          title: t('m1'),
          lessons: [Lesson(id: 'l1', title: t('l1'), durationMinutes: 5)],
        ),
      ],
    );
    final entries = [
      content('e1', type: ContentType.course, courseId: 'course1'),
      content('e2', type: ContentType.course, courseId: 'course2', views: 500),
    ];

    test('suggests the first lesson when nothing is started', () {
      final feed = service.build(
        profile: profileWith(),
        timeline: timelineFrom(null),
        sources: sources(content: entries, courses: [course, second]),
        now: now,
      );

      expect(feed.continueCourse!.isStarted, isFalse);
      expect(feed.continueCourse!.nextLesson.id, 'l1');
      expect(feed.continueCourse!.fraction, 0);
    });

    test('an unfinished started course wins over a better match', () {
      final feed = service.build(
        profile: profileWith(),
        timeline: timelineFrom(null),
        sources: sources(
          content: entries,
          courses: [course, second],
          progress: {
            'course1': CourseProgress(
              courseId: 'course1',
              completedLessonIds: const ['l1'],
              lastLessonId: 'l1',
              updatedAt: DateTime(2026, 9, 19),
            ),
          },
        ),
        now: now,
      );

      expect(feed.continueCourse!.course.id, 'course1');
      expect(feed.continueCourse!.nextLesson.id, 'l2');
      expect(feed.continueCourse!.fraction, 0.5);
    });

    test('a finished course is not offered again', () {
      final feed = service.build(
        profile: profileWith(),
        timeline: timelineFrom(null),
        sources: sources(
          content: [entries.first],
          courses: [course],
          progress: {
            'course1': CourseProgress(
              courseId: 'course1',
              completedLessonIds: const ['l1', 'l2'],
              updatedAt: DateTime(2026, 9, 19),
              completedAt: DateTime(2026, 9, 19),
            ),
          },
        ),
        now: now,
      );

      expect(feed.continueCourse, isNull);
    });
  });

  group('shop offers', () {
    final catalogue = [
      product(
        'pads',
        category: ProductCategory.periodCare,
        phases: const [CyclePhase.period, CyclePhase.predictedPeriod],
      ),
      product(
        'ovutest',
        category: ProductCategory.wellness,
        phases: const [CyclePhase.fertile],
      ),
      product(
        'preg-oil',
        category: ProductCategory.pregnancy,
        stages: const [LifeStage.pregnant],
      ),
      product(
        'cooling',
        category: ProductCategory.wellness,
        stages: const [LifeStage.menopause, LifeStage.perimenopause],
      ),
      product(
        'serum',
        category: ProductCategory.beauty,
        interests: const [Interest.beauty],
      ),
    ];

    test('period essentials appear three days before the period', () {
      // A 28-day cycle starting 26 Aug predicts the next period on 23 Sep,
      // which is three days after "today".
      final feed = service.build(
        profile: profileWith(),
        timeline: timelineFrom(DateTime(2026, 8, 26)),
        sources: sources(products: catalogue),
        now: now,
      );

      expect(feed.offerReason, OfferReason.periodSoon);
      expect(feed.offers.first.id, 'pads');
    });

    test('four days out is still too early', () {
      // 27 Aug + 28 days lands on 24 Sep, four days after "today".
      final feed = service.build(
        profile: profileWith(),
        timeline: timelineFrom(DateTime(2026, 8, 27)),
        sources: sources(products: catalogue),
        now: now,
      );
      expect(feed.offerReason, OfferReason.general);
    });

    test('during the period the heading changes', () {
      final feed = service.build(
        profile: profileWith(),
        timeline: timelineFrom(now),
        sources: sources(products: catalogue),
        now: now,
      );
      expect(feed.offerReason, OfferReason.periodNow);
      expect(feed.offers.first.id, 'pads');
    });

    test('trying to conceive gets fertility products in the window', () {
      // Cycle started 6 Sep, so 20 Sep sits in the fertile window.
      final feed = service.build(
        profile: profileWith(stage: LifeStage.tryingToConceive),
        timeline: timelineFrom(DateTime(2026, 9, 6)),
        sources: sources(products: catalogue),
        now: now,
      );

      expect(feed.offerReason, OfferReason.fertileWindow);
      expect(feed.offers.first.id, 'ovutest');
    });

    test('pregnancy and menopause override the cycle', () {
      final pregnant = service.build(
        profile: profileWith(stage: LifeStage.pregnant),
        timeline: timelineFrom(now),
        sources: sources(products: catalogue),
        now: now,
      );
      expect(pregnant.offerReason, OfferReason.pregnancy);
      expect(pregnant.offers.first.id, 'preg-oil');

      final menopause = service.build(
        profile: profileWith(stage: LifeStage.menopause),
        timeline: timelineFrom(now),
        sources: sources(products: catalogue),
        now: now,
      );
      expect(menopause.offerReason, OfferReason.menopause);
      expect(menopause.offers.first.id, 'cooling');
    });

    test('adult-only products are hidden from under-16s', () {
      final feed = service.build(
        profile: profileWith(
          age: AgeGroup.age10to15,
          stage: LifeStage.firstPeriod,
        ),
        timeline: timelineFrom(now),
        sources: sources(
          products: [
            ...catalogue,
            product(
              'intimate',
              category: ProductCategory.intimateHealth,
              phases: const [CyclePhase.period],
            ),
          ],
        ),
        now: now,
      );

      expect(feed.offerReason, OfferReason.periodNow);
      expect(feed.offers.map((p) => p.id), isNot(contains('intimate')));
    });

    test('offers are capped', () {
      final feed = service.build(
        profile: profileWith(interests: Interest.values),
        timeline: timelineFrom(now),
        sources: sources(
          products: [
            for (var i = 0; i < 12; i++)
              product(
                'p$i',
                category: ProductCategory.periodCare,
                phases: const [CyclePhase.period],
              ),
          ],
        ),
        now: now,
      );
      expect(feed.offers.length, FeedService.offerCount);
    });
  });

  group('trending questions', () {
    test('answered questions come first, then upvotes', () {
      final feed = service.build(
        profile: profileWith(),
        timeline: timelineFrom(null),
        sources: sources(
          questions: [
            question('unanswered', upvotes: 900, answered: false),
            question('low', upvotes: 10),
            question('high', upvotes: 100),
          ],
        ),
        now: now,
      );

      expect(feed.trendingQuestions.map((q) => q.id), [
        'high',
        'low',
        'unanswered',
      ]);
    });

    test('the list is capped', () {
      final feed = service.build(
        profile: profileWith(),
        timeline: timelineFrom(null),
        sources: sources(
          questions: [for (var i = 0; i < 10; i++) question('q$i', upvotes: i)],
        ),
        now: now,
      );
      expect(feed.trendingQuestions.length, FeedService.questionCount);
    });
  });

  test('an empty catalogue yields an empty feed', () {
    final feed = service.build(
      profile: profileWith(),
      timeline: timelineFrom(null),
      sources: sources(),
      now: now,
    );
    expect(feed.isEmpty, isTrue);
  });
}
