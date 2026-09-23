import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage/local_store.dart';
import '../../auth/presentation/auth_providers.dart';
import '../data/local_profile_repository.dart';
import '../domain/profile_repository.dart';
import '../domain/user_profile.dart';

part 'user_profile_controller.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) =>
    LocalProfileRepository(ref.watch(localStoreProvider));

/// The signed-in user's personalization, or null before the quiz.
@Riverpod(keepAlive: true)
class UserProfileController extends _$UserProfileController {
  @override
  UserProfile? build() {
    final user = ref.watch(currentUserProvider);
    if (user == null) return null;
    return ref.watch(profileRepositoryProvider).read(user.uid);
  }

  Future<void> save(UserProfile profile) async {
    await ref.read(profileRepositoryProvider).save(profile);
    state = profile;
  }
}
