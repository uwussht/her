import '../../../core/services/storage/local_store.dart';
import '../domain/premium_membership.dart';
import '../domain/premium_repository.dart';
import '../domain/referral.dart';

/// Membership in the encrypted on-device store.
class LocalPremiumRepository implements PremiumRepository {
  const LocalPremiumRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _key => 'premium.membership.$_uid';

  @override
  PremiumMembership read() {
    final json = _store.readJson(_key);
    return json == null
        ? PremiumMembership.free
        : PremiumMembership.fromJson(json);
  }

  @override
  Future<void> save(PremiumMembership membership) =>
      _store.writeJson(_key, membership.toJson());
}

class LocalReferralRepository implements ReferralRepository {
  const LocalReferralRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _key => 'premium.referral.$_uid';

  @override
  ReferralState read() {
    final json = _store.readJson(_key);
    return json == null
        ? ReferralState(code: ReferralRules.codeForUid(_uid))
        : ReferralState.fromJson(json);
  }

  @override
  Future<void> save(ReferralState state) =>
      _store.writeJson(_key, state.toJson());
}
