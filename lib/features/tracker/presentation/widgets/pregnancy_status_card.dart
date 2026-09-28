import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/pregnancy_status.dart';

/// Week, baby size and the countdown (spec 5.4).
class PregnancyStatusCard extends StatelessWidget {
  const PregnancyStatusCard({
    required this.status,
    required this.localeTag,
    this.babySize,
    super.key,
  });

  final PregnancyStatus status;

  /// This week's comparison, when the library has one.
  final String? babySize;
  final String localeTag;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final remaining = status.daysRemaining;

    return AppCard(
      color: context.palette.successContainer,
      elevated: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const IconBubble(
                icon: Icons.pregnant_woman_rounded,
                tone: AppTone.green,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.pregnancyWeek(status.week),
                      style: context.textTheme.headlineSmall,
                    ),
                    Text(
                      l10n.pregnancyTrimester(status.trimester),
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              PillBadge(
                label: remaining >= 0
                    ? l10n.pregnancyDaysLeft(remaining)
                    : l10n.pregnancyOverdueDays(-remaining),
                tone: remaining >= 0 ? AppTone.green : AppTone.warning,
              ),
            ],
          ),
          if (babySize != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Icon(
                  Icons.spa_rounded,
                  size: AppSizes.iconSm,
                  color: context.palette.success,
                ),
                const SizedBox(width: AppSpacing.xs),
                Expanded(
                  child: Text(
                    l10n.pregnancyBabySize(babySize!),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.pregnancyDueDate(
              DateFormat.yMMMMd(localeTag).format(status.dueDate),
            ),
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
