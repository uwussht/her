import '../../../core/services/notifications/notification_service.dart';
import '../../../core/utils/date_utils.dart';
import 'cycle_prediction.dart';
import 'prediction_service.dart';
import 'reminder.dart';
import 'vaccination.dart';

/// Localized text for one reminder occurrence.
typedef ReminderText = ({String title, String body});

/// Supplies the wording for each reminder kind. Implemented in the
/// presentation layer from the ARB strings, so this file stays free of
/// hardcoded copy.
abstract interface class ReminderTexts {
  ReminderText periodComing(int daysBefore);

  ReminderText fertileWindow();

  ReminderText pill();

  ReminderText water();

  ReminderText doctorVisit(String? label);

  ReminderText vaccination(VaccineCode code);
}

/// Turns reminders into concrete notification times.
///
/// Pure and side-effect free: it takes the forecast and returns what should
/// be scheduled, which makes the timing rules unit-testable.
class ReminderScheduler {
  const ReminderScheduler({this.service = const PredictionService()});

  final PredictionService service;

  /// Cycle-driven reminders are scheduled this many cycles ahead, so they
  /// keep firing if the app is not opened for a while.
  static const int cyclesAhead = 3;

  /// Water reminders are spread across the waking day.
  static const int waterStartHour = 8;
  static const int waterEndHour = 22;

  List<ScheduledNotification> build({
    required List<Reminder> reminders,
    required ReminderTexts texts,
    CyclePrediction? prediction,
    List<Vaccination> vaccinations = const [],
    DateTime? now,
  }) {
    final from = now ?? DateTime.now();
    final result = <ScheduledNotification>[];

    for (var index = 0; index < reminders.length; index++) {
      final reminder = reminders[index];
      if (!reminder.enabled) continue;
      final base = (index + 1) * Reminder.notificationIdSpan;
      result.addAll(
        _forReminder(
          reminder: reminder,
          idBase: base,
          texts: texts,
          prediction: prediction,
          vaccinations: vaccinations,
          from: from,
        ),
      );
    }
    return result;
  }

  Iterable<ScheduledNotification> _forReminder({
    required Reminder reminder,
    required int idBase,
    required ReminderTexts texts,
    required CyclePrediction? prediction,
    required List<Vaccination> vaccinations,
    required DateTime from,
  }) {
    switch (reminder.type) {
      case ReminderType.periodComing:
        if (prediction == null) return const [];
        final text = texts.periodComing(reminder.daysBefore);
        return _cycleOccurrences(
          starts: service
              .projectFuturePeriods(prediction, count: cyclesAhead)
              .map((period) => period.start.addDays(-reminder.daysBefore)),
          reminder: reminder,
          idBase: idBase,
          text: text,
          from: from,
        );

      case ReminderType.fertileWindow:
        if (prediction == null) return const [];
        final text = texts.fertileWindow();
        return _cycleOccurrences(
          starts: service
              .projectFutureFertileWindows(prediction, count: cyclesAhead)
              .map((window) => window.start),
          reminder: reminder,
          idBase: idBase,
          text: text,
          from: from,
        );

      case ReminderType.pill:
        final text = texts.pill();
        return [
          ScheduledNotification(
            id: idBase,
            title: text.title,
            body: text.body,
            when: _at(from.dateOnly, reminder.time),
            repeatsDaily: true,
            channel: NotificationChannel.sensitive,
          ),
        ];

      case ReminderType.water:
        final text = texts.water();
        final times = reminder.timesPerDay.clamp(1, Reminder.maxTimesPerDay);
        const span = waterEndHour - waterStartHour;
        return [
          for (var i = 0; i < times; i++)
            ScheduledNotification(
              id: idBase + i,
              title: text.title,
              body: text.body,
              when: DateTime(
                from.year,
                from.month,
                from.day,
                waterStartHour + (times == 1 ? span ~/ 2 : span * i ~/ times),
              ),
              repeatsDaily: true,
            ),
        ];

      case ReminderType.doctorVisit:
        final date = reminder.date;
        if (date == null) return const [];
        final text = texts.doctorVisit(reminder.label);
        return [
          ScheduledNotification(
            id: idBase,
            title: text.title,
            body: text.body,
            when: _at(date, reminder.time),
            channel: NotificationChannel.sensitive,
          ),
        ];

      case ReminderType.vaccination:
        final vaccination = vaccinations.firstWhere(
          (item) => item.id == reminder.vaccinationId,
          orElse: () => _missing,
        );
        if (vaccination.id.isEmpty || !vaccination.isOpen) return const [];
        final text = texts.vaccination(vaccination.code);
        return [
          ScheduledNotification(
            id: idBase,
            title: text.title,
            body: text.body,
            when: _at(vaccination.dueDate, reminder.time),
            channel: NotificationChannel.sensitive,
          ),
        ];
    }
  }

  Iterable<ScheduledNotification> _cycleOccurrences({
    required Iterable<DateTime> starts,
    required Reminder reminder,
    required int idBase,
    required ReminderText text,
    required DateTime from,
  }) {
    final occurrences = <ScheduledNotification>[];
    var slot = 0;
    for (final date in starts) {
      final when = _at(date, reminder.time);
      if (when.isBefore(from)) continue;
      occurrences.add(
        ScheduledNotification(
          id: idBase + slot,
          title: text.title,
          body: text.body,
          when: when,
          channel: NotificationChannel.sensitive,
        ),
      );
      slot++;
    }
    return occurrences;
  }

  static DateTime _at(DateTime date, ReminderTime time) =>
      DateTime(date.year, date.month, date.day, time.hour, time.minute);

  static final Vaccination _missing = Vaccination(
    id: '',
    code: VaccineCode.flu,
    dueDate: DateTime(1970),
  );
}

/// The reminders a new user starts with, matched to her life stage.
abstract final class DefaultReminders {
  static List<Reminder> forCycleTracking() => [
    const Reminder(
      id: 'default.period',
      type: ReminderType.periodComing,
      time: ReminderTime.evening,
    ),
    const Reminder(
      id: 'default.water',
      type: ReminderType.water,
      time: ReminderTime.morning,
      enabled: false,
    ),
    const Reminder(
      id: 'default.pill',
      type: ReminderType.pill,
      time: ReminderTime.evening,
      enabled: false,
    ),
  ];

  static List<Reminder> forConceiving() => [
    ...forCycleTracking(),
    const Reminder(
      id: 'default.fertile',
      type: ReminderType.fertileWindow,
      time: ReminderTime.morning,
    ),
  ];
}
