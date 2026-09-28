import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/localized_text.dart';
import 'package:her_circle/features/circle/data/mock_link_service.dart';
import 'package:her_circle/features/circle/domain/circle_link.dart';
import 'package:her_circle/features/circle/domain/circle_repository.dart';
import 'package:her_circle/features/circle/domain/family_lessons.dart';
import 'package:her_circle/features/circle/domain/invite_code.dart';
import 'package:her_circle/features/circle/domain/partner_summary.dart';
import 'package:her_circle/features/circle/domain/share_scope.dart';
import 'package:her_circle/features/circle/domain/support_tips.dart';
import 'package:her_circle/features/learn/domain/content_item.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/profile/domain/user_profile.dart';
import 'package:her_circle/features/tracker/domain/cycle.dart';
import 'package:her_circle/features/tracker/domain/cycle_timeline.dart';
import 'package:her_circle/features/tracker/domain/daily_log.dart';
import 'package:her_circle/features/tracker/domain/prediction_service.dart';
import 'package:her_circle/features/tracker/domain/tracker_enums.dart';

void main() {
  group('InviteCode', () {
    test('is six characters with no look-alikes', () {
      final code = InviteCode.generate(random: Random(7));
      expect(code.value, hasLength(InviteCode.length));
      expect(code.value, matches(RegExp('^[${InviteCode.alphabet}]+\$')));
      expect(InviteCode.alphabet, isNot(contains('O')));
      expect(InviteCode.alphabet, isNot(contains('0')));
      expect(InviteCode.alphabet, isNot(contains('I')));
      expect(InviteCode.alphabet, isNot(contains('1')));
    });

    test('reads back what she typed, however she typed it', () {
      const code = 'ABCD2F';
      expect(InviteCode.normalize('abcd2f'), code);
      expect(InviteCode.normalize(' abc-d2f '), code);
      expect(InviteCode.isValid('abc d2f'), isTrue);
    });

    test('maps the characters people confuse', () {
      // O/0 → Q, I/1 → J, S/5 → Z, all of which are in the alphabet.
      expect(InviteCode.normalize('O0I1S5'), 'QQJJZZ');
      expect(InviteCode.isValid('O0I1S5'), isTrue);
    });

    test('rejects the wrong length', () {
      expect(InviteCode.isValid('ABC'), isFalse);
      expect(InviteCode.isValid(''), isFalse);
    });

    test('formats for reading aloud and carries a deep link', () {
      const code = InviteCode('ABCD2F');
      expect(code.formatted, 'ABC-D2F');
      final uri = code.linkFor('hercircle');
      expect(uri.scheme, 'hercircle');
      expect(uri.queryParameters['code'], 'ABCD2F');
    });
  });

  group('PartnerSummaryService', () {
    const service = PartnerSummaryService();
    final now = DateTime(2026, 9, 28);
    final cycles = [
      Cycle(
        id: 'c0',
        startDate: DateTime(2026, 8, 23),
        periodEndDate: DateTime(2026, 8, 27),
      ),
      Cycle(
        id: 'c1',
        startDate: DateTime(2026, 9, 20),
        periodEndDate: DateTime(2026, 9, 24),
      ),
    ];
    final timeline = CycleTimeline(
      cycles: cycles,
      logs: const {},
      prediction: const PredictionService().predict(cycles: cycles),
    );
    final profile = UserProfile(
      uid: 'u1',
      ageGroup: AgeGroup.age25to34,
      lifeStage: LifeStage.trackingCycle,
      cycleLength: 28,
      lastPeriodStart: DateTime(2026, 9, 20),
      createdAt: DateTime(2026),
    );

    test('shares nothing when every switch is off', () {
      final summary = service.build(
        shares: const {},
        profile: profile,
        timeline: timeline,
        mood: Mood.low,
        symptoms: const [Symptom.cramps],
        now: now,
      );

      expect(summary.isEmpty, isTrue);
      expect(summary.cycleDay, isNull);
      expect(summary.phase, isNull);
      expect(summary.mood, isNull);
      expect(summary.symptoms, isEmpty);
      expect(summary.stage, isNull);
      // A tip is still offered, and it cannot reveal a mood she withheld.
      expect(summary.tip, SupportTip.general);
    });

    test('shares exactly the scopes she turned on', () {
      final summary = service.build(
        shares: const {ShareScope.cyclePhase},
        profile: profile,
        timeline: timeline,
        mood: Mood.awful,
        symptoms: const [Symptom.cramps],
        now: now,
      );

      expect(summary.cycleDay, 9);
      expect(summary.phase, isNotNull);
      expect(summary.mood, isNull, reason: 'mood was not shared');
      expect(summary.symptoms, isEmpty, reason: 'symptoms were not shared');
      expect(
        summary.tip,
        isNot(SupportTip.lowMoodListen),
        reason: 'a withheld mood must not leak through the tip',
      );
    });

    test('a shared low mood outranks the cycle phase in the tip', () {
      final summary = service.build(
        shares: const {ShareScope.cyclePhase, ShareScope.mood},
        profile: profile,
        timeline: timeline,
        mood: Mood.awful,
        now: now,
      );
      expect(summary.mood, Mood.awful);
      expect(summary.tip, SupportTip.lowMoodListen);
    });

    test('pregnancy replaces the cycle, and needs its own scope', () {
      final pregnant = profile.copyWith(
        lifeStage: LifeStage.pregnant,
        lastPeriodStart: DateTime(2026, 5, 1),
      );

      final withoutScope = service.build(
        shares: const {ShareScope.cyclePhase},
        profile: pregnant,
        timeline: timeline,
        now: now,
      );
      expect(withoutScope.pregnancyWeek, isNull);
      expect(
        withoutScope.cycleDay,
        isNull,
        reason: 'a pregnant user has no cycle day to share',
      );

      final withScope = service.build(
        shares: const {ShareScope.lifeStage, ShareScope.pregnancy},
        profile: pregnant,
        timeline: timeline,
        now: now,
      );
      expect(withScope.pregnancyWeek, greaterThan(20));
      expect(withScope.dueDate, isNotNull);
      expect(withScope.stage, LifeStage.pregnant);
      // Week 22: appointments rather than heavy lifting, which is the
      // third-trimester tip.
      expect(withScope.tip, SupportTip.pregnancyAppointments);
      expect(
        SupportTip.forDay(stage: LifeStage.pregnant, pregnancyWeek: 34),
        SupportTip.pregnancyChores,
      );
    });

    test('a daughter link starts with nothing shared', () {
      expect(ShareScope.familyDefaults, isEmpty);
      expect(
        ShareScope.partnerDefaults,
        containsAll([ShareScope.cyclePhase, ShareScope.mood]),
      );
      expect(ShareScope.partnerDefaults, isNot(contains(ShareScope.symptoms)));
    });
  });

  group('SupportTip', () {
    test('follows the stage before the phase', () {
      expect(
        SupportTip.forDay(
          phase: CyclePhase.luteal,
          stage: LifeStage.postpartum,
        ),
        SupportTip.postpartumNight,
      );
      expect(
        SupportTip.forDay(phase: CyclePhase.period),
        SupportTip.periodComfort,
      );
      expect(
        SupportTip.forDay(phase: CyclePhase.fertile),
        SupportTip.fertileHonesty,
      );
    });

    test('falls back to something always true', () {
      expect(SupportTip.forDay(), SupportTip.general);
      expect(
        SupportTip.forDay(phase: CyclePhase.unknown, mood: Mood.great),
        SupportTip.greatMoodCelebrate,
      );
    });
  });

  group('FamilyLessons', () {
    const lessons = FamilyLessons();

    ContentItem item(String id, ContentCategory category, ContentType type) =>
        ContentItem(
          id: id,
          type: type,
          category: category,
          title: const LocalizedText({'ru': 'т', 'en': 't'}),
          summary: const LocalizedText({'ru': 'с', 'en': 's'}),
          durationMinutes: 5,
          publishedAt: DateTime(2026),
        );

    test('never includes the 18+ section', () {
      final selected = lessons.select([
        item('intimacy', ContentCategory.intimacy, ContentType.article),
        item('body', ContentCategory.myBody, ContentType.article),
      ]);
      expect(selected.map((item) => item.id), ['body']);
    });

    test('puts the teen section first and leaves courses out', () {
      final selected = lessons.select([
        item('nutrition', ContentCategory.nutrition, ContentType.article),
        item('course', ContentCategory.myBody, ContentType.course),
        item('body', ContentCategory.myBody, ContentType.video),
      ]);
      expect(selected.map((item) => item.id), ['body', 'nutrition']);
    });

    test('caps the list', () {
      final many = [
        for (var i = 0; i < 20; i++)
          item('c$i', ContentCategory.cycleHealth, ContentType.article),
      ];
      expect(lessons.select(many), hasLength(FamilyLessons.defaultLimit));
    });
  });

  group('MockLinkService', () {
    const service = MockLinkService(latency: Duration.zero);
    final mine = CircleLink(
      id: 'l1',
      kind: LinkKind.partner,
      side: LinkSide.sharer,
      code: 'ABCD2F',
      createdAt: DateTime(2026, 9, 28),
    );

    Future<LinkFailureReason> failureFor(
      String code, {
      List<CircleLink> existing = const [],
      LinkKind kind = LinkKind.partner,
    }) async {
      try {
        await service.redeem(code: code, kind: kind, existing: existing);
      } on LinkFailure catch (failure) {
        return failure.reason;
      }
      fail('expected a LinkFailure');
    }

    test('pairs her with the peer on a good code', () async {
      final link = await service.redeem(
        code: 'qrt-234',
        kind: LinkKind.partner,
        existing: const [],
      );
      expect(link.side, LinkSide.viewer);
      expect(link.isActive, isTrue);
      expect(link.code, 'QRT234');
      expect(link.shares, isEmpty, reason: 'the viewer shares nothing');
      expect(link.peerName, MockLinkService.demoPeerNames[LinkKind.partner]);
    });

    test('refuses a malformed code, her own code and a second link', () async {
      expect(await failureFor('AB'), LinkFailureReason.malformed);
      expect(
        await failureFor('abc-d2f', existing: [mine]),
        LinkFailureReason.ownCode,
      );
      expect(
        await failureFor(
          'QRT234',
          existing: [mine.copyWith(status: LinkStatus.active)],
        ),
        LinkFailureReason.alreadyLinked,
      );
    });

    test('a family code is not blocked by a partner link', () async {
      final link = await service.redeem(
        code: 'QRT234',
        kind: LinkKind.family,
        existing: [mine.copyWith(status: LinkStatus.active)],
      );
      expect(link.kind, LinkKind.family);
    });
  });

  group('CircleLink', () {
    test('survives a round trip through JSON', () {
      final link = CircleLink(
        id: 'l1',
        kind: LinkKind.family,
        side: LinkSide.sharer,
        code: 'ABCD2F',
        status: LinkStatus.active,
        createdAt: DateTime(2026, 9, 28),
        linkedAt: DateTime(2026, 9, 29),
        peerName: 'Мама',
        shares: const {ShareScope.mood},
      );
      final restored = CircleLink.fromJson(link.toJson());
      expect(restored, link);
      expect(restored.allows(ShareScope.mood), isTrue);
      expect(restored.allows(ShareScope.symptoms), isFalse);
    });
  });

  test('a logged day is what the summary reads moods from', () {
    // Guards the shape the providers pass in: DailyLog fields feed the
    // summary directly, so a rename in the tracker breaks here first.
    final log = DailyLog(
      date: DateTime(2026, 9, 28),
      mood: Mood.good,
      symptoms: const [Symptom.cramps],
    );
    final summary = const PartnerSummaryService().build(
      shares: const {ShareScope.mood, ShareScope.symptoms},
      profile: null,
      timeline: CycleTimeline(
        cycles: const [],
        logs: const {},
        prediction: null,
      ),
      mood: log.mood,
      symptoms: log.symptoms,
      now: DateTime(2026, 9, 28),
    );
    expect(summary.mood, Mood.good);
    expect(summary.symptoms, [Symptom.cramps]);
  });
}
