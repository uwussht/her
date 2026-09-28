import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/presentation/learn_providers.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../domain/pregnancy_status.dart';
import '../domain/tracker_enums.dart';
import 'pregnancy_providers.dart';
import 'tracker_providers.dart';
import 'widgets/daily_log_sheet.dart';
import 'widgets/mood_chart_card.dart';
import 'widgets/pregnancy_status_card.dart';
import 'widgets/reminders_summary_card.dart';
import 'widgets/symptom_summary_card.dart';

extension TrackerModeLabel on TrackerMode {
  String label(AppLocalizations l10n) => switch (this) {
    TrackerMode.cycle => l10n.trackerModeCycle,
    TrackerMode.pregnancy => l10n.trackerModePregnancy,
    TrackerMode.postpartum => l10n.trackerModePostpartum,
    TrackerMode.menopause => l10n.trackerModeMenopause,
  };
}

/// Pregnancy mode (spec 5.4): the week, the baby's size, the countdown, and
/// the three tools.
class PregnancyModeView extends ConsumerWidget {
  const PregnancyModeView({super.key});

  Future<void> _pickLastPeriod(BuildContext context, WidgetRef ref) async {
    final profile = ref.read(userProfileControllerProvider);
    if (profile == null) return;
    final now = today();
    final picked = await showDatePicker(
      context: context,
      initialDate: profile.lastPeriodStart ?? now,
      firstDate: now.addDays(-PregnancyStatus.maxWeek * 7),
      lastDate: now,
    );
    if (picked == null) return;
    await ref
        .read(userProfileControllerProvider.notifier)
        .save(profile.copyWith(lastPeriodStart: picked));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final status = ref.watch(pregnancyStatusProvider);

    if (status == null) {
      return FeaturePlaceholderAction(
        icon: Icons.pregnant_woman_rounded,
        title: l10n.pregnancyNoDateTitle,
        description: l10n.pregnancyNoDateBody,
        tone: AppTone.green,
        actionLabel: l10n.pregnancySetDate,
        onAction: () => _pickLastPeriod(context, ref),
      );
    }

    final babySize = ref.watch(babySizeThisWeekProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PregnancyStatusCard(
          status: status,
          babySize: babySize?.name.of(context),
          localeTag: ref.watch(localeTagProvider),
        ),
        const SizedBox(height: AppSpacing.md),
        SectionHeader(
          title: l10n.pregnancyToolsTitle,
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
        ),
        AppCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.child_care_rounded),
                title: Text(l10n.kickTitle),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push(AppRoutes.kickCounter),
              ),
              const Divider(indent: AppSpacing.md, endIndent: AppSpacing.md),
              ListTile(
                leading: const Icon(Icons.timer_outlined),
                title: Text(l10n.contractionTitle),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push(AppRoutes.contractionTimer),
              ),
              const Divider(indent: AppSpacing.md, endIndent: AppSpacing.md),
              ListTile(
                leading: const Icon(Icons.monitor_weight_outlined),
                title: Text(l10n.weightTitle),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push(AppRoutes.weightLog),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        LoadingButton(
          label: l10n.logToday,
          icon: Icons.edit_note_rounded,
          onPressed: () => DailyLogSheet.show(context, today()),
        ),
        const SizedBox(height: AppSpacing.md),
        SymptomSummaryCard(
          summary: ref.watch(symptomSummaryProvider()),
          localeTag: ref.watch(localeTagProvider),
        ),
        const SizedBox(height: AppSpacing.md),
        RemindersSummaryCard(onTap: () => context.push(AppRoutes.reminders)),
      ],
    );
  }
}

/// Postpartum mode: how long since the birth, and how she is doing.
class PostpartumModeView extends ConsumerWidget {
  const PostpartumModeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final timeline = ref.watch(cycleTimelineProvider);
    // The birth is dated from her last period plus a full term, which is all
    // the profile knows. PregnancyStatus stops at 42 weeks, so this does the
    // arithmetic itself.
    final lastPeriod = ref
        .watch(userProfileControllerProvider)
        ?.lastPeriodStart;
    final daysSinceDue = lastPeriod
        ?.addDays(PregnancyStatus.fullTermDays)
        .daysUntil(today());
    final weeksSinceBirth = daysSinceDue == null || daysSinceDue < 0
        ? null
        : daysSinceDue ~/ 7;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCard(
          color: context.palette.successContainer,
          elevated: false,
          child: Row(
            children: [
              const IconBubble(
                icon: Icons.child_friendly_rounded,
                tone: AppTone.green,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (weeksSinceBirth != null)
                      Text(
                        l10n.postpartumWeeks(weeksSinceBirth),
                        style: context.textTheme.titleMedium,
                      ),
                    Text(
                      l10n.postpartumIntro,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        LoadingButton(
          label: l10n.logToday,
          icon: Icons.edit_note_rounded,
          onPressed: () => DailyLogSheet.show(context, today()),
        ),
        const SizedBox(height: AppSpacing.md),
        SymptomSummaryCard(
          summary: ref.watch(symptomSummaryProvider()),
          localeTag: ref.watch(localeTagProvider),
        ),
        const SizedBox(height: AppSpacing.md),
        MoodChartCard(timeline: timeline),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          padding: EdgeInsets.zero,
          child: ListTile(
            leading: const Icon(Icons.monitor_weight_outlined),
            title: Text(l10n.weightTitle),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push(AppRoutes.weightLog),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        RemindersSummaryCard(onTap: () => context.push(AppRoutes.reminders)),
      ],
    );
  }
}

/// Menopause mode (spec 5.4): the symptom log — hot flashes, sleep, mood.
class MenopauseModeView extends ConsumerWidget {
  const MenopauseModeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final localeTag = ref.watch(localeTagProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCard(
          color: context.palette.warningContainer,
          elevated: false,
          child: Row(
            children: [
              const IconBubble(
                icon: Icons.wb_twilight_rounded,
                tone: AppTone.warning,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  l10n.menopauseIntro,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        LoadingButton(
          label: l10n.logToday,
          icon: Icons.edit_note_rounded,
          onPressed: () => DailyLogSheet.show(context, today()),
        ),
        const SizedBox(height: AppSpacing.md),
        // The menopause section of the log sheet first: hot flashes and night
        // sweats are what she opened this screen for.
        SymptomSummaryCard(
          summary: ref.watch(
            symptomSummaryProvider(group: SymptomGroup.menopause),
          ),
          localeTag: localeTag,
        ),
        const SizedBox(height: AppSpacing.md),
        SymptomSummaryCard(
          summary: ref.watch(symptomSummaryProvider()),
          localeTag: localeTag,
        ),
        const SizedBox(height: AppSpacing.md),
        MoodChartCard(timeline: ref.watch(cycleTimelineProvider)),
        const SizedBox(height: AppSpacing.md),
        RemindersSummaryCard(onTap: () => context.push(AppRoutes.reminders)),
      ],
    );
  }
}
