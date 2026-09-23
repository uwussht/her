import '../../../core/services/storage/local_store.dart';
import '../domain/profile_repository.dart';
import '../domain/user_profile.dart';

/// Keeps the profile on-device only. Cloud sync (opt-in, encrypted) plugs in
/// behind [ProfileRepository] later.
class LocalProfileRepository implements ProfileRepository {
  const LocalProfileRepository(this._store);

  final LocalStore _store;

  static String _key(String uid) => 'profile.$uid';

  @override
  UserProfile? read(String uid) {
    final json = _store.readJson(_key(uid));
    return json == null ? null : UserProfile.fromJson(json);
  }

  @override
  Future<void> save(UserProfile profile) =>
      _store.writeJson(_key(profile.uid), profile.toJson());

  @override
  Future<void> delete(String uid) => _store.delete(_key(uid));
}
