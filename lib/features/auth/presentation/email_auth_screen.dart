import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import 'auth_controller.dart';
import 'widgets/auth_error_banner.dart';

enum _EmailMode { signIn, signUp }

class EmailAuthScreen extends ConsumerStatefulWidget {
  const EmailAuthScreen({super.key});

  static const int minPasswordLength = 8;

  @override
  ConsumerState<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends ConsumerState<EmailAuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  _EmailMode _mode = _EmailMode.signIn;
  bool _obscure = true;

  static final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  bool get _isSignUp => _mode == _EmailMode.signUp;

  String? _validateEmail(String? value) =>
      _emailPattern.hasMatch((value ?? '').trim())
      ? null
      : context.l10n.validationEmail;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final controller = ref.read(authControllerProvider.notifier);
    if (_isSignUp) {
      await controller.signUpWithEmail(_email.text, _password.text);
    } else {
      await controller.signInWithEmail(_email.text, _password.text);
    }
  }

  Future<void> _forgotPassword() async {
    final l10n = context.l10n;
    if (_validateEmail(_email.text) != null) {
      _formKey.currentState!.validate();
      return;
    }
    final messenger = ScaffoldMessenger.of(context);
    final email = _email.text.trim();
    final sent = await ref
        .read(authControllerProvider.notifier)
        .sendPasswordReset(email);
    if (sent) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.authResetSent(email))),
      );
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
        child: AutofillGroup(
          child: TitledPageLayout(
            title: l10n.authEmailTitle,
            bottom: LoadingButton(
              label: _isSignUp ? l10n.authCreateAccount : l10n.authSignIn,
              isLoading: isLoading,
              onPressed: _submit,
            ),
            children: [
              const AuthErrorBanner(),
              SegmentedButton<_EmailMode>(
                segments: [
                  ButtonSegment(
                    value: _EmailMode.signIn,
                    label: Text(l10n.authSignIn),
                  ),
                  ButtonSegment(
                    value: _EmailMode.signUp,
                    label: Text(l10n.authSignUp),
                  ),
                ],
                selected: {_mode},
                showSelectedIcon: false,
                onSelectionChanged: (selection) =>
                    setState(() => _mode = selection.first),
              ),
              const SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
                decoration: InputDecoration(labelText: l10n.authEmailLabel),
                validator: _validateEmail,
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _password,
                obscureText: _obscure,
                textInputAction: _isSignUp
                    ? TextInputAction.next
                    : TextInputAction.done,
                autofillHints: [
                  _isSignUp
                      ? AutofillHints.newPassword
                      : AutofillHints.password,
                ],
                decoration: InputDecoration(
                  labelText: l10n.authPasswordLabel,
                  suffixIcon: IconButton(
                    tooltip: _obscure
                        ? l10n.authShowPassword
                        : l10n.authHidePassword,
                    onPressed: () => setState(() => _obscure = !_obscure),
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                validator: (value) =>
                    (value ?? '').length >= EmailAuthScreen.minPasswordLength
                    ? null
                    : l10n.validationPassword,
                onFieldSubmitted: (_) => _isSignUp ? null : _submit(),
              ),
              if (_isSignUp) ...[
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _confirm,
                  obscureText: _obscure,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: l10n.authConfirmPasswordLabel,
                  ),
                  validator: (value) => value == _password.text
                      ? null
                      : l10n.validationPasswordMatch,
                  onFieldSubmitted: (_) => _submit(),
                ),
              ] else
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: isLoading ? null : _forgotPassword,
                    child: Text(l10n.authForgotPassword),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
