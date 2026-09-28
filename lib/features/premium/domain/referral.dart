import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral.freezed.dart';
part 'referral.g.dart';

/// Invite a friend: both get a month of premium (spec 5.9).
///
/// Pure, so "how many months has she earned" is a test rather than a guess,
/// and the same rule can be enforced on the backend when it exists.
@freezed
abstract class ReferralState with _$ReferralState {
  const factory ReferralState({
    /// Her own code, shown and shared. Derived from her uid so it is stable
    /// across reinstalls.
    required String code,

    /// Friends who signed up with her code.
    @Default(0) int invitedCount,

    /// Months already credited to her membership.
    @Default(0) int rewardedMonths,
  }) = _ReferralState;

  const ReferralState._();

  factory ReferralState.fromJson(Map<String, dynamic> json) =>
      _$ReferralStateFromJson(json);

  /// Months earned but not yet credited.
  int get pendingMonths {
    final earned = ReferralRules.monthsFor(invitedCount);
    return earned <= rewardedMonths ? 0 : earned - rewardedMonths;
  }

  ReferralState withInvite() => copyWith(invitedCount: invitedCount + 1);

  ReferralState credited(int months) =>
      copyWith(rewardedMonths: rewardedMonths + months);
}

abstract final class ReferralRules {
  /// One free month per friend, up to a cap so a shared code cannot become a
  /// free subscription forever.
  static const int monthsPerInvite = 1;
  static const int maxRewardedInvites = 12;

  static int monthsFor(int invitedCount) {
    final counted = invitedCount > maxRewardedInvites
        ? maxRewardedInvites
        : invitedCount;
    return counted <= 0 ? 0 : counted * monthsPerInvite;
  }

  /// Builds her code from her account id: six characters, uppercase, stable.
  ///
  /// Not a secret — it only identifies who invited whom — so a readable hash
  /// of the uid is enough.
  static String codeForUid(String uid) {
    if (uid.isEmpty) return 'HER123';
    var hash = 0;
    for (final unit in uid.codeUnits) {
      hash = (hash * 31 + unit) & 0x7fffffff;
    }
    const alphabet = 'ABCDEFGHJKLMNPQRTUVWXYZ23456789';
    final code = StringBuffer();
    var value = hash;
    for (var i = 0; i < 6; i++) {
      code.write(alphabet[value % alphabet.length]);
      value ~/= alphabet.length;
    }
    return code.toString();
  }
}
