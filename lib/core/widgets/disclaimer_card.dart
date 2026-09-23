import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../utils/context_extensions.dart';
import 'app_card.dart';

/// Medical disclaimer, shown in onboarding, the AI chat and Q&A.
class DisclaimerCard extends StatelessWidget {
  const DisclaimerCard({this.text, super.key});

  /// Custom text. Defaults to the standard medical disclaimer.
  final String? text;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevated: false,
      color: context.palette.warningContainer,
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: AppSizes.iconSm,
            color: context.palette.warning,
          ),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(
              text ?? context.l10n.medicalDisclaimer,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
