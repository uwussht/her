import 'app_user.dart';

/// Result of requesting a phone verification code.
sealed class PhoneVerification {
  const PhoneVerification();
}

/// An SMS was sent. Pass [verificationId] to [AuthRepository.verifyPhoneCode].
class PhoneCodeSent extends PhoneVerification {
  const PhoneCodeSent({required this.verificationId, this.resendToken});

  final String verificationId;
  final int? resendToken;
}

/// Android verified the number instantly (SMS retriever), so she is
/// already signed in.
class PhoneAutoVerified extends PhoneVerification {
  const PhoneAutoVerified(this.user);

  final AppUser user;
}

/// Authentication backend. Methods throw `AuthFailure` on error.
abstract interface class AuthRepository {
  AppUser? get currentUser;

  Stream<AppUser?> authStateChanges();

  /// [phoneNumber] is E.164, e.g. `+77011234567`.
  Future<PhoneVerification> sendPhoneCode(
    String phoneNumber, {
    int? resendToken,
  });

  Future<AppUser> verifyPhoneCode({
    required String verificationId,
    required String smsCode,
  });

  Future<AppUser> signInWithEmail({
    required String email,
    required String password,
  });

  Future<AppUser> signUpWithEmail({
    required String email,
    required String password,
  });

  Future<void> sendPasswordReset(String email);

  Future<AppUser> signInWithGoogle();

  Future<void> signOut();

  /// Language for SMS and emails sent by the backend.
  Future<void> setLanguageCode(String languageCode);
}
