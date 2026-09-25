import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/cycle_timeline.dart';
import '../../domain/daily_log.dart';
import '../../domain/tracker_enums.dart';
import '../tracker_labels.dart';
import 'phase_style.dart';

/// Details and actions for the day selected in the calendar.
class DayDetailCard extends StatelessWidget {
  const DayDetailCard({
    required this.day,
    required this.timeline,
    required this.onStartPeriod,
    required this.onEndPeriod,
    required this.onRemoveMark,
    required this.onOpenLog,
    super.key,
  });

  final DateTime day;
  final CycleTimeline timeline;
  final VoidCallback onStartPeriod;
  final VoidCallback onEndPeriod;
  final VoidCallback onRemoveMark;
  final VoidCallback onOpenLog;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final phase = timeline.phaseFor(day);
    final phaseLabel = PhaseStyle.label(l10n, phase);
    final log = timeline.logFor(day);
    final isBleeding = timeline.isBleedingOn(day);
    final isFuture = day.isAfter(today());
    final currentCycle = timeline.currentCycle;
    final canEndPeriod =
        isBleeding &&
        currentCycle != null &&
        currentCycle.isPeriodOpen &&
        !day.isBefore(currentCycle.startDate);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  DateFormat.yMMMMEEEEd(locale).format(day),
                  style: context.textTheme.titleMedium,
                ),
              ),
              if (phaseLabel != null)
                PillBadge(
                  label: phaseLabel,
                  tone: switch (phase) {
                    CyclePhase.fertile || CyclePhase.ovulation => AppTone.green,
                    _ => AppTone.pink,
                  },
                ),
            ],
          ),
          if (log != null) ...[
            const SizedBox(height: AppSpacing.sm),
            _LogSummary(log: log),
          ],
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              if (!isFuture && !isBleeding)
                FilledButton.tonalIcon(
                  onPressed: onStartPeriod,
                  icon: const Icon(Icons.water_drop_rounded),
                  label: Text(l10n.trackerPeriodStarted),
                ),
              if (canEndPeriod)
                FilledButton.tonalIcon(
                  onPressed: onEndPeriod,
                  icon: const Icon(Icons.check_rounded),
                  label: Text(l10n.trackerPeriodEnded),
                ),
              if (isBleeding)
                TextButton.icon(
                  onPressed: onRemoveMark,
                  icon: const Icon(Icons.backspace_outlined),
                  label: Text(l10n.trackerRemoveDay),
                ),
              if (!isFuture)
                TextButton.icon(
                  onPressed: onOpenLog,
                  icon: const Icon(Icons.edit_note_rounded),
                  label: Text(log == null ? l10n.logToday : l10n.actionEdit),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LogSummary extends StatelessWidget {
  const _LogSummary({required this.log});

  final DailyLog log;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final mood = log.mood;
    final entries = <String>[
      if (log.flow != null) log.flow!.label(l10n),
      if (mood != null) '${mood.emoji} ${mood.label(l10n)}',
      if (log.energy != null) '${l10n.logEnergy}: ${log.energy!.label(l10n)}',
      if (log.sleepHours != null) l10n.logSleepHours(_hours(log.sleepHours!)),
      for (final symptom in log.symptoms) symptom.label(l10n),
    ];
    final notes = log.notes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.xxs,
          runSpacing: AppSpacing.xxs,
          children: [
            for (final entry in entries)
              PillBadge(label: entry, tone: AppTone.green),
          ],
        ),
        if (notes != null && notes.trim().isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(notes.trim(), style: context.textTheme.bodySmall),
        ],
      ],
    );
  }

  static String _hours(double value) => value == value.roundToDouble()
      ? value.toStringAsFixed(0)
      : value.toStringAsFixed(1);
}
