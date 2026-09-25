import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/cycle_prediction.dart';
import '../../domain/cycle_timeline.dart';
import '../../domain/tracker_enums.dart';
import '../tracker_labels.dart';
import 'phase_style.dart';

/// Today's cycle status: the headline the home feed will reuse in step 4.
class CycleStatusCard extends StatelessWidget {
  const CycleStatusCard({
    required this.timeline,
    required this.onLogToday,
    super.key,
  });

  final CycleTimeline timeline;
  final VoidCallback onLogToday;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final now = today();
    final prediction = timeline.prediction;
    final phase = timeline.phaseFor(now);
    final style = PhaseStyle.of(context, phase);
    final headline = _headline(context);
    final cycleDay = timeline.currentCycleDay;

    return AppCard(
      color: phase == CyclePhase.period || phase == CyclePhase.ovulation
          ? style.background
          : context.colors.surface,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  headline,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: _onCard(context, phase, style),
                  ),
                ),
              ),
              if (cycleDay != null)
                PillBadge(
                  label: l10n.trackerCycleDay(cycleDay),
                  tone:
                      phase == CyclePhase.fertile ||
                          phase == CyclePhase.ovulation
                      ? AppTone.green
                      : AppTone.pink,
                ),
            ],
          ),
          if (prediction != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.trackerNextPeriodOn(
                DateFormat.MMMMd(
                  Localizations.localeOf(context).toLanguageTag(),
                ).format(prediction.nextPeriodStart),
              ),
              style: context.textTheme.bodyMedium?.copyWith(
                color: _onCardMuted(context, phase),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xxs,
              children: [
                PillBadge(
                  label: l10n.trackerAverageCycle(
                    prediction.averageCycleLength,
                  ),
                  tone: AppTone.green,
                  icon: Icons.autorenew_rounded,
                ),
                _ConfidenceBadge(prediction: prediction),
              ],
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          OutlinedButton.icon(
            onPressed: onLogToday,
            icon: const Icon(Icons.edit_note_rounded),
            label: Text(l10n.logToday),
            style: OutlinedButton.styleFrom(
              foregroundColor: _onCard(context, phase, style),
              side: BorderSide(
                color: _onCard(context, phase, style).withValues(alpha: 0.4),
                width: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _headline(BuildContext context) {
    final l10n = context.l10n;
    final now = today();
    final late = timeline.daysLate;
    if (late != null) return l10n.trackerPeriodLate(late);

    if (timeline.isBleedingOn(now)) {
      final cycleDay = timeline.currentCycleDay ?? 1;
      return l10n.trackerPeriodDay(cycleDay);
    }

    final phase = timeline.phaseFor(now);
    if (phase == CyclePhase.ovulation) return l10n.trackerOvulationToday;
    if (phase == CyclePhase.fertile) return l10n.trackerFertileToday;

    final untilPeriod = timeline.prediction?.daysUntilNextPeriod(now);
    if (untilPeriod == null) return l10n.navTracker;
    if (untilPeriod == 0) return l10n.trackerPeriodToday;
    return l10n.trackerPeriodInDays(untilPeriod);
  }

  Color _onCard(BuildContext context, CyclePhase phase, PhaseStyle style) =>
      phase == CyclePhase.period || phase == CyclePhase.ovulation
      ? style.foreground
      : context.colors.onSurface;

  Color _onCardMuted(BuildContext context, CyclePhase phase) =>
      phase == CyclePhase.period || phase == CyclePhase.ovulation
      ? context.colors.onPrimary.withValues(alpha: 0.85)
      : context.palette.textSecondary;
}

/// Confidence pill that explains itself when tapped.
class _ConfidenceBadge extends StatelessWidget {
  const _ConfidenceBadge({required this.prediction});

  final CyclePrediction prediction;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isEstimate = prediction.confidence == PredictionConfidence.estimated;
    return Tooltip(
      message: isEstimate
          ? l10n.confidenceEstimatedHint
          : l10n.confidenceBasis(
              prediction.basedOnCycles,
              prediction.variationInDays,
            ),
      triggerMode: TooltipTriggerMode.tap,
      showDuration: const Duration(seconds: 6),
      child: PillBadge(
        label: prediction.confidence.label(l10n),
        tone: switch (prediction.confidence) {
          PredictionConfidence.high => AppTone.green,
          PredictionConfidence.medium => AppTone.pink,
          _ => AppTone.warning,
        },
        icon: Icons.insights_rounded,
      ),
    );
  }
}
