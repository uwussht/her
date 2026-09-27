import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/domain/kz_phone.dart';
import '../../../auth/presentation/widgets/kz_phone_input_formatter.dart';
import '../../domain/order.dart';

/// Delivery address form, prefilled from her last order.
class AddressForm extends StatefulWidget {
  const AddressForm({required this.initial, required this.onSubmit, super.key});

  final DeliveryAddress? initial;
  final ValueChanged<DeliveryAddress> onSubmit;

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _phone;
  late final TextEditingController _city;
  late final TextEditingController _street;
  late final TextEditingController _apartment;
  late final TextEditingController _postalCode;
  late final TextEditingController _comment;

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;
    _name = TextEditingController(text: initial?.fullName ?? '');
    _phone = TextEditingController(
      text: initial == null
          ? ''
          : KzPhone.formatNational(initial.phone.replaceFirst('+7', '')),
    );
    _city = TextEditingController(text: initial?.city ?? '');
    _street = TextEditingController(text: initial?.street ?? '');
    _apartment = TextEditingController(text: initial?.apartment ?? '');
    _postalCode = TextEditingController(text: initial?.postalCode ?? '');
    _comment = TextEditingController(text: initial?.comment ?? '');
  }

  @override
  void dispose() {
    for (final controller in [
      _name,
      _phone,
      _city,
      _street,
      _apartment,
      _postalCode,
      _comment,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  String? _required(String? value) =>
      (value ?? '').trim().isEmpty ? context.l10n.addressRequired : null;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    String? optional(TextEditingController controller) =>
        controller.text.trim().isEmpty ? null : controller.text.trim();

    widget.onSubmit(
      DeliveryAddress(
        fullName: _name.text.trim(),
        phone: KzPhone.toE164(_phone.text),
        city: _city.text.trim(),
        street: _street.text.trim(),
        apartment: optional(_apartment),
        postalCode: optional(_postalCode),
        comment: optional(_comment),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Form(
      key: _formKey,
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _name,
              textCapitalization: TextCapitalization.words,
              autofillHints: const [AutofillHints.name],
              decoration: InputDecoration(labelText: l10n.addressFullName),
              validator: _required,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              autofillHints: const [AutofillHints.telephoneNumberNational],
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d\s]')),
                const KzPhoneInputFormatter(),
              ],
              decoration: InputDecoration(
                labelText: l10n.addressPhone,
                prefixText: '${KzPhone.countryCode} ',
                hintText: l10n.authPhoneHint,
              ),
              validator: (value) =>
                  KzPhone.isValid(value ?? '') ? null : l10n.validationPhone,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _city,
              textCapitalization: TextCapitalization.words,
              autofillHints: const [AutofillHints.addressCity],
              decoration: InputDecoration(labelText: l10n.addressCity),
              validator: _required,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _street,
              textCapitalization: TextCapitalization.sentences,
              autofillHints: const [AutofillHints.streetAddressLine1],
              decoration: InputDecoration(labelText: l10n.addressStreet),
              validator: _required,
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _apartment,
                    decoration: InputDecoration(
                      labelText: l10n.addressApartment,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: TextFormField(
                    controller: _postalCode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autofillHints: const [AutofillHints.postalCode],
                    decoration: InputDecoration(
                      labelText: l10n.addressPostalCode,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _comment,
              minLines: 2,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: l10n.addressComment),
            ),
            const SizedBox(height: AppSpacing.lg),
            LoadingButton(
              label: l10n.addressContinue,
              icon: Icons.arrow_forward_rounded,
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
