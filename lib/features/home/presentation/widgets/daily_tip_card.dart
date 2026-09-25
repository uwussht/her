import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../learn/domain/daily_tip.dart';

/// Tip of the day, tinted green as wellness guidance.
class DailyTipCard extends StatelessWidget {
  const DailyTipCard({required this.tip, this.onTap, super.key});

  final DailyTip tip;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      onTap: onTap,
      color: context.palette.successContainer,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_rounded, color: context.colors.secondary),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.homeTipOfDay,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colors.secondary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(tip.text.of(context), style: context.textTheme.bodyMedium),
              ],
            ),
          ),
          if (onTap != null)
            Icon(
              Icons.chevron_right_rounded,
              color: context.palette.textSecondary,
            ),
        ],
      ),
    );
  }
}
