import 'dart:math';

/// The code she gives her partner or her daughter.
///
/// Six characters from an alphabet with no look-alikes (no O/0, I/1, S/5), so
/// a code read aloud over the phone or copied off a screen still works.
class InviteCode {
  const InviteCode(this.value);

  /// Builds a random code. Pass a seeded [Random] in tests.
  factory InviteCode.generate({Random? random}) {
    final rnd = random ?? Random.secure();
    return InviteCode(
      String.fromCharCodes([
        for (var i = 0; i < length; i++)
          alphabet.codeUnitAt(rnd.nextInt(alphabet.length)),
      ]),
    );
  }

  /// Normalises what she typed: trims, uppercases, drops spaces and dashes,
  /// and maps the characters people confuse for one another.
  static String normalize(String input) {
    final cleaned = input
        .toUpperCase()
        .replaceAll(RegExp('[^A-Z0-9]'), '')
        .replaceAll('O', 'Q')
        .replaceAll('0', 'Q')
        .replaceAll('I', 'J')
        .replaceAll('1', 'J')
        .replaceAll('S', 'Z')
        .replaceAll('5', 'Z');
    return cleaned.length <= length ? cleaned : cleaned.substring(0, length);
  }

  static bool isValid(String input) {
    final code = normalize(input);
    if (code.length != length) return false;
    return code.split('').every(alphabet.contains);
  }

  static const int length = 6;

  /// No O/0, I/1 or S/5.
  static const String alphabet = 'ABCDEFGHJKLMNPQRTUVWXYZ23456789';

  final String value;

  /// Grouped for reading: `ABC-D2F`.
  String get formatted => '${value.substring(0, 3)}-${value.substring(3)}';

  /// The deep link behind the QR code, so a camera app opens the invite.
  Uri linkFor(String scheme) =>
      Uri(scheme: scheme, host: 'join', queryParameters: {'code': value});

  @override
  bool operator ==(Object other) => other is InviteCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => formatted;
}
