import 'dart:async';
import 'dart:convert';

import '../../../core/services/storage/preferences_service.dart';
import '../domain/app_user.dart';
import '../domain/auth_failure.dart';
import '../domain/auth_repository.dart';
import '../domain/kz_phone.dart';

/// Offline auth for development and tests. The session survives restarts.
///
/// - Phone: any valid KZ number. The code is always [demoCode].
/// - Email: any address. Sign-up needs 8+ characters. Sign-in with
///   [wrongPassword] fails so the error UI can be exercised.
/// - Google: signs in a demo account.
class MockAuthRepository implements AuthRepository {
  MockAuthRepository(
    this._prefs, {
    this.latency = const Duration(milliseconds: 600),
  }) : _current = _restore(_prefs);

  static const String demoCode = '123456';
  static const String wrongPassword = 'wrong-password';
  static const _kSession = 'mockAuth.session';

  final PreferencesService _prefs;
  final Duration latency;
  final _controller = StreamController<AppUser?>.broadcast();
  AppUser? _current;

  static AppUser? _restore(PreferencesService prefs) {
    final raw = prefs.getString(_kSession);
    if (raw == null) return null;
    return AppUser.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  @override
  AppUser? get currentUser => _current;

  @override
  Stream<AppUser?> authStateChanges() {
    // Subscribe synchronously on listen so no change is missed between the
    // initial value and later updates.
    StreamSubscription<AppUser?>? updates;
    late final StreamController<AppUser?> controller;
    controller = StreamController<AppUser?>(
      onListen: () {
        controller.add(_current);
        updates = _controller.stream.listen(controller.add);
      },
      onCancel: () => updates?.cancel(),
    );
    return controller.stream;
  }

  @override
  Future<PhoneVerification> sendPhoneCode(
    String phoneNumber, {
    int? resendToken,
  }) async {
    await _delay();
    if (!KzPhone.isValid(phoneNumber)) {
      throw const AuthFailure(AuthFailureReason.invalidPhone);
    }
    return PhoneCodeSent(verificationId: 'mock:$phoneNumber');
  }

  @override
  Future<AppUser> verifyPhoneCode({
    required String verificationId,
    required String smsCode,
  }) async {
    await _delay();
    if (smsCode != demoCode) {
      throw const AuthFailure(AuthFailureReason.invalidCode);
    }
    final phone = verificationId.replaceFirst('mock:', '');
    return _signIn(
      AppUser(
        uid: _uid('phone', phone),
        method: AuthMethod.phone,
        phoneNumber: phone,
      ),
    );
  }

  @override
  Future<AppUser> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await _delay();
    if (password == wrongPassword) {
      throw const AuthFailure(AuthFailureReason.wrongCredentials);
    }
    return _signIn(_emailUser(email));
  }

  @override
  Future<AppUser> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    await _delay();
    if (password.length < 8) {
      throw const AuthFailure(AuthFailureReason.weakPassword);
    }
    return _signIn(_emailUser(email));
  }

  @override
  Future<void> sendPasswordReset(String email) => _delay();

  @override
  Future<AppUser> signInWithGoogle() async {
    await _delay();
    return _signIn(
      const AppUser(
        uid: 'google:demo',
        method: AuthMethod.google,
        email: 'demo@hercircle.kz',
      ),
    );
  }

  @override
  Future<void> signOut() async {
    await _prefs.remove(_kSession);
    _current = null;
    _controller.add(null);
  }

  @override
  Future<void> setLanguageCode(String languageCode) async {}

  AppUser _emailUser(String email) => AppUser(
    uid: _uid('email', email.trim().toLowerCase()),
    method: AuthMethod.email,
    email: email.trim(),
  );

  Future<AppUser> _signIn(AppUser user) async {
    await _prefs.setString(_kSession, jsonEncode(user.toJson()));
    _current = user;
    _controller.add(user);
    return user;
  }

  Future<void> _delay() =>
      latency == Duration.zero ? Future.value() : Future.delayed(latency);

  static String _uid(String method, String id) =>
      '$method:${base64Url.encode(utf8.encode(id)).replaceAll('=', '')}';
}
