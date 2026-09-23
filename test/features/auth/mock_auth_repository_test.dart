import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/services/storage/preferences_service.dart';
import 'package:her_circle/features/auth/data/mock_auth_repository.dart';
import 'package:her_circle/features/auth/domain/auth_failure.dart';
import 'package:her_circle/features/auth/domain/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late PreferencesService prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = PreferencesService(await SharedPreferences.getInstance());
  });

  MockAuthRepository repo() =>
      MockAuthRepository(prefs, latency: Duration.zero);

  Matcher failsWith(AuthFailureReason reason) =>
      throwsA(isA<AuthFailure>().having((f) => f.reason, 'reason', reason));

  test('phone sign-in accepts only the demo code', () async {
    final auth = repo();
    final sent = await auth.sendPhoneCode('+77011234567') as PhoneCodeSent;

    await expectLater(
      auth.verifyPhoneCode(
        verificationId: sent.verificationId,
        smsCode: '000000',
      ),
      failsWith(AuthFailureReason.invalidCode),
    );

    final user = await auth.verifyPhoneCode(
      verificationId: sent.verificationId,
      smsCode: MockAuthRepository.demoCode,
    );
    expect(user.phoneNumber, '+77011234567');
    expect(auth.currentUser, user);
  });

  test('rejects invalid phone numbers', () {
    expect(
      repo().sendPhoneCode('+71234'),
      failsWith(AuthFailureReason.invalidPhone),
    );
  });

  test('email: weak sign-up password and wrong sign-in password fail', () {
    final auth = repo();
    expect(
      auth.signUpWithEmail(email: 'a@b.kz', password: 'short'),
      failsWith(AuthFailureReason.weakPassword),
    );
    expect(
      auth.signInWithEmail(
        email: 'a@b.kz',
        password: MockAuthRepository.wrongPassword,
      ),
      failsWith(AuthFailureReason.wrongCredentials),
    );
  });

  test('session survives a restart and is cleared on sign-out', () async {
    final user = await repo().signInWithEmail(
      email: ' Aru@Mail.kz ',
      password: 'password1',
    );
    final restarted = repo();
    expect(restarted.currentUser, user);
    // The same address maps to the same account regardless of case.
    final again = await restarted.signInWithEmail(
      email: 'aru@mail.kz',
      password: 'password1',
    );
    expect(again.uid, user.uid);

    final events = <Object?>[];
    final sub = restarted.authStateChanges().listen(events.add);
    await restarted.signOut();
    await pumpEventQueue();
    await sub.cancel();

    expect(restarted.currentUser, isNull);
    expect(repo().currentUser, isNull);
    expect(events.last, isNull);
  });
}
