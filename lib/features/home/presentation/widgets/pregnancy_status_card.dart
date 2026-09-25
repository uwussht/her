import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../tracker/domain/pregnancy_status.dart';

/// Pregnancy headline for the home feed: week, baby size and countdown.
class PregnancyStatusCard extends StatelessWidget {
  const PregnancyStatusCard({
    required this.status,
    this.babySize,
    this.onTap,
    super.key,
  });

  final PregnancyStatus status;
  final BabySize? babySize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final size = babySize;

    return AppCard(
      onTap: onTap,
      color: context.colors.secondaryContainer,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.pregnancyWeek(status.week),
                  style: context.textTheme.headlineSmall,
                ),
              ),
              PillBadge(
                label: l10n.pregnancyTrimester(status.trimester),
                tone: AppTone.green,
              ),
            ],
          ),
          if (size != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Row(
              children: [
                Icon(
                  Icons.child_care_rounded,
                  size: AppSizes.iconSm,
                  color: context.colors.secondary,
                ),
                const SizedBox(width: AppSpacing.xxs),
                Expanded(
                  child: Text(
                    l10n.pregnancyBabySize(size.name.of(context)),
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          Text(
            status.daysRemaining >= 0
                ? l10n.pregnancyDueIn(status.daysRemaining)
                : l10n.pregnancyOverdue,
            style: context.textTheme.titleSmall,
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            l10n.pregnancyDueDate(
              DateFormat.yMMMMd(locale).format(status.dueDate),
            ),
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
