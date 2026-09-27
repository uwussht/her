import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/payment_service.dart';

/// The text controllers behind [CardForm].
///
/// Owned by the checkout screen rather than the form's own state: the form
/// sits in a lazily built list, so scrolling down to the Pay button can
/// dispose it, and her card number must not disappear with it.
class CardFormControllers {
  CardFormControllers();

  final number = TextEditingController();
  final expiry = TextEditingController();
  final cvc = TextEditingController();
  final holder = TextEditingController();

  /// `MM/YY` as a month and a four-digit year, or null while incomplete.
  (int month, int year)? get parsedExpiry {
    final digits = expiry.text.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 4) return null;
    final month = int.tryParse(digits.substring(0, 2));
    final year = int.tryParse(digits.substring(2, 4));
    if (month == null || year == null) return null;
    return (month, 2000 + year);
  }

  /// Complete, valid details, or null when anything is missing or wrong.
  CardDetails? get details {
    final expiry = parsedExpiry;
    final valid =
        CardValidator.isValidNumber(number.text) &&
        expiry != null &&
        CardValidator.isExpiryValid(expiry.$1, expiry.$2) &&
        CardValidator.isValidCvc(cvc.text) &&
        holder.text.trim().isNotEmpty;
    if (!valid) return null;
    return CardDetails(
      number: CardValidator.digitsOnly(number.text),
      expiryMonth: expiry.$1,
      expiryYear: expiry.$2,
      cvc: cvc.text.trim(),
      holder: holder.text.trim(),
    );
  }

  void dispose() {
    for (final controller in [number, expiry, cvc, holder]) {
      controller.dispose();
    }
  }
}

/// Card entry. Nothing here is ever stored: the details go straight to the
/// payment provider and are dropped when checkout ends.
class CardForm extends StatelessWidget {
  const CardForm({required this.formKey, required this.controllers, super.key});

  final GlobalKey<FormState> formKey;
  final CardFormControllers controllers;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Form(
      key: formKey,
      // Show problems as she types, rather than only when she taps Pay.
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: controllers.number,
            keyboardType: TextInputType.number,
            autofillHints: const [AutofillHints.creditCardNumber],
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(19),
              _CardNumberFormatter(),
            ],
            decoration: InputDecoration(
              labelText: l10n.cardNumber,
              hintText: '0000 0000 0000 0000',
              prefixIcon: const Icon(Icons.credit_card_rounded),
            ),
            validator: (value) => CardValidator.isValidNumber(value ?? '')
                ? null
                : l10n.cardInvalidNumber,
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controllers.expiry,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    _ExpiryFormatter(),
                  ],
                  decoration: InputDecoration(
                    labelText: l10n.cardExpiry,
                    hintText: '12/29',
                  ),
                  validator: (_) {
                    final expiry = controllers.parsedExpiry;
                    return expiry != null &&
                            CardValidator.isExpiryValid(expiry.$1, expiry.$2)
                        ? null
                        : l10n.cardInvalidExpiry;
                  },
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: TextFormField(
                  controller: controllers.cvc,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  decoration: InputDecoration(labelText: l10n.cardCvc),
                  validator: (value) => CardValidator.isValidCvc(value ?? '')
                      ? null
                      : l10n.cardInvalidCvc,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: controllers.holder,
            textCapitalization: TextCapitalization.characters,
            autofillHints: const [AutofillHints.creditCardName],
            decoration: InputDecoration(labelText: l10n.cardHolder),
            validator: (value) =>
                (value ?? '').trim().isEmpty ? l10n.addressRequired : null,
          ),
          const SizedBox(height: AppSpacing.sm),
          DisclaimerCard(text: l10n.cardTestHint),
        ],
      ),
    );
  }
}

/// Groups digits into fours while typing.
class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final formatted = CardValidator.format(newValue.text);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Inserts the slash in `MM/YY`.
class _ExpiryFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final formatted = digits.length <= 2
        ? digits
        : '${digits.substring(0, 2)}/${digits.substring(2)}';
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
