import 'package:flutter/services.dart';

import '../../domain/kz_phone.dart';

/// Formats the national part of a KZ number as `7XX XXX XX XX` while typing.
class KzPhoneInputFormatter extends TextInputFormatter {
  const KzPhoneInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final formatted = KzPhone.formatNational(newValue.text);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
