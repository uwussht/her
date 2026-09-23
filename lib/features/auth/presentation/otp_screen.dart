import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/app_env.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../data/mock_auth_repository.dart';
import '../domain/auth_repository.dart';
import '../domain/kz_phone.dart';
import 'auth_controller.dart';
import 'widgets/auth_error_banner.dart';

/// Route arguments for [OtpScreen].
class OtpArgs {
  const OtpArgs({
    required this.phoneNumber,
    required this.verificationId,
    this.resendToken,
  });

  final String phoneNumber;
  final String verificationId;
  final int? resendToken;
}

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({required this.args, super.key});

  final OtpArgs args;

  static const int codeLength = 6;
  static const int resendSeconds = 60;

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _code = TextEditingController();
  late String _verificationId = widget.args.verificationId;
  late int? _resendToken = widget.args.resendToken;
  Timer? _timer;
  int _secondsLeft = OtpScreen.resendSeconds;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _code.dispose();
    super.dispose();
  }

  void _startCountdown() {
    _timer?.cancel();
    setState(() => _secondsLeft = OtpScreen.resendSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) timer.cancel();
      setState(() => _secondsLeft--);
    });
  }

  Future<void> _verify() async {
    if (!_formKey.currentState!.validate()) return;
    await ref
        .read(authControllerProvider.notifier)
        .verifyPhoneCode(verificationId: _verificationId, smsCode: _code.text);
    // On success the router redirect leaves this screen.
  }

  Future<void> _resend() async {
    final result = await ref
        .read(authControllerProvider.notifier)
        .sendPhoneCode(widget.args.phoneNumber, resendToken: _resendToken);
    if (!mounted) return;
    if (result case PhoneCodeSent(:final verificationId, :final resendToken)) {
      _verificationId = verificationId;
      _resendToken = resendToken;
      _code.clear();
      _startCountdown();
    }
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
          title: l10n.authOtpTitle,
          subtitle: l10n.authOtpSubtitle(
            KzPhone.formatE164(widget.args.phoneNumber),
          ),
          bottom: LoadingButton(
            label: l10n.authVerify,
            isLoading: isLoading,
            onPressed: _verify,
          ),
          children: [
            const AuthErrorBanner(),
            TextFormField(
              controller: _code,
              autofocus: true,
              keyboardType: TextInputType.number,
              autofillHints: const [AutofillHints.oneTimeCode],
              maxLength: OtpScreen.codeLength,
              textAlign: TextAlign.center,
              style: context.textTheme.headlineMedium?.copyWith(
                letterSpacing: AppSpacing.sm,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: l10n.authOtpLabel,
                counterText: '',
              ),
              validator: (value) => (value ?? '').length == OtpScreen.codeLength
                  ? null
                  : l10n.validationCode,
              onChanged: (value) {
                if (value.length == OtpScreen.codeLength && !isLoading) {
                  _verify();
                }
              },
            ),
            if (AppEnv.useMocks) ...[
              const SizedBox(height: AppSpacing.sm),
              PillBadge(
                label: l10n.authDemoCode(MockAuthRepository.demoCode),
                tone: AppTone.green,
                icon: Icons.science_outlined,
              ),
            ],
            const SizedBox(height: AppSpacing.md),
            Center(
              child: _secondsLeft > 0
                  ? Text(
                      l10n.authOtpResendIn(_secondsLeft),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.palette.textSecondary,
                      ),
                    )
                  : TextButton(
                      onPressed: isLoading ? null : _resend,
                      child: Text(l10n.authOtpResend),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
