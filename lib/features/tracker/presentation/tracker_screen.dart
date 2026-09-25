import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/widgets/widgets.dart';
import 'tracker_providers.dart';
import 'widgets/cycle_calendar.dart';
import 'widgets/cycle_status_card.dart';
import 'widgets/daily_log_sheet.dart';
import 'widgets/day_detail_card.dart';
import 'widgets/doctor_report_card.dart';
import 'widgets/mood_chart_card.dart';
import 'widgets/reminders_summary_card.dart';

/// The tracker tab. Cycle mode is built here; pregnancy, postpartum and
/// menopause modes arrive in step 10 and currently offer cycle mode.
class TrackerScreen extends ConsumerStatefulWidget {
  const TrackerScreen({super.key});

  @override
  ConsumerState<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends ConsumerState<TrackerScreen> {
  DateTime _selectedDay = today();
  DateTime _focusedDay = today();
  bool _forceCycleMode = false;

  void _select(DateTime day) => setState(() => _selectedDay = day);

  void _jumpToToday() => setState(() {
    _selectedDay = today();
    _focusedDay = today();
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final mode = ref.watch(trackerModeProvider);
    final timeline = ref.watch(cycleTimelineProvider);
    final controller = ref.read(trackerControllerProvider.notifier);
    final showCycle = _forceCycleMode || mode == TrackerMode.cycle;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navTracker),
        actions: [
          if (showCycle)
            IconButton(
              tooltip: l10n.actionToday,
              onPressed: _jumpToToday,
              icon: const Icon(Icons.today_rounded),
            ),
          IconButton(
            tooltip: l10n.remindersTitle,
            onPressed: () => context.push(AppRoutes.reminders),
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSizes.fabClearance,
        ),
        children: [
          if (!showCycle)
            _OtherModeCard(
              mode: mode,
              onUseCycleMode: () => setState(() => _forceCycleMode = true),
            )
          else if (!timeline.hasData)
            FeaturePlaceholderAction(
              icon: Icons.water_drop_rounded,
              title: l10n.trackerEmptyTitle,
              description: l10n.trackerEmptyBody,
              actionLabel: l10n.trackerMarkPeriodStart,
              onAction: () => controller.startPeriod(today()),
            )
          else ...[
            CycleStatusCard(
              timeline: timeline,
              onLogToday: () => DailyLogSheet.show(context, today()),
            ),
            const SizedBox(height: AppSpacing.md),
            CycleCalendar(
              timeline: timeline,
              focusedDay: _focusedDay,
              selectedDay: _selectedDay,
              onDaySelected: _select,
              onFocusedDayChanged: (day) => setState(() => _focusedDay = day),
            ),
            const SizedBox(height: AppSpacing.sm),
            const CalendarLegend(),
            const SizedBox(height: AppSpacing.md),
            DayDetailCard(
              day: _selectedDay,
              timeline: timeline,
              onStartPeriod: () => controller.startPeriod(_selectedDay),
              onEndPeriod: () => controller.endPeriod(_selectedDay),
              onRemoveMark: () => controller.removePeriodMark(_selectedDay),
              onOpenLog: () => DailyLogSheet.show(context, _selectedDay),
            ),
            const SizedBox(height: AppSpacing.md),
            MoodChartCard(timeline: timeline),
            const SizedBox(height: AppSpacing.md),
            RemindersSummaryCard(
              onTap: () => context.push(AppRoutes.reminders),
            ),
            const SizedBox(height: AppSpacing.md),
            const DoctorReportCard(),
            const SizedBox(height: AppSpacing.md),
            DisclaimerCard(text: l10n.predictionDisclaimer),
          ],
        ],
      ),
    );
  }
}

/// Placeholder for the tracker modes that step 10 builds, with a way into
/// cycle mode in the meantime.
class _OtherModeCard extends StatelessWidget {
  const _OtherModeCard({required this.mode, required this.onUseCycleMode});

  final TrackerMode mode;
  final VoidCallback onUseCycleMode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FeaturePlaceholderAction(
      icon: switch (mode) {
        TrackerMode.pregnancy ||
        TrackerMode.postpartum => Icons.pregnant_woman_rounded,
        _ => Icons.wb_twilight_rounded,
      },
      title: l10n.navTracker,
      description: switch (mode) {
        TrackerMode.pregnancy ||
        TrackerMode.postpartum => l10n.trackerPregnancySoon,
        _ => l10n.trackerMenopauseSoon,
      },
      tone: AppTone.green,
      actionLabel: l10n.trackerSwitchToCycle,
      onAction: onUseCycleMode,
    );
  }
}
