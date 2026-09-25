import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/daily_log.dart';
import '../../domain/tracker_enums.dart';
import '../tracker_labels.dart';
import '../tracker_providers.dart';

/// Bottom sheet for one day's entry: flow, mood, energy, sleep, symptoms
/// and a note.
class DailyLogSheet extends ConsumerStatefulWidget {
  const DailyLogSheet({required this.date, super.key});

  final DateTime date;

  /// Opens the sheet and returns true when something was saved.
  static Future<bool?> show(BuildContext context, DateTime date) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => DailyLogSheet(date: date),
    );
  }

  @override
  ConsumerState<DailyLogSheet> createState() => _DailyLogSheetState();
}

class _DailyLogSheetState extends ConsumerState<DailyLogSheet> {
  late final TextEditingController _notes;
  late DailyLog _draft;

  @override
  void initState() {
    super.initState();
    final existing = ref.read(cycleTimelineProvider).logFor(widget.date);
    _draft = existing ?? DailyLog(date: widget.date);
    _notes = TextEditingController(text: _draft.notes ?? '');
  }

  @override
  void dispose() {
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    final log = _draft.copyWith(notes: _notes.text.trim());
    final wasEmpty = log.isEmpty;
    await ref.read(trackerControllerProvider.notifier).saveLog(log);
    if (!mounted) return;
    Navigator.of(context).pop(true);
    messenger.showSnackBar(
      SnackBar(content: Text(wasEmpty ? l10n.logDeleted : l10n.logSaved)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final symptomsByGroup = <SymptomGroup, List<Symptom>>{};
    for (final symptom in Symptom.values) {
      symptomsByGroup.putIfAbsent(symptom.group, () => []).add(symptom);
    }

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.85,
        maxChildSize: 0.95,
        builder: (context, controller) => ListView(
          controller: controller,
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            0,
            AppSpacing.md,
            AppSpacing.md,
          ),
          children: [
            Text(
              l10n.logTitle(DateFormat.MMMMEEEEd(locale).format(widget.date)),
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.lg),

            _Group(
              title: l10n.logFlow,
              child: _ChoiceRow<FlowLevel>(
                values: FlowLevel.values,
                selected: _draft.flow,
                labelOf: (value) => value.label(l10n),
                onChanged: (value) =>
                    setState(() => _draft = _draft.copyWith(flow: value)),
              ),
            ),

            _Group(
              title: l10n.logMood,
              child: _MoodRow(
                selected: _draft.mood,
                onChanged: (value) =>
                    setState(() => _draft = _draft.copyWith(mood: value)),
              ),
            ),

            _Group(
              title: l10n.logEnergy,
              child: _ChoiceRow<EnergyLevel>(
                values: EnergyLevel.values,
                selected: _draft.energy,
                labelOf: (value) => value.label(l10n),
                iconOf: (value) => value.icon,
                onChanged: (value) =>
                    setState(() => _draft = _draft.copyWith(energy: value)),
              ),
            ),

            _Group(
              title: l10n.logSleep,
              child: _SleepSlider(
                hours: _draft.sleepHours,
                onChanged: (value) =>
                    setState(() => _draft = _draft.copyWith(sleepHours: value)),
              ),
            ),

            _Group(
              title: l10n.logSymptoms,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final entry in symptomsByGroup.entries) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
                      child: Text(
                        entry.key.label(l10n),
                        style: context.textTheme.labelMedium,
                      ),
                    ),
                    Wrap(
                      spacing: AppSpacing.xs,
                      runSpacing: AppSpacing.xs,
                      children: [
                        for (final symptom in entry.value)
                          FilterChip(
                            label: Text(symptom.label(l10n)),
                            selected: _draft.symptoms.contains(symptom),
                            onSelected: (_) => _toggleSymptom(symptom),
                          ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                  ],
                ],
              ),
            ),

            _Group(
              title: l10n.logNotes,
              child: TextField(
                controller: _notes,
                maxLines: 4,
                minLines: 2,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(hintText: l10n.logNotesHint),
              ),
            ),

            const SizedBox(height: AppSpacing.md),
            LoadingButton(label: l10n.actionSave, onPressed: _save),
          ],
        ),
      ),
    );
  }

  void _toggleSymptom(Symptom symptom) {
    final symptoms = [..._draft.symptoms];
    if (!symptoms.remove(symptom)) symptoms.add(symptom);
    setState(
      () => _draft = _draft.copyWith(
        symptoms: Symptom.values.where(symptoms.contains).toList(),
      ),
    );
  }
}

class _Group extends StatelessWidget {
  const _Group({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.titleSmall),
          const SizedBox(height: AppSpacing.xs),
          child,
        ],
      ),
    );
  }
}

/// Single-choice chips that can be cleared by tapping the selection again.
class _ChoiceRow<T extends Enum> extends StatelessWidget {
  const _ChoiceRow({
    required this.values,
    required this.selected,
    required this.labelOf,
    required this.onChanged,
    this.iconOf,
  });

  final List<T> values;
  final T? selected;
  final String Function(T) labelOf;
  final IconData Function(T)? iconOf;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: [
        for (final value in values)
          ChoiceChip(
            label: Text(labelOf(value)),
            avatar: iconOf == null ? null : Icon(iconOf!(value), size: 18),
            selected: selected == value,
            onSelected: (isSelected) => onChanged(isSelected ? value : null),
          ),
      ],
    );
  }
}

class _MoodRow extends StatelessWidget {
  const _MoodRow({required this.selected, required this.onChanged});

  final Mood? selected;
  final ValueChanged<Mood?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final mood in Mood.values)
          Expanded(
            child: Semantics(
              label: mood.label(l10n),
              selected: selected == mood,
              button: true,
              child: InkWell(
                borderRadius: AppRadius.cardBorder,
                onTap: () => onChanged(selected == mood ? null : mood),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  child: Column(
                    children: [
                      AnimatedScale(
                        duration: const Duration(milliseconds: 150),
                        scale: selected == mood ? 1.25 : 1,
                        child: Text(
                          mood.emoji,
                          style: const TextStyle(fontSize: 28),
                          semanticsLabel: '',
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        mood.label(l10n),
                        style: context.textTheme.labelSmall?.copyWith(
                          color: selected == mood
                              ? context.colors.primary
                              : context.palette.textSecondary,
                          fontWeight: selected == mood
                              ? FontWeight.w800
                              : FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _SleepSlider extends StatelessWidget {
  const _SleepSlider({required this.hours, required this.onChanged});

  final double? hours;
  final ValueChanged<double?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final value = hours ?? 8;
    return Row(
      children: [
        Expanded(
          child: Slider(
            value: value,
            min: 0,
            max: DailyLog.maxSleepHours,
            divisions: (DailyLog.maxSleepHours * 2).round(),
            label: l10n.logSleepHours(_format(value)),
            onChanged: onChanged,
          ),
        ),
        SizedBox(
          width: 56,
          child: Text(
            hours == null ? '—' : l10n.logSleepHours(_format(value)),
            style: context.textTheme.titleSmall,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  static String _format(double value) => value == value.roundToDouble()
      ? value.toStringAsFixed(0)
      : value.toStringAsFixed(1);
}
