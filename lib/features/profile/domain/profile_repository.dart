import 'user_profile.dart';

abstract interface class ProfileRepository {
  UserProfile? read(String uid);

  Future<void> save(UserProfile profile);

  Future<void> delete(String uid);
}
