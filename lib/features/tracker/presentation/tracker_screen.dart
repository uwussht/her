import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/widgets/widgets.dart';
import 'tracker_mode_views.dart';
import 'tracker_providers.dart';
import 'widgets/cycle_calendar.dart';
import 'widgets/cycle_status_card.dart';
import 'widgets/daily_log_sheet.dart';
import 'widgets/day_detail_card.dart';
import 'widgets/doctor_report_card.dart';
import 'widgets/mood_chart_card.dart';
import 'widgets/reminders_summary_card.dart';

/// The tracker tab.
///
/// The mode follows her life stage (spec 5.4): cycle, pregnancy, postpartum or
/// menopause. She can always open the cycle calendar anyway — a pregnancy can
/// end, and a stage in a profile is not always the stage she is in today.
class TrackerScreen extends ConsumerStatefulWidget {
  const TrackerScreen({super.key});

  @override
  ConsumerState<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends ConsumerState<TrackerScreen> {
  DateTime _selectedDay = today();
  DateTime _focusedDay = today();

  /// Set when she opens the cycle calendar from another mode.
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
          if (showCycle && mode == TrackerMode.cycle)
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
          if (mode != TrackerMode.cycle && showCycle) ...[
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton.icon(
                onPressed: () => setState(() => _forceCycleMode = false),
                icon: const Icon(Icons.arrow_back_rounded),
                label: Text(l10n.trackerBackToMode(mode.label(l10n))),
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
          ],
          if (!showCycle)
            switch (mode) {
              TrackerMode.pregnancy => const PregnancyModeView(),
              TrackerMode.postpartum => const PostpartumModeView(),
              TrackerMode.menopause => const MenopauseModeView(),
              TrackerMode.cycle => const SizedBox.shrink(),
            }
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
          if (!showCycle) ...[
            const SizedBox(height: AppSpacing.md),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton.icon(
                onPressed: () => setState(() => _forceCycleMode = true),
                icon: const Icon(Icons.calendar_month_outlined),
                label: Text(l10n.trackerCycleCalendar),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            DisclaimerCard(text: l10n.predictionDisclaimer),
          ],
        ],
      ),
    );
  }
}
