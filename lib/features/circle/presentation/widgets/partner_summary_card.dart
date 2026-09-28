import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../profile/presentation/personalization_labels.dart';
import '../../../tracker/presentation/tracker_labels.dart';
import '../../../tracker/presentation/widgets/phase_style.dart';
import '../../domain/partner_summary.dart';
import '../circle_labels.dart';

/// What the other person sees: her shared day, then the support tip.
///
/// Nothing is invented here. A field the summary left null is simply absent,
/// so an empty card is the honest result of her switches being off.
class PartnerSummaryCard extends StatelessWidget {
  const PartnerSummaryCard({
    required this.summary,
    required this.localeTag,
    this.emptyMessage,
    super.key,
  });

  final PartnerSummary summary;

  /// For the due-date format.
  final String localeTag;

  /// Shown when she shares nothing at all.
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final rows = <Widget>[];

    final stage = summary.stage;
    if (stage != null) {
      rows.add(
        _Row(
          icon: stage.icon,
          label: l10n.scopeLifeStage,
          value: stage.label(l10n),
        ),
      );
    }
    final day = summary.cycleDay;
    final phase = summary.phase;
    if (day != null || phase != null) {
      final phaseLabel = phase == null ? null : PhaseStyle.label(l10n, phase);
      rows.add(
        _Row(
          icon: Icons.calendar_month_outlined,
          label: l10n.scopeCyclePhase,
          value: [
            if (day != null) l10n.trackerCycleDay(day),
            ?phaseLabel,
          ].join(' · '),
        ),
      );
    }
    final mood = summary.mood;
    if (mood != null) {
      rows.add(
        _Row(
          icon: Icons.mood_outlined,
          label: l10n.scopeMood,
          value: '${mood.emoji} ${mood.label(l10n)}',
        ),
      );
    }
    if (summary.symptoms.isNotEmpty) {
      rows.add(
        _Row(
          icon: Icons.healing_outlined,
          label: l10n.scopeSymptoms,
          value: summary.symptoms
              .map((symptom) => symptom.label(l10n))
              .join(', '),
        ),
      );
    }
    final week = summary.pregnancyWeek;
    final dueDate = summary.dueDate;
    if (week != null) {
      rows.add(
        _Row(
          icon: Icons.pregnant_woman_rounded,
          label: l10n.scopePregnancy,
          value: [
            l10n.pregnancyWeek(week),
            if (dueDate != null) DateFormat.yMMMMd(localeTag).format(dueDate),
          ].join(' · '),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (rows.isEmpty)
                Text(
                  emptyMessage ?? l10n.circlePeerNothing,
                  style: context.textTheme.bodyMedium,
                )
              else
                for (final row in rows) row,
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          color: context.palette.successContainer,
          elevated: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.volunteer_activism_rounded,
                    size: AppSizes.iconMd,
                    color: context.palette.success,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      l10n.circleSupportTitle,
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                summary.tip.label(l10n),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.icon, required this.label, required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: AppSizes.iconSm, color: context.colors.primary),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: context.textTheme.labelSmall),
                Text(value, style: context.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
