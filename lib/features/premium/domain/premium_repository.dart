import 'premium_membership.dart';
import 'referral.dart';

/// Her membership, on this device.
///
/// Real billing (Google Play or Kaspi) will own the source of truth; this
/// keeps the app honest in the meantime and is what the UI reads.
abstract interface class PremiumRepository {
  PremiumMembership read();

  Future<void> save(PremiumMembership membership);
}

abstract interface class ReferralRepository {
  /// Her referral state, created from her uid on first read.
  ReferralState read();

  Future<void> save(ReferralState state);
}
