import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import 'auth_controller.dart';
import 'widgets/auth_error_banner.dart';

/// Sign-in method picker: phone, email or Google. Signing up and signing in
/// are the same action for phone and Google.
class AuthWelcomeScreen extends ConsumerWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isLoading = ref.watch(authControllerProvider).isLoading;

    return Scaffold(
      body: SafeArea(
        child: TitledPageLayout(
          header: const Center(child: BrandMark(size: 96)),
          title: l10n.authWelcomeTitle,
          subtitle: l10n.authWelcomeSubtitle,
          bottom: Text(
            l10n.authTerms,
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          children: [
            const AuthErrorBanner(),
            LoadingButton(
              label: l10n.authContinuePhone,
              icon: Icons.phone_iphone_rounded,
              onPressed: isLoading
                  ? null
                  : () => context.push(AppRoutes.authPhone),
            ),
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton.icon(
              onPressed: isLoading
                  ? null
                  : () => context.push(AppRoutes.authEmail),
              icon: const Icon(Icons.mail_outline_rounded),
              label: Text(l10n.authContinueEmail),
            ),
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton.icon(
              onPressed: isLoading
                  ? null
                  : () => ref
                        .read(authControllerProvider.notifier)
                        .signInWithGoogle(),
              icon: isLoading
                  ? const SizedBox.square(
                      dimension: AppSizes.iconSm,
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    )
                  : const Icon(
                      Icons.g_mobiledata_rounded,
                      size: AppSizes.iconLg,
                    ),
              label: Text(l10n.authContinueGoogle),
            ),
          ],
        ),
      ),
    );
  }
}
