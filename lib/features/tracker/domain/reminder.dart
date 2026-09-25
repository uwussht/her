import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

/// What a reminder is for. The type decides how its next occurrence is
/// computed from the cycle forecast.
enum ReminderType {
  /// A few days before the predicted period.
  periodComing,

  /// The day the fertile window opens.
  fertileWindow,

  /// Daily contraceptive pill.
  pill,

  /// Water intake, a few times a day.
  water,

  /// A one-off appointment.
  doctorVisit,

  /// Driven by the vaccination schedule.
  vaccination;

  bool get isDaily => this == ReminderType.pill || this == ReminderType.water;

  /// Types tied to the cycle forecast, so they must be rescheduled whenever
  /// the prediction changes.
  bool get followsCycle =>
      this == ReminderType.periodComing || this == ReminderType.fertileWindow;
}

/// Time of day, stored without a date so it survives time-zone changes.
@freezed
abstract class ReminderTime with _$ReminderTime {
  const factory ReminderTime({required int hour, required int minute}) =
      _ReminderTime;

  const ReminderTime._();

  factory ReminderTime.fromJson(Map<String, dynamic> json) =>
      _$ReminderTimeFromJson(json);

  static const ReminderTime morning = ReminderTime(hour: 9, minute: 0);
  static const ReminderTime evening = ReminderTime(hour: 21, minute: 0);
}

/// A reminder she can switch on, retime or delete.
@freezed
abstract class Reminder with _$Reminder {
  const factory Reminder({
    required String id,
    required ReminderType type,
    required ReminderTime time,
    @Default(true) bool enabled,

    /// How many days ahead to warn, for [ReminderType.periodComing].
    @Default(3) int daysBefore,

    /// Times per day, for [ReminderType.water].
    @Default(4) int timesPerDay,

    /// Fixed date for one-off reminders (doctor visits, vaccinations).
    DateTime? date,

    /// Free-text label shown instead of the default title.
    String? label,

    /// Links a [ReminderType.vaccination] reminder to its schedule entry.
    String? vaccinationId,
  }) = _Reminder;

  const Reminder._();

  factory Reminder.fromJson(Map<String, dynamic> json) =>
      _$ReminderFromJson(json);

  static const int maxDaysBefore = 7;
  static const int maxTimesPerDay = 8;

  /// Stable notification ids: a reminder can occupy several slots (water
  /// several times a day, a cycle reminder across projected cycles), so each
  /// gets a small reserved block.
  static const int notificationIdSpan = 16;
}
