import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/services/storage/preferences_service.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/widgets/widgets.dart';
import '../domain/reminder.dart';
import 'reminders_controller.dart';
import 'tracker_labels.dart';

/// Turns reminders on and off, and retimes them.
class RemindersScreen extends ConsumerStatefulWidget {
  const RemindersScreen({super.key});

  @override
  ConsumerState<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends ConsumerState<RemindersScreen> {
  /// Asks for the Android notification permission the first time she turns
  /// a reminder on.
  Future<void> _ensurePermission() async {
    final prefs = ref.read(preferencesServiceProvider);
    if (prefs.notificationsRequested) return;
    final granted = await ref
        .read(notificationServiceProvider)
        .requestPermission();
    await prefs.setNotificationsRequested();
    if (!mounted || granted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(context.l10n.notificationsDenied)));
  }

  Future<void> _toggle(Reminder reminder, bool enabled) async {
    await ref
        .read(remindersControllerProvider.notifier)
        .toggle(reminder, enabled: enabled);
    if (enabled) await _ensurePermission();
  }

  Future<void> _pickTime(Reminder reminder) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: reminder.time.hour,
        minute: reminder.time.minute,
      ),
    );
    if (picked == null) return;
    await ref
        .read(remindersControllerProvider.notifier)
        .update(
          reminder.copyWith(
            time: ReminderTime(hour: picked.hour, minute: picked.minute),
          ),
        );
  }

  Future<void> _addDoctorVisit() async {
    final now = today();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2, now.month, now.day),
      helpText: context.l10n.reminderAddDoctorVisit,
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    );
    if (time == null) return;
    await ref
        .read(remindersControllerProvider.notifier)
        .addDoctorVisit(
          date: date,
          time: ReminderTime(hour: time.hour, minute: time.minute),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final reminders = ref.watch(remindersControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.remindersTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: [
          Text(
            l10n.remindersSubtitle,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.palette.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          for (final reminder in reminders) ...[
            _ReminderTile(
              reminder: reminder,
              onToggle: (enabled) => _toggle(reminder, enabled),
              onPickTime: () => _pickTime(reminder),
              onDaysBefore: (days) => ref
                  .read(remindersControllerProvider.notifier)
                  .update(reminder.copyWith(daysBefore: days)),
              onDelete:
                  reminder.type == ReminderType.doctorVisit ||
                      reminder.type == ReminderType.vaccination
                  ? () => _delete(reminder)
                  : null,
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
          const SizedBox(height: AppSpacing.xs),
          OutlinedButton.icon(
            onPressed: _addDoctorVisit,
            icon: const Icon(Icons.add_rounded),
            label: Text(l10n.reminderAddDoctorVisit),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            padding: EdgeInsets.zero,
            child: ListTile(
              leading: const Icon(Icons.vaccines_rounded),
              title: Text(l10n.vaccinationsTitle),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(AppRoutes.vaccinations),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          _HideContentSwitch(),
        ],
      ),
    );
  }

  Future<void> _delete(Reminder reminder) async {
    final messenger = ScaffoldMessenger.of(context);
    final message = context.l10n.reminderDeleted;
    await ref.read(remindersControllerProvider.notifier).remove(reminder.id);
    messenger.showSnackBar(SnackBar(content: Text(message)));
  }
}

class _ReminderTile extends StatelessWidget {
  const _ReminderTile({
    required this.reminder,
    required this.onToggle,
    required this.onPickTime,
    required this.onDaysBefore,
    this.onDelete,
  });

  final Reminder reminder;
  final ValueChanged<bool> onToggle;
  final VoidCallback onPickTime;
  final ValueChanged<int> onDaysBefore;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final timeLabel = DateFormat.Hm(locale)
        .format(DateTime(2026, 1, 1, reminder.time.hour, reminder.time.minute));

    return AppCard(
      child: Column(
        children: [
          Row(
            children: [
              IconBubble(
                icon: reminder.type.icon,
                size: 40,
                tone: reminder.type == ReminderType.fertileWindow
                    ? AppTone.green
                    : AppTone.pink,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reminder.label?.trim().isNotEmpty ?? false
                          ? reminder.label!.trim()
                          : reminder.type.label(l10n),
                      style: context.textTheme.titleSmall,
                    ),
                    Text(
                      _subtitle(context, timeLabel),
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Switch(value: reminder.enabled, onChanged: onToggle),
            ],
          ),
          if (reminder.enabled) ...[
            const Divider(height: AppSpacing.lg),
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: onPickTime,
                    icon: const Icon(Icons.schedule_rounded),
                    label: Text(l10n.reminderTimeAt(timeLabel)),
                  ),
                ),
                if (reminder.type == ReminderType.periodComing)
                  DropdownButton<int>(
                    value: reminder.daysBefore,
                    underline: const SizedBox.shrink(),
                    items: [
                      for (var days = 1; days <= Reminder.maxDaysBefore; days++)
                        DropdownMenuItem(
                          value: days,
                          child: Text(l10n.reminderDaysBefore(days)),
                        ),
                    ],
                    onChanged: (days) {
                      if (days != null) onDaysBefore(days);
                    },
                  ),
                if (onDelete != null)
                  IconButton(
                    tooltip: l10n.actionDelete,
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline_rounded),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _subtitle(BuildContext context, String timeLabel) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    return switch (reminder.type) {
      ReminderType.periodComing =>
        '${l10n.reminderDaysBefore(reminder.daysBefore)} · $timeLabel',
      ReminderType.water => l10n.reminderTimesPerDay(reminder.timesPerDay),
      ReminderType.doctorVisit || ReminderType.vaccination =>
        reminder.date == null
            ? timeLabel
            : DateFormat.yMMMd(locale).format(reminder.date!),
      _ => timeLabel,
    };
  }
}

/// "Hide app content": reminders arrive with no details on the lock screen.
class _HideContentSwitch extends ConsumerStatefulWidget {
  @override
  ConsumerState<_HideContentSwitch> createState() => _HideContentSwitchState();
}

class _HideContentSwitchState extends ConsumerState<_HideContentSwitch> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final prefs = ref.watch(preferencesServiceProvider);
    return AppCard(
      padding: EdgeInsets.zero,
      child: SwitchListTile(
        value: prefs.hideNotificationContent,
        onChanged: (value) async {
          await prefs.setHideNotificationContent(value);
          // The notification service reads this on construction.
          ref.invalidate(notificationServiceProvider);
          if (mounted) setState(() {});
        },
        title: Text(l10n.privacyHideContent),
        subtitle: Text(l10n.privacyHideContentBody),
        secondary: const Icon(Icons.visibility_off_outlined),
      ),
    );
  }
}
