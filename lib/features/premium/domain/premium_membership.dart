import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/date_utils.dart';
import 'premium_plan.dart';
import 'premium_status.dart';

part 'premium_membership.freezed.dart';
part 'premium_membership.g.dart';

/// Her subscription, as this device knows it.
///
/// All the date arithmetic lives here and is pure, so "does she have premium
/// today" never depends on where it is called from. The store will own this
/// once real billing exists; the shape does not change.
@freezed
abstract class PremiumMembership with _$PremiumMembership {
  const factory PremiumMembership({
    @Default(PremiumStatus.free) PremiumStatus status,
    PremiumPlan? plan,

    /// When the trial or the subscription began.
    DateTime? startedAt,

    /// End of the free trial, exclusive.
    DateTime? trialEndsAt,

    /// When the current paid period runs out, exclusive.
    DateTime? expiresAt,

    /// Months granted by referrals, already folded into [expiresAt] when she
    /// is subscribed and held here until then.
    @Default(0) int bonusMonths,

    /// True once she has used the free trial, so it is offered only once.
    @Default(false) bool trialUsed,
  }) = _PremiumMembership;

  const PremiumMembership._();

  factory PremiumMembership.fromJson(Map<String, dynamic> json) =>
      _$PremiumMembershipFromJson(json);

  static const PremiumMembership free = PremiumMembership();

  /// Whether she has access on [now].
  ///
  /// A membership with no end date is treated as open-ended, which is what a
  /// referral-only grant looks like before billing exists.
  bool hasAccessOn(DateTime now) {
    final end = switch (status) {
      PremiumStatus.free => null,
      PremiumStatus.trial => trialEndsAt,
      PremiumStatus.active => expiresAt,
    };
    if (status == PremiumStatus.free) return false;
    return end == null || now.isBefore(end);
  }

  /// Whole days left in the trial, 0 once it is over.
  int trialDaysLeft(DateTime now) {
    final end = trialEndsAt;
    if (status != PremiumStatus.trial || end == null) return 0;
    final days = now.dateOnly.daysUntil(end.dateOnly);
    return days < 0 ? 0 : days;
  }

  /// Whether the trial can still be offered (spec 5.9: seven days, once).
  bool get canStartTrial => status == PremiumStatus.free && !trialUsed;

  /// Starts the seven-day trial.
  PremiumMembership startTrial(DateTime now) => copyWith(
    status: PremiumStatus.trial,
    startedAt: now,
    trialEndsAt: now.add(const Duration(days: PremiumPlan.trialDays)),
    trialUsed: true,
  );

  /// Applies a successful payment for [plan], adding any referral months she
  /// has been holding.
  PremiumMembership subscribe(PremiumPlan plan, DateTime now) {
    final from = hasAccessOn(now) && status == PremiumStatus.active
        ? (expiresAt ?? now)
        : now;
    return copyWith(
      status: PremiumStatus.active,
      plan: plan,
      startedAt: startedAt ?? now,
      trialEndsAt: null,
      expiresAt: from.addMonths(plan.months + bonusMonths),
      bonusMonths: 0,
    );
  }

  /// Ends the subscription. Access lasts until the period she paid for runs
  /// out, which is how she would expect a cancellation to behave.
  PremiumMembership cancel(DateTime now) {
    if (status == PremiumStatus.active && (expiresAt?.isAfter(now) ?? false)) {
      return copyWith(plan: null);
    }
    return PremiumMembership(trialUsed: trialUsed, bonusMonths: bonusMonths);
  }

  /// Adds a referral reward: a free month now if she is subscribed, or one
  /// held for when she subscribes.
  PremiumMembership addBonusMonths(int months, DateTime now) {
    if (months <= 0) return this;
    if (status == PremiumStatus.active && expiresAt != null) {
      return copyWith(expiresAt: expiresAt!.addMonths(months));
    }
    return copyWith(bonusMonths: bonusMonths + months);
  }
}
