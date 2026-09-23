import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/features/auth/domain/kz_phone.dart';

void main() {
  test('accepts KZ mobile numbers in common typed forms', () {
    for (final input in [
      '7011234567',
      '701 123 45 67',
      '87011234567',
      '+7 701 123 45 67',
      '77011234567',
    ]) {
      expect(KzPhone.isValid(input), isTrue, reason: input);
      expect(KzPhone.toE164(input), '+77011234567', reason: input);
    }
  });

  test('rejects short and non-7XX numbers', () {
    expect(KzPhone.isValid('70112345'), isFalse);
    expect(KzPhone.isValid('9161234567'), isFalse);
    expect(KzPhone.isValid(''), isFalse);
  });

  test('formats while typing and for display', () {
    expect(KzPhone.formatNational('7011'), '701 1');
    expect(KzPhone.formatNational('7011234567'), '701 123 45 67');
    expect(KzPhone.formatE164('+77011234567'), '+7 701 123 45 67');
  });
}
