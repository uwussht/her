import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../shop/presentation/product_labels.dart';
import '../domain/premium_plan.dart';
import 'premium_controller.dart';

/// Shown when she opens premium content without premium.
///
/// Deliberately short: the two headline benefits, the trial, and a way to the
/// full premium screen. The paywall itself lives there.
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
    final locale = Localizations.localeOf(context);
    final membership = ref.watch(premiumControllerProvider);
    final hasPremium = ref.watch(hasPremiumProvider);
    final plan = PremiumPlan.recommended;

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
          if (!hasPremium && membership.canStartTrial) ...[
            LoadingButton(
              label: l10n.premiumTrialCta,
              icon: Icons.card_giftcard_rounded,
              onPressed: () async {
                await ref.read(premiumControllerProvider.notifier).startTrial();
                if (context.mounted) Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              l10n.premiumTrialNote(formatTenge(l10n, locale, plan.priceTenge)),
              style: context.textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
          ],
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
              context.push(AppRoutes.premium);
            },
            icon: const Icon(Icons.arrow_forward_rounded),
            label: Text(l10n.premiumOpen),
          ),
        ],
      ),
    );
  }
}
