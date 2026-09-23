import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../auth_controller.dart';
import '../auth_failure_message.dart';

/// Inline error for the last failed auth action. Unlike a snackbar it never
/// covers the form's buttons, and it clears when a new attempt starts.
class AuthErrorBanner extends ConsumerWidget {
  const AuthErrorBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    final message = state is AsyncError
        ? authFailureMessage(context.l10n, state.error)
        : null;

    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.topCenter,
      child: message == null
          ? const SizedBox(width: double.infinity)
          : Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Semantics(
                liveRegion: true,
                child: AppCard(
                  elevated: false,
                  color: context.colors.errorContainer,
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        size: AppSizes.iconSm,
                        color: context.colors.error,
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Expanded(
                        child: Text(
                          message,
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
