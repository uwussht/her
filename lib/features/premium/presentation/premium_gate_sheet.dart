import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import 'premium_controller.dart';

/// Shown when she opens premium content without premium.
///
/// Step 9 replaces this with the real paywall, plans and trial. The demo
/// switch is the only way to unlock premium until then, and says so.
class PremiumGateSheet extends ConsumerWidget {
  const PremiumGateSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      builder: (context) => const PremiumGateSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final hasPremium = ref.watch(hasPremiumProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const IconBubble(
            icon: Icons.workspace_premium_rounded,
            tone: AppTone.warning,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            hasPremium ? l10n.premiumActive : l10n.premiumGateTitle,
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.premiumGateBody,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.palette.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          LoadingButton(
            label: hasPremium ? l10n.premiumDemoOff : l10n.premiumDemoOn,
            icon: Icons.science_outlined,
            onPressed: () async {
              await ref.read(premiumControllerProvider.notifier).toggleDemo();
              if (context.mounted) Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.premiumDemoNote,
            style: context.textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
