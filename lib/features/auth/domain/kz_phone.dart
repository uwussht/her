/// Kazakhstan mobile numbers: +7 7XX XXX XX XX.
abstract final class KzPhone {
  static const String countryCode = '+7';

  /// Digits after the country code.
  static const int nationalLength = 10;

  /// Keeps only digits, drops a leading 8 or 7 country prefix when the
  /// user typed the full number, and trims to 10 digits.
  static String nationalDigits(String input) {
    var digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.length > nationalLength &&
        (digits.startsWith('8') || digits.startsWith('7'))) {
      digits = digits.substring(1);
    }
    return digits.length > nationalLength
        ? digits.substring(0, nationalLength)
        : digits;
  }

  /// Kazakh mobile operators all use the 7XX prefix.
  static bool isValid(String input) {
    final digits = nationalDigits(input);
    return digits.length == nationalLength && digits.startsWith('7');
  }

  static String toE164(String input) => '$countryCode${nationalDigits(input)}';

  /// Partial formatting while typing: `701 234 56 78`.
  static String formatNational(String input) {
    final d = nationalDigits(input);
    final buffer = StringBuffer();
    for (var i = 0; i < d.length; i++) {
      if (i == 3 || i == 6 || i == 8) buffer.write(' ');
      buffer.write(d[i]);
    }
    return buffer.toString();
  }

  /// Display form: `+7 701 234 56 78`.
  static String formatE164(String e164) =>
      '$countryCode ${formatNational(e164.replaceFirst(countryCode, ''))}';
}
