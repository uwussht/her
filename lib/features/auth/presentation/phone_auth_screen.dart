import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../domain/auth_repository.dart';
import '../domain/kz_phone.dart';
import 'auth_controller.dart';
import 'otp_screen.dart';
import 'widgets/auth_error_banner.dart';
import 'widgets/kz_phone_input_formatter.dart';

class PhoneAuthScreen extends ConsumerStatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  ConsumerState<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends ConsumerState<PhoneAuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phone = TextEditingController();

  @override
  void dispose() {
    _phone.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final phone = KzPhone.toE164(_phone.text);
    final result = await ref
        .read(authControllerProvider.notifier)
        .sendPhoneCode(phone);
    if (!mounted) return;
    if (result case PhoneCodeSent(:final verificationId, :final resendToken)) {
      await context.push(
        AppRoutes.authOtp,
        extra: OtpArgs(
          phoneNumber: phone,
          verificationId: verificationId,
          resendToken: resendToken,
        ),
      );
    }
    // PhoneAutoVerified: already signed in, the router moves on.
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isLoading = ref.watch(authControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: TitledPageLayout(
          title: l10n.authPhoneTitle,
          subtitle: l10n.authPhoneSubtitle,
          bottom: LoadingButton(
            label: l10n.authSendCode,
            isLoading: isLoading,
            onPressed: _submit,
          ),
          children: [
            const AuthErrorBanner(),
            TextFormField(
              controller: _phone,
              autofocus: true,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.telephoneNumberNational],
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d\s]')),
                const KzPhoneInputFormatter(),
              ],
              style: context.textTheme.titleLarge,
              decoration: InputDecoration(
                labelText: l10n.authPhoneLabel,
                prefixText: '${KzPhone.countryCode} ',
                prefixStyle: context.textTheme.titleLarge,
                hintText: l10n.authPhoneHint,
              ),
              validator: (value) =>
                  KzPhone.isValid(value ?? '') ? null : l10n.validationPhone,
              onFieldSubmitted: (_) => _submit(),
            ),
          ],
        ),
      ),
    );
  }
}
