import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/cycle_timeline.dart';
import '../../domain/tracker_enums.dart';
import 'phase_style.dart';

/// Month calendar showing logged periods plus predicted period, fertile and
/// ovulation days.
class CycleCalendar extends StatelessWidget {
  const CycleCalendar({
    required this.timeline,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
    required this.onFocusedDayChanged,
    super.key,
  });

  final CycleTimeline timeline;
  final DateTime focusedDay;
  final DateTime selectedDay;
  final ValueChanged<DateTime> onDaySelected;
  final ValueChanged<DateTime> onFocusedDayChanged;

  /// How far back and forward she can scroll.
  static const int monthsBack = 24;
  static const int monthsForward = 12;

  @override
  Widget build(BuildContext context) {
    final now = today();
    return AppCard(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: TableCalendar<void>(
        locale: Localizations.localeOf(context).toLanguageTag(),
        firstDay: DateTime(now.year, now.month - monthsBack, 1),
        lastDay: DateTime(now.year, now.month + monthsForward + 1, 0),
        focusedDay: focusedDay,
        currentDay: now,
        startingDayOfWeek: StartingDayOfWeek.monday,
        availableGestures: AvailableGestures.horizontalSwipe,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: context.textTheme.titleMedium ?? const TextStyle(),
          leftChevronIcon: const Icon(Icons.chevron_left_rounded),
          rightChevronIcon: const Icon(Icons.chevron_right_rounded),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: context.textTheme.labelSmall ?? const TextStyle(),
          weekendStyle: (context.textTheme.labelSmall ?? const TextStyle())
              .copyWith(color: context.colors.primary),
        ),
        selectedDayPredicate: (day) => day.isSameDay(selectedDay),
        onDaySelected: (selected, focused) {
          onDaySelected(selected.dateOnly);
          onFocusedDayChanged(focused);
        },
        onPageChanged: onFocusedDayChanged,
        calendarBuilders: CalendarBuilders<void>(
          defaultBuilder: (context, day, _) =>
              _DayCell(day: day, timeline: timeline),
          todayBuilder: (context, day, _) =>
              _DayCell(day: day, timeline: timeline, isToday: true),
          selectedBuilder: (context, day, _) => _DayCell(
            day: day,
            timeline: timeline,
            isSelected: true,
            isToday: day.isSameDay(today()),
          ),
          outsideBuilder: (context, day, _) =>
              _DayCell(day: day, timeline: timeline, isOutside: true),
        ),
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.day,
    required this.timeline,
    this.isToday = false,
    this.isSelected = false,
    this.isOutside = false,
  });

  final DateTime day;
  final CycleTimeline timeline;
  final bool isToday;
  final bool isSelected;
  final bool isOutside;

  @override
  Widget build(BuildContext context) {
    final phase = timeline.phaseFor(day);
    final style = PhaseStyle.of(context, phase);
    final hasLog = timeline.logFor(day) != null;
    final l10n = context.l10n;
    final phaseLabel = PhaseStyle.label(l10n, phase);

    return Semantics(
      label: phaseLabel == null ? null : '${day.day} $phaseLabel',
      selected: isSelected,
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: style.background,
          shape: BoxShape.circle,
          border: _border(context, style),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              '${day.day}',
              style: context.textTheme.bodyMedium?.copyWith(
                color: isOutside
                    ? context.palette.textSecondary.withValues(alpha: 0.5)
                    : style.foreground,
                fontWeight: isToday || isSelected
                    ? FontWeight.w800
                    : FontWeight.w500,
              ),
            ),
            if (hasLog)
              Positioned(
                bottom: 4,
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: phase == CyclePhase.period
                        ? style.foreground
                        : context.colors.primary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Border? _border(BuildContext context, PhaseStyle style) {
    if (isSelected) {
      return Border.all(color: context.colors.onSurface, width: 2);
    }
    if (isToday) {
      return Border.all(color: context.colors.primary, width: 2);
    }
    if (style.dashed) {
      return Border.all(color: context.palette.period, width: 1);
    }
    return null;
  }
}

/// Key to the calendar colours.
class CalendarLegend extends StatelessWidget {
  const CalendarLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final palette = context.palette;
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.xs,
      children: [
        _LegendItem(color: palette.period, label: l10n.legendPeriod),
        _LegendItem(
          color: palette.periodContainer,
          borderColor: palette.period,
          label: l10n.legendPredictedPeriod,
        ),
        _LegendItem(color: palette.fertileContainer, label: l10n.legendFertile),
        _LegendItem(color: palette.ovulation, label: l10n.legendOvulation),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.color,
    required this.label,
    this.borderColor,
  });

  final Color color;
  final Color? borderColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: borderColor == null
                ? null
                : Border.all(color: borderColor!),
          ),
        ),
        const SizedBox(width: AppSpacing.xxs),
        Text(label, style: context.textTheme.labelSmall),
      ],
    );
  }
}
