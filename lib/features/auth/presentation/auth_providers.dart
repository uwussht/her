import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/l10n/locale_controller.dart';
import '../../../core/services/storage/preferences_service.dart';
import '../../../core/utils/app_env.dart';
import '../data/firebase_auth_repository.dart';
import '../data/mock_auth_repository.dart';
import '../domain/app_user.dart';
import '../domain/auth_repository.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final AuthRepository repository = AppEnv.useMocks
      ? MockAuthRepository(ref.watch(preferencesServiceProvider))
      : FirebaseAuthRepository();
  // SMS codes and emails go out in the app language.
  ref.listen(
    localeControllerProvider,
    (_, locale) => repository.setLanguageCode(locale.locale.languageCode),
    fireImmediately: true,
  );
  return repository;
}

@Riverpod(keepAlive: true)
Stream<AppUser?> authState(Ref ref) =>
    ref.watch(authRepositoryProvider).authStateChanges();

/// The signed-in user, or null. Synchronous: falls back to the repository's
/// cached user while the auth stream is starting.
@Riverpod(keepAlive: true)
AppUser? currentUser(Ref ref) {
  return switch (ref.watch(authStateProvider)) {
    AsyncData(:final value) => value,
    _ => ref.read(authRepositoryProvider).currentUser,
  };
}
