import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/context_extensions.dart';
import 'reminders_controller.dart';
import 'tracker_labels.dart';
import 'tracker_providers.dart';

/// Keeps the scheduled local notifications in step with her reminders, the
/// cycle forecast and the vaccination plan.
///
/// Wraps the whole app so it survives navigation, and sits inside
/// [Localizations] so notification text is in her language.
class ReminderSync extends ConsumerStatefulWidget {
  const ReminderSync({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<ReminderSync> createState() => _ReminderSyncState();
}

class _ReminderSyncState extends ConsumerState<ReminderSync> {
  bool _syncing = false;
  bool _dirty = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Locale changes reword every scheduled notification.
    _scheduleSync();
  }

  void _scheduleSync() {
    _dirty = true;
    // Coalesce the bursts that follow a single save.
    scheduleMicrotask(_sync);
  }

  Future<void> _sync() async {
    if (_syncing || !_dirty || !mounted) return;
    _syncing = true;
    _dirty = false;
    try {
      final notifications = ref
          .read(reminderSchedulerProvider)
          .build(
            reminders: ref.read(remindersControllerProvider),
            texts: L10nReminderTexts(context.l10n),
            prediction: ref.read(cyclePredictionProvider),
            vaccinations: ref.read(vaccinationsControllerProvider),
          );
      await ref
          .read(notificationServiceProvider)
          .reschedule(notifications: notifications);
    } on Exception catch (error, stack) {
      // A failed schedule must never take the app down with it.
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stack,
          library: 'tracker',
          context: ErrorDescription('while rescheduling reminders'),
        ),
      );
    } finally {
      _syncing = false;
      if (_dirty) unawaited(_sync());
    }
  }

  @override
  Widget build(BuildContext context) {
    ref
      ..listen(remindersControllerProvider, (_, _) => _scheduleSync())
      ..listen(vaccinationsControllerProvider, (_, _) => _scheduleSync())
      ..listen(cyclePredictionProvider, (_, _) => _scheduleSync());
    return widget.child;
  }
}
