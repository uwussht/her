import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../domain/referral.dart';
import 'premium_controller.dart';

/// Invite a friend: both get a month of premium (spec 5.9).
class ReferralScreen extends ConsumerWidget {
  const ReferralScreen({super.key});

  Future<void> _share(BuildContext context, String code) async {
    final messenger = ScaffoldMessenger.of(context);
    final copied = context.l10n.referralCopied;
    await Clipboard.setData(
      ClipboardData(text: context.l10n.referralShareText(code)),
    );
    messenger.showSnackBar(SnackBar(content: Text(copied)));
  }

  Future<void> _demoInvite(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final months = await ref
        .read(referralControllerProvider.notifier)
        .registerInvite();
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          months > 0 ? l10n.referralRewarded(months) : l10n.referralCapReached,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final referral = ref.watch(referralControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.referralTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: [
          const Center(
            child: IconBubble(
              icon: Icons.card_giftcard_rounded,
              size: AppSizes.illustration,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.referralBody,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          AppCard(
            child: Column(
              children: [
                Text(
                  l10n.referralCodeLabel,
                  style: context.textTheme.labelMedium,
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  referral.code,
                  style: context.textTheme.displaySmall?.copyWith(
                    color: context.colors.primary,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                LoadingButton(
                  label: l10n.referralShare,
                  icon: Icons.share_rounded,
                  onPressed: () => _share(context, referral.code),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.group_outlined,
                      size: AppSizes.iconMd,
                      color: context.colors.primary,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Text(
                        l10n.referralInvited(referral.invitedCount),
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    Icon(
                      Icons.workspace_premium_outlined,
                      size: AppSizes.iconMd,
                      color: context.palette.success,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Text(
                        l10n.referralEarned(referral.rewardedMonths),
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            color: context.palette.warningContainer,
            elevated: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton.icon(
                  onPressed:
                      referral.invitedCount >= ReferralRules.maxRewardedInvites
                      ? null
                      : () => _demoInvite(context, ref),
                  icon: const Icon(Icons.science_outlined),
                  label: Text(l10n.referralDemoInvite),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  l10n.referralDemoNote,
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
