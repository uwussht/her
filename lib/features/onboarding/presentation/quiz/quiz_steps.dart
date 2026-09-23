import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../profile/domain/personalization.dart';
import '../../../profile/domain/user_profile.dart';
import '../../../profile/presentation/personalization_labels.dart';

class AgeStep extends StatelessWidget {
  const AgeStep({required this.selected, required this.onSelected, super.key});

  final AgeGroup? selected;
  final ValueChanged<AgeGroup> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final group in AgeGroup.values) ...[
          OptionCard(
            title: group.label(context.l10n),
            selected: group == selected,
            onTap: () => onSelected(group),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
      ],
    );
  }
}

class LifeStageStep extends StatelessWidget {
  const LifeStageStep({
    required this.options,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final List<LifeStage> options;
  final LifeStage? selected;
  final ValueChanged<LifeStage> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        for (final stage in options) ...[
          OptionCard(
            icon: stage.icon,
            title: stage.label(l10n),
            subtitle: stage.description(l10n),
            selected: stage == selected,
            onTap: () => onSelected(stage),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
      ],
    );
  }
}

class CycleStep extends StatelessWidget {
  const CycleStep({
    required this.lastPeriodStart,
    required this.cycleLength,
    required this.showCycleLength,
    required this.lookback,
    required this.onDateSelected,
    required this.onCycleLengthChanged,
    super.key,
  });

  final DateTime? lastPeriodStart;
  final int cycleLength;
  final bool showCycleLength;
  final Duration lookback;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<int> onCycleLengthChanged;

  Future<void> _pickDate(BuildContext context) async {
    final today = DateUtils.dateOnly(DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: lastPeriodStart ?? today,
      firstDate: today.subtract(lookback),
      lastDate: today,
      helpText: context.l10n.quizLastPeriodLabel,
    );
    if (picked != null) onDateSelected(picked);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final date = lastPeriodStart;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.quizLastPeriodLabel, style: context.textTheme.titleSmall),
        const SizedBox(height: AppSpacing.xs),
        AppCard(
          elevated: false,
          color: context.palette.surfaceMuted,
          onTap: () => _pickDate(context),
          child: Row(
            children: [
              Icon(Icons.event_rounded, color: context.palette.period),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  date == null
                      ? l10n.quizSelectDate
                      : DateFormat.yMMMMd(locale).format(date),
                  style: context.textTheme.bodyLarge,
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: context.palette.textSecondary,
              ),
            ],
          ),
        ),
        if (showCycleLength) ...[
          const SizedBox(height: AppSpacing.lg),
          Text(l10n.quizCycleLengthLabel, style: context.textTheme.titleSmall),
          const SizedBox(height: AppSpacing.xs),
          AppCard(
            elevated: false,
            color: context.palette.surfaceMuted,
            child: Row(
              children: [
                IconButton.filledTonal(
                  tooltip: l10n.quizDecreaseDays,
                  onPressed: cycleLength > UserProfile.minCycleLength
                      ? () => onCycleLengthChanged(cycleLength - 1)
                      : null,
                  icon: const Icon(Icons.remove_rounded),
                ),
                Expanded(
                  child: Text(
                    l10n.quizCycleLengthValue(cycleLength),
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton.filledTonal(
                  tooltip: l10n.quizIncreaseDays,
                  onPressed: cycleLength < UserProfile.maxCycleLength
                      ? () => onCycleLengthChanged(cycleLength + 1)
                      : null,
                  icon: const Icon(Icons.add_rounded),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(l10n.quizCycleLengthHint, style: context.textTheme.bodySmall),
        ],
      ],
    );
  }
}

class InterestsStep extends StatelessWidget {
  const InterestsStep({
    required this.options,
    required this.selected,
    required this.onToggle,
    super.key,
  });

  final List<Interest> options;
  final Set<Interest> selected;
  final ValueChanged<Interest> onToggle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: [
        for (final interest in options)
          FilterChip(
            label: Text(interest.label(context.l10n)),
            selected: selected.contains(interest),
            onSelected: (_) => onToggle(interest),
          ),
      ],
    );
  }
}
