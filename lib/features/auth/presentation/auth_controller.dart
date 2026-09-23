import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/auth_repository.dart';
import 'auth_providers.dart';

part 'auth_controller.g.dart';

/// Runs auth actions for the sign-in screens and exposes loading / error
/// state. Navigation after sign-in is handled by the router redirect.
@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  AuthRepository get _repo => ref.read(authRepositoryProvider);

  /// Returns null when sending failed. The error is in [state].
  Future<PhoneVerification?> sendPhoneCode(
    String phoneNumber, {
    int? resendToken,
  }) => _run(() => _repo.sendPhoneCode(phoneNumber, resendToken: resendToken));

  Future<void> verifyPhoneCode({
    required String verificationId,
    required String smsCode,
  }) => _run(
    () =>
        _repo.verifyPhoneCode(verificationId: verificationId, smsCode: smsCode),
  );

  Future<void> signInWithEmail(String email, String password) =>
      _run(() => _repo.signInWithEmail(email: email, password: password));

  Future<void> signUpWithEmail(String email, String password) =>
      _run(() => _repo.signUpWithEmail(email: email, password: password));

  /// Returns true when the reset email was sent.
  Future<bool> sendPasswordReset(String email) async {
    final result = await _run(() async {
      await _repo.sendPasswordReset(email);
      return true;
    });
    return result ?? false;
  }

  Future<void> signInWithGoogle() => _run(_repo.signInWithGoogle);

  Future<T?> _run<T>(Future<T> Function() action) async {
    state = const AsyncLoading();
    T? result;
    final next = await AsyncValue.guard(() async {
      result = await action();
    });
    if (ref.mounted) state = next;
    return next.hasError ? null : result;
  }
}
