import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/presentation/learn_providers.dart';
import '../../shop/presentation/product_labels.dart';
import '../domain/premium_plan.dart';
import '../domain/premium_status.dart';
import 'premium_controller.dart';
import 'widgets/benefit_list.dart';
import 'widgets/plan_card.dart';
import 'widgets/premium_payment_sheet.dart';

/// The premium screen and the paywall: what it gives, what it costs, the free
/// trial, and how to stop paying.
class PremiumScreen extends ConsumerStatefulWidget {
  const PremiumScreen({super.key});

  @override
  ConsumerState<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends ConsumerState<PremiumScreen> {
  PremiumPlan _plan = PremiumPlan.recommended;

  Future<void> _startTrial() async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final started = await ref
        .read(premiumControllerProvider.notifier)
        .startTrial();
    if (!mounted) return;
    messenger.showSnackBar(
      SnackBar(
        content: Text(started ? l10n.premiumThanks : l10n.premiumTrialUsed),
      ),
    );
  }

  Future<void> _subscribe() async {
    final messenger = ScaffoldMessenger.of(context);
    final thanks = context.l10n.premiumThanks;
    final paid = await PremiumPaymentSheet.show(context, _plan);
    if (!mounted || !paid) return;
    messenger.showSnackBar(SnackBar(content: Text(thanks)));
  }

  Future<void> _cancel() async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.premiumCancelTitle),
        content: Text(l10n.premiumCancelBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.premiumCancelPlan),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(premiumControllerProvider.notifier).cancel();
    if (!mounted) return;
    messenger.showSnackBar(SnackBar(content: Text(l10n.premiumCancelled)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);
    final membership = ref.watch(premiumControllerProvider);
    final now = DateTime.now();
    final hasAccess = membership.hasAccessOn(now);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.premiumTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: [
          if (hasAccess) ...[
            AppCard(
              color: context.palette.successContainer,
              elevated: false,
              child: Row(
                children: [
                  const IconBubble(
                    icon: Icons.workspace_premium_rounded,
                    tone: AppTone.green,
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.premiumActive,
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          _statusLine(context, now),
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
          ] else ...[
            Text(l10n.premiumPitch, style: context.textTheme.bodyLarge),
            const SizedBox(height: AppSpacing.md),
          ],
          const BenefitList(),
          const SizedBox(height: AppSpacing.xs),
          if (membership.bonusMonths > 0) ...[
            AppCard(
              color: context.palette.warningContainer,
              elevated: false,
              child: Text(
                l10n.premiumBonusMonths(membership.bonusMonths),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
          ],
          for (final plan in PremiumPlan.values)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: PlanCard(
                plan: plan,
                selected: _plan == plan,
                onTap: () => setState(() => _plan = plan),
              ),
            ),
          const SizedBox(height: AppSpacing.sm),
          LoadingButton(
            label: l10n.premiumSubscribe(
              formatTenge(l10n, locale, _plan.priceTenge),
            ),
            icon: Icons.workspace_premium_rounded,
            onPressed: _subscribe,
          ),
          if (membership.canStartTrial) ...[
            const SizedBox(height: AppSpacing.xs),
            OutlinedButton.icon(
              onPressed: _startTrial,
              icon: const Icon(Icons.card_giftcard_rounded),
              label: Text(l10n.premiumTrialCta),
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              l10n.premiumTrialNote(
                formatTenge(l10n, locale, _plan.priceTenge),
              ),
              style: context.textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
          ] else if (membership.status == PremiumStatus.free &&
              membership.trialUsed) ...[
            const SizedBox(height: AppSpacing.xxs),
            Text(l10n.premiumTrialUsed, style: context.textTheme.labelSmall),
          ],
          const SizedBox(height: AppSpacing.md),
          AppCard(
            padding: EdgeInsets.zero,
            child: ListTile(
              leading: const Icon(Icons.card_giftcard_outlined),
              title: Text(l10n.referralTitle),
              subtitle: Text(l10n.referralBody),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(AppRoutes.referrals),
            ),
          ),
          if (hasAccess) ...[
            const SizedBox(height: AppSpacing.md),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: context.colors.error,
                ),
                onPressed: _cancel,
                icon: const Icon(Icons.cancel_outlined),
                label: Text(l10n.premiumCancelPlan),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _statusLine(BuildContext context, DateTime now) {
    final l10n = context.l10n;
    final membership = ref.read(premiumControllerProvider);
    if (membership.status == PremiumStatus.trial) {
      return l10n.premiumTrialLeft(membership.trialDaysLeft(now));
    }
    final expires = membership.expiresAt;
    if (expires == null) return l10n.premiumActive;
    return l10n.premiumActiveUntil(
      DateFormat.yMMMMd(ref.read(localeTagProvider)).format(expires),
    );
  }
}
