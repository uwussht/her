import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../shop/presentation/product_labels.dart';
import '../../domain/premium_plan.dart';
import '../premium_labels.dart';

/// One plan, selectable. The yearly card carries the savings badge.
class PlanCard extends StatelessWidget {
  const PlanCard({
    required this.plan,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final PremiumPlan plan;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);
    final savings = plan.savingsPercent;

    return AppCard(
      onTap: onTap,
      color: selected ? context.colors.primaryContainer : null,
      child: Row(
        children: [
          Icon(
            selected
                ? Icons.radio_button_checked_rounded
                : Icons.radio_button_unchecked_rounded,
            color: selected
                ? context.colors.primary
                : context.palette.textSecondary,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      plan.label(l10n),
                      style: context.textTheme.titleMedium,
                    ),
                    if (savings > 0) ...[
                      const SizedBox(width: AppSpacing.xs),
                      PillBadge(
                        label: l10n.premiumSave(savings),
                        tone: AppTone.green,
                      ),
                    ],
                  ],
                ),
                Text(
                  formatTenge(l10n, locale, plan.priceTenge),
                  style: context.textTheme.bodyLarge,
                ),
                if (plan.months > 1)
                  Text(
                    l10n.premiumPerMonth(
                      formatTenge(l10n, locale, plan.pricePerMonthTenge),
                    ),
                    style: context.textTheme.bodySmall,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
