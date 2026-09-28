import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../domain/premium_benefit.dart';
import '../premium_labels.dart';

/// What premium gives, in the order the spec lists it.
class BenefitList extends StatelessWidget {
  const BenefitList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final benefit in PremiumBenefit.values)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  benefit.icon,
                  size: AppSizes.iconMd,
                  color: context.colors.primary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        benefit.label(l10n),
                        style: context.textTheme.titleSmall,
                      ),
                      Text(
                        benefit.description(l10n),
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
