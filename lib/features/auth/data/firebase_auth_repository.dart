import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' hide PhoneCodeSent;
import 'package:google_sign_in/google_sign_in.dart';

import '../domain/app_user.dart';
import '../domain/auth_failure.dart';
import '../domain/auth_repository.dart';

/// Firebase Auth backend: phone OTP, email/password and Google.
class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({FirebaseAuth? auth, GoogleSignIn? googleSignIn})
    : _auth = auth ?? FirebaseAuth.instance,
      _google = googleSignIn ?? GoogleSignIn.instance;

  final FirebaseAuth _auth;
  final GoogleSignIn _google;
  Future<void>? _googleInit;

  @override
  AppUser? get currentUser => _map(_auth.currentUser);

  @override
  Stream<AppUser?> authStateChanges() => _auth.authStateChanges().map(_map);

  @override
  Future<PhoneVerification> sendPhoneCode(
    String phoneNumber, {
    int? resendToken,
  }) {
    final completer = Completer<PhoneVerification>();
    unawaited(
      _auth
          .verifyPhoneNumber(
            phoneNumber: phoneNumber,
            forceResendingToken: resendToken,
            timeout: const Duration(seconds: 60),
            verificationCompleted: (credential) async {
              // Android SMS auto-retrieval: sign in without typing the code.
              try {
                final result = await _auth.signInWithCredential(credential);
                if (!completer.isCompleted) {
                  completer.complete(PhoneAutoVerified(_map(result.user)!));
                }
              } on FirebaseAuthException catch (e) {
                if (!completer.isCompleted) {
                  completer.completeError(_failure(e));
                }
              }
            },
            verificationFailed: (e) {
              if (!completer.isCompleted) completer.completeError(_failure(e));
            },
            codeSent: (verificationId, token) {
              if (!completer.isCompleted) {
                completer.complete(
                  PhoneCodeSent(
                    verificationId: verificationId,
                    resendToken: token,
                  ),
                );
              }
            },
            codeAutoRetrievalTimeout: (_) {},
          )
          .catchError((Object e) {
            if (!completer.isCompleted) completer.completeError(_failure(e));
          }),
    );
    return completer.future;
  }

  @override
  Future<AppUser> verifyPhoneCode({
    required String verificationId,
    required String smsCode,
  }) {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return _guard(() => _auth.signInWithCredential(credential));
  }

  @override
  Future<AppUser> signInWithEmail({
    required String email,
    required String password,
  }) {
    return _guard(
      () => _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      ),
    );
  }

  @override
  Future<AppUser> signUpWithEmail({
    required String email,
    required String password,
  }) {
    return _guard(
      () => _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      ),
    );
  }

  @override
  Future<void> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw _failure(e);
    }
  }

  @override
  Future<AppUser> signInWithGoogle() async {
    try {
      await (_googleInit ??= _google.initialize());
      final account = await _google.authenticate();
      final idToken = account.authentication.idToken;
      final credential = GoogleAuthProvider.credential(idToken: idToken);
      return await _guard(() => _auth.signInWithCredential(credential));
    } on GoogleSignInException catch (e) {
      throw AuthFailure(
        e.code == GoogleSignInExceptionCode.canceled
            ? AuthFailureReason.cancelled
            : AuthFailureReason.unknown,
        e.description,
      );
    }
  }

  @override
  Future<void> signOut() async {
    if (_googleInit != null) await _google.signOut();
    await _auth.signOut();
  }

  @override
  Future<void> setLanguageCode(String languageCode) =>
      _auth.setLanguageCode(languageCode);

  Future<AppUser> _guard(Future<UserCredential> Function() action) async {
    try {
      final result = await action();
      return _map(result.user)!;
    } on FirebaseAuthException catch (e) {
      throw _failure(e);
    }
  }

  static AppUser? _map(User? user) {
    if (user == null) return null;
    final providers = user.providerData.map((p) => p.providerId).toSet();
    final method = providers.contains(GoogleAuthProvider.PROVIDER_ID)
        ? AuthMethod.google
        : providers.contains(PhoneAuthProvider.PROVIDER_ID)
        ? AuthMethod.phone
        : AuthMethod.email;
    return AppUser(
      uid: user.uid,
      method: method,
      phoneNumber: user.phoneNumber,
      email: user.email,
      displayName: user.displayName,
    );
  }

  static AuthFailure _failure(Object error) {
    if (error is! FirebaseAuthException) {
      return AuthFailure(AuthFailureReason.unknown, error.toString());
    }
    final reason = switch (error.code) {
      'invalid-phone-number' ||
      'missing-phone-number' => AuthFailureReason.invalidPhone,
      'invalid-verification-code' ||
      'missing-verification-code' => AuthFailureReason.invalidCode,
      'session-expired' || 'code-expired' => AuthFailureReason.codeExpired,
      'invalid-email' => AuthFailureReason.invalidEmail,
      'wrong-password' ||
      'user-not-found' ||
      'invalid-credential' ||
      'user-disabled' => AuthFailureReason.wrongCredentials,
      'email-already-in-use' ||
      'credential-already-in-use' => AuthFailureReason.emailInUse,
      'weak-password' => AuthFailureReason.weakPassword,
      'too-many-requests' ||
      'quota-exceeded' => AuthFailureReason.tooManyRequests,
      'network-request-failed' => AuthFailureReason.network,
      _ => AuthFailureReason.unknown,
    };
    return AuthFailure(reason, error.message);
  }
}
