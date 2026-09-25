import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/services/notifications/notification_service.dart';
import 'package:her_circle/features/tracker/domain/prediction_service.dart';
import 'package:her_circle/features/tracker/domain/reminder.dart';
import 'package:her_circle/features/tracker/domain/reminder_scheduler.dart';
import 'package:her_circle/features/tracker/domain/vaccination.dart';

import 'prediction_service_test.dart' show cyclesFrom;

/// Predictable, non-localized copy so the timing rules are what's asserted.
class _TestTexts implements ReminderTexts {
  @override
  ReminderText periodComing(int daysBefore) =>
      (title: 'period', body: 'in $daysBefore');

  @override
  ReminderText fertileWindow() => (title: 'fertile', body: '');

  @override
  ReminderText pill() => (title: 'pill', body: '');

  @override
  ReminderText water() => (title: 'water', body: '');

  @override
  ReminderText doctorVisit(String? label) =>
      (title: label ?? 'doctor', body: '');

  @override
  ReminderText vaccination(VaccineCode code) =>
      (title: 'vaccine', body: code.name);
}

void main() {
  const scheduler = ReminderScheduler();
  final texts = _TestTexts();
  final now = DateTime(2026, 9, 10, 8);
  final prediction = const PredictionService().predict(
    cycles: cyclesFrom([DateTime(2026, 9, 1)], periodLength: 5),
    fallbackCycleLength: 28,
  );

  List<ScheduledNotification> build(List<Reminder> reminders) =>
      scheduler.build(
        reminders: reminders,
        texts: texts,
        prediction: prediction,
        now: now,
      );

  test('disabled reminders are not scheduled', () {
    final result = build([
      const Reminder(
        id: 'a',
        type: ReminderType.periodComing,
        time: ReminderTime.evening,
        enabled: false,
      ),
    ]);
    expect(result, isEmpty);
  });

  test('cycle reminders fire the chosen number of days before each period', () {
    final result = build([
      const Reminder(
        id: 'a',
        type: ReminderType.periodComing,
        time: ReminderTime.evening,
        daysBefore: 3,
      ),
    ]);

    expect(result.length, ReminderScheduler.cyclesAhead);
    // Predicted period starts 29 Sep, so a 3-day warning lands on 26 Sep.
    expect(result.first.when, DateTime(2026, 9, 26, 21));
    expect(result[1].when, DateTime(2026, 10, 24, 21));
    expect(result.first.body, 'in 3');
    // Every occurrence gets its own id.
    expect(result.map((item) => item.id).toSet().length, result.length);
  });

  test('occurrences already in the past are skipped', () {
    final late = scheduler.build(
      reminders: [
        const Reminder(
          id: 'a',
          type: ReminderType.periodComing,
          time: ReminderTime.evening,
          daysBefore: 3,
        ),
      ],
      texts: texts,
      prediction: prediction,
      // A month later: the first projected warning has passed.
      now: DateTime(2026, 9, 27),
    );
    expect(late.first.when, DateTime(2026, 10, 24, 21));
  });

  test('cycle reminders need a prediction', () {
    final result = scheduler.build(
      reminders: [
        const Reminder(
          id: 'a',
          type: ReminderType.fertileWindow,
          time: ReminderTime.morning,
        ),
      ],
      texts: texts,
      now: now,
    );
    expect(result, isEmpty);
  });

  test('fertile reminders land on the day the window opens', () {
    final result = build([
      const Reminder(
        id: 'a',
        type: ReminderType.fertileWindow,
        time: ReminderTime.morning,
      ),
    ]);
    // Ovulation 15 Sep, so the window opens on 10 Sep at 09:00.
    expect(result.first.when, DateTime(2026, 9, 10, 9));
  });

  test('the pill repeats daily and hides its content', () {
    final result = build([
      const Reminder(
        id: 'a',
        type: ReminderType.pill,
        time: ReminderTime.evening,
      ),
    ]);
    expect(result.single.repeatsDaily, isTrue);
    expect(result.single.when, DateTime(2026, 9, 10, 21));
    expect(result.single.channel, NotificationChannel.sensitive);
  });

  test('water reminders spread across the waking day', () {
    final result = build([
      const Reminder(
        id: 'a',
        type: ReminderType.water,
        time: ReminderTime.morning,
        timesPerDay: 4,
      ),
    ]);

    expect(result.length, 4);
    expect(result.map((item) => item.when.hour), [8, 11, 15, 18]);
    expect(result.every((item) => item.repeatsDaily), isTrue);
    // Water is not sensitive, so it can show its text.
    expect(result.first.channel, NotificationChannel.reminders);
  });

  test('a one-off doctor visit uses its own date and label', () {
    final result = build([
      Reminder(
        id: 'a',
        type: ReminderType.doctorVisit,
        time: const ReminderTime(hour: 14, minute: 30),
        date: DateTime(2026, 10, 5),
        label: 'Ultrasound',
      ),
    ]);
    expect(result.single.when, DateTime(2026, 10, 5, 14, 30));
    expect(result.single.title, 'Ultrasound');
    expect(result.single.repeatsDaily, isFalse);
  });

  test('vaccination reminders follow the plan and skip finished ones', () {
    final planned = Vaccination(
      id: 'v1',
      code: VaccineCode.hpv,
      dueDate: DateTime(2026, 11, 2),
    );
    final done = Vaccination(
      id: 'v2',
      code: VaccineCode.flu,
      dueDate: DateTime(2026, 11, 2),
      status: VaccinationStatus.done,
    );
    final reminders = [
      const Reminder(
        id: 'a',
        type: ReminderType.vaccination,
        time: ReminderTime.morning,
        vaccinationId: 'v1',
      ),
      const Reminder(
        id: 'b',
        type: ReminderType.vaccination,
        time: ReminderTime.morning,
        vaccinationId: 'v2',
      ),
      const Reminder(
        id: 'c',
        type: ReminderType.vaccination,
        time: ReminderTime.morning,
        vaccinationId: 'missing',
      ),
    ];

    final result = scheduler.build(
      reminders: reminders,
      texts: texts,
      prediction: prediction,
      vaccinations: [planned, done],
      now: now,
    );

    expect(result.length, 1);
    expect(result.single.body, 'hpv');
    expect(result.single.when, DateTime(2026, 11, 2, 9));
  });

  test('ids stay unique across a full reminder set', () {
    final result = build([
      const Reminder(
        id: 'a',
        type: ReminderType.periodComing,
        time: ReminderTime.evening,
      ),
      const Reminder(
        id: 'b',
        type: ReminderType.water,
        time: ReminderTime.morning,
        timesPerDay: 8,
      ),
      const Reminder(
        id: 'c',
        type: ReminderType.pill,
        time: ReminderTime.morning,
      ),
    ]);

    expect(result.map((item) => item.id).toSet().length, result.length);
  });

  test('defaults suit the life stage', () {
    expect(
      DefaultReminders.forCycleTracking().map((item) => item.type),
      containsAll([ReminderType.periodComing, ReminderType.water]),
    );
    expect(
      DefaultReminders.forConceiving().map((item) => item.type),
      contains(ReminderType.fertileWindow),
    );
    // Only the period reminder is on by default; the rest are opt-in.
    expect(
      DefaultReminders.forCycleTracking().where((item) => item.enabled).length,
      1,
    );
  });
}
