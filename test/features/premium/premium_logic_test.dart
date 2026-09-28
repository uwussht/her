import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/features/premium/domain/premium_membership.dart';
import 'package:her_circle/features/premium/domain/premium_plan.dart';
import 'package:her_circle/features/premium/domain/premium_status.dart';
import 'package:her_circle/features/premium/domain/referral.dart';

void main() {
  final now = DateTime(2026, 9, 28, 10);

  group('PremiumPlan', () {
    test('quotes a price and a per-month equivalent', () {
      expect(PremiumPlan.monthly.months, 1);
      expect(PremiumPlan.yearly.months, 12);
      expect(
        PremiumPlan.yearly.pricePerMonthTenge,
        (PremiumPlan.yearly.priceTenge / 12).round(),
      );
    });

    test('the yearly plan really is cheaper', () {
      expect(PremiumPlan.yearly.savingsPercent, greaterThan(0));
      expect(
        PremiumPlan.yearly.priceTenge,
        lessThan(PremiumPlan.monthly.priceTenge * 12),
      );
      // Nothing to save on the monthly plan, so no badge.
      expect(PremiumPlan.monthly.savingsPercent, 0);
    });

    test('the trial is the seven days the spec promises', () {
      expect(PremiumPlan.trialDays, 7);
    });
  });

  group('PremiumMembership', () {
    test('free means no access', () {
      expect(PremiumMembership.free.hasAccessOn(now), isFalse);
      expect(PremiumMembership.free.canStartTrial, isTrue);
    });

    test('the trial lasts seven days and is offered once', () {
      final trial = PremiumMembership.free.startTrial(now);

      expect(trial.status, PremiumStatus.trial);
      expect(trial.hasAccessOn(now), isTrue);
      expect(trial.trialDaysLeft(now), 7);
      expect(trial.hasAccessOn(now.add(const Duration(days: 6))), isTrue);
      expect(trial.trialDaysLeft(now.add(const Duration(days: 6))), 1);
      // Day seven is the end, exclusive.
      expect(trial.hasAccessOn(now.add(const Duration(days: 7))), isFalse);
      expect(trial.trialDaysLeft(now.add(const Duration(days: 30))), 0);

      // Once used, never offered again — even after it lapses.
      expect(trial.canStartTrial, isFalse);
      expect(
        trial.cancel(now.add(const Duration(days: 8))).canStartTrial,
        isFalse,
      );
    });

    test('subscribing buys the plan length', () {
      final monthly = PremiumMembership.free.subscribe(
        PremiumPlan.monthly,
        now,
      );
      expect(monthly.status, PremiumStatus.active);
      expect(monthly.expiresAt, DateTime(2026, 10, 28, 10, 0));
      expect(monthly.hasAccessOn(DateTime(2026, 10, 27)), isTrue);
      expect(monthly.hasAccessOn(DateTime(2026, 11, 1)), isFalse);

      final yearly = PremiumMembership.free.subscribe(PremiumPlan.yearly, now);
      expect(yearly.expiresAt, DateTime(2027, 9, 28, 10, 0));
    });

    test('renewing extends the period she already paid for', () {
      final first = PremiumMembership.free.subscribe(PremiumPlan.monthly, now);
      final renewed = first.subscribe(
        PremiumPlan.monthly,
        now.add(const Duration(days: 20)),
      );
      // Not 20 days lost: the new month starts where the old one ended.
      expect(renewed.expiresAt, DateTime(2026, 11, 28, 10, 0));
    });

    test('cancelling keeps the access she paid for', () {
      final active = PremiumMembership.free.subscribe(PremiumPlan.yearly, now);
      final cancelled = active.cancel(now);

      expect(cancelled.status, PremiumStatus.active);
      expect(cancelled.plan, isNull, reason: 'no renewal is scheduled');
      expect(cancelled.hasAccessOn(now), isTrue);
      expect(cancelled.hasAccessOn(DateTime(2027, 10, 1)), isFalse);
    });

    test('cancelling an expired subscription drops to free', () {
      final expired = PremiumMembership.free
          .subscribe(PremiumPlan.monthly, now)
          .cancel(DateTime(2027));
      expect(expired.status, PremiumStatus.free);
      expect(expired.hasAccessOn(DateTime(2027)), isFalse);
    });

    test('referral months are held until she subscribes, then applied', () {
      final held = PremiumMembership.free.addBonusMonths(2, now);
      expect(held.bonusMonths, 2);
      expect(
        held.hasAccessOn(now),
        isFalse,
        reason: 'bonus months are not access on their own',
      );

      final subscribed = held.subscribe(PremiumPlan.monthly, now);
      expect(subscribed.bonusMonths, 0);
      // One paid month plus the two she earned.
      expect(subscribed.expiresAt, DateTime(2026, 12, 28, 10, 0));
    });

    test('a referral month on an active subscription extends it', () {
      final active = PremiumMembership.free.subscribe(PremiumPlan.monthly, now);
      final extended = active.addBonusMonths(1, now);
      expect(extended.expiresAt, DateTime(2026, 11, 28, 10, 0));
      expect(extended.bonusMonths, 0);
    });

    test('survives a round trip through JSON', () {
      final membership = PremiumMembership.free
          .startTrial(now)
          .addBonusMonths(1, now);
      expect(PremiumMembership.fromJson(membership.toJson()), membership);
    });
  });

  group('ReferralRules', () {
    test('one month per friend, up to the cap', () {
      expect(ReferralRules.monthsFor(0), 0);
      expect(ReferralRules.monthsFor(1), 1);
      expect(ReferralRules.monthsFor(5), 5);
      expect(
        ReferralRules.monthsFor(50),
        ReferralRules.maxRewardedInvites,
        reason: 'a shared code cannot mean free premium forever',
      );
    });

    test('codes are stable per account and readable', () {
      final code = ReferralRules.codeForUid('test-user');
      expect(code, hasLength(6));
      expect(code, ReferralRules.codeForUid('test-user'));
      expect(code, isNot(ReferralRules.codeForUid('someone-else')));
      expect(code, code.toUpperCase());
      expect(code, isNot(contains('O')));
      expect(code, isNot(contains('0')));
    });
  });

  group('ReferralState', () {
    test('tracks what is owed and what has been paid out', () {
      var state = ReferralState(code: ReferralRules.codeForUid('u1'));
      expect(state.pendingMonths, 0);

      state = state.withInvite();
      expect(state.invitedCount, 1);
      expect(state.pendingMonths, 1);

      state = state.credited(1);
      expect(state.rewardedMonths, 1);
      expect(state.pendingMonths, 0, reason: 'never paid twice');

      state = state.withInvite().withInvite();
      expect(state.pendingMonths, 2);
    });

    test('stops owing months past the cap', () {
      var state = const ReferralState(
        code: 'ABC123',
        invitedCount: ReferralRules.maxRewardedInvites,
        rewardedMonths: ReferralRules.maxRewardedInvites,
      );
      state = state.withInvite();
      expect(state.pendingMonths, 0);
    });
  });
}
