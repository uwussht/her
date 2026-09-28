import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/symptom_summary.dart';
import '../tracker_labels.dart';

/// What she logged over the last month: symptoms, sleep and mood.
///
/// Counts only. No interpretation, because a symptom log is not a diagnosis.
class SymptomSummaryCard extends StatelessWidget {
  const SymptomSummaryCard({
    required this.summary,
    required this.localeTag,
    this.maxRows = 5,
    super.key,
  });

  final SymptomSummary summary;
  final String localeTag;
  final int maxRows;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final numberFormat = NumberFormat('0.#', localeTag);
    final rows = summary.counts.take(maxRows).toList();

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.symptomsWindowTitle(summary.windowDays),
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.xs),
          if (summary.isEmpty)
            Text(l10n.symptomsEmpty, style: context.textTheme.bodyMedium)
          else ...[
            Text(
              l10n.symptomsLoggedDays(summary.daysLogged),
              style: context.textTheme.bodySmall,
            ),
            const SizedBox(height: AppSpacing.xs),
            for (final row in rows)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        row.symptom.label(l10n),
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    PillBadge(
                      label: l10n.symptomsDaysCount(row.days),
                      tone: AppTone.pink,
                    ),
                  ],
                ),
              ),
            if (summary.averageSleepHours != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                l10n.symptomsAverageSleep(
                  numberFormat.format(summary.averageSleepHours),
                ),
                style: context.textTheme.bodySmall,
              ),
            ],
            if (summary.averageMoodScore != null)
              Text(
                l10n.symptomsAverageMood(
                  numberFormat.format(summary.averageMoodScore),
                ),
                style: context.textTheme.bodySmall,
              ),
          ],
        ],
      ),
    );
  }
}
