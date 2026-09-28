import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';

/// How many free questions are left today.
class QuotaPill extends StatelessWidget {
  const QuotaPill({required this.messagesLeft, super.key});

  /// Null with premium.
  final int? messagesLeft;

  @override
  Widget build(BuildContext context) {
    final left = messagesLeft;
    if (left == null) {
      return PillBadge(
        label: context.l10n.aiUnlimited,
        icon: Icons.workspace_premium_rounded,
        tone: AppTone.warning,
      );
    }
    return PillBadge(
      label: context.l10n.aiMessagesLeft(left),
      icon: Icons.bolt_rounded,
      tone: left == 0 ? AppTone.warning : AppTone.green,
    );
  }
}

/// Shown when the free tier is used up for today.
class QuotaLimitCard extends StatelessWidget {
  const QuotaLimitCard({required this.onSeePremium, super.key});

  final VoidCallback onSeePremium;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      color: context.palette.warningContainer,
      elevated: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.workspace_premium_rounded,
                size: AppSizes.iconMd,
                color: context.palette.warning,
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  l10n.aiLimitTitle,
                  style: context.textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.aiLimitBody,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: OutlinedButton.icon(
              onPressed: onSeePremium,
              icon: const Icon(Icons.arrow_forward_rounded),
              label: Text(l10n.aiLimitCta),
            ),
          ),
        ],
      ),
    );
  }
}
