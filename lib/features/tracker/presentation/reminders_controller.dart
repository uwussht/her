import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/services/notifications/notification_service.dart';
import '../../../core/services/storage/preferences_service.dart';
import '../../../core/utils/app_env.dart';
import '../../../core/utils/date_utils.dart';
import '../../profile/domain/personalization.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../domain/reminder.dart';
import '../domain/reminder_scheduler.dart';
import '../domain/vaccination.dart';
import 'tracker_providers.dart';

part 'reminders_controller.g.dart';

const _uuid = Uuid();

@Riverpod(keepAlive: true)
NotificationService notificationService(Ref ref) {
  if (AppEnv.useMocks) return const NoopNotificationService();
  return LocalNotificationService(
    hideContent: ref.watch(preferencesServiceProvider).hideNotificationContent,
  );
}

@Riverpod(keepAlive: true)
ReminderScheduler reminderScheduler(Ref ref) =>
    ReminderScheduler(service: ref.watch(predictionServiceProvider));

/// Her reminders. New users start with the defaults for their life stage.
@Riverpod(keepAlive: true)
class RemindersController extends _$RemindersController {
  @override
  List<Reminder> build() {
    final stored = ref.watch(trackerSettingsRepositoryProvider).readReminders();
    if (stored.isNotEmpty) return stored;
    final stage = ref.watch(userProfileControllerProvider)?.lifeStage;
    return stage == LifeStage.tryingToConceive
        ? DefaultReminders.forConceiving()
        : DefaultReminders.forCycleTracking();
  }

  Future<void> _write(List<Reminder> reminders) async {
    state = reminders;
    await ref.read(trackerSettingsRepositoryProvider).saveReminders(reminders);
  }

  Future<void> update(Reminder reminder) => _write([
    for (final item in state)
      if (item.id == reminder.id) reminder else item,
  ]);

  Future<void> toggle(Reminder reminder, {required bool enabled}) =>
      update(reminder.copyWith(enabled: enabled));

  Future<void> add(Reminder reminder) => _write([...state, reminder]);

  Future<void> remove(String id) => _write([
    for (final item in state)
      if (item.id != id) item,
  ]);

  Future<void> addDoctorVisit({
    required DateTime date,
    required ReminderTime time,
    String? label,
  }) => add(
    Reminder(
      id: 'doctor.${_uuid.v4()}',
      type: ReminderType.doctorVisit,
      time: time,
      date: date.dateOnly,
      label: label,
    ),
  );

  Future<void> addVaccinationReminder(Vaccination vaccination) async {
    final existing = state.any((item) => item.vaccinationId == vaccination.id);
    if (existing) return;
    await add(
      Reminder(
        id: 'vaccination.${vaccination.id}',
        type: ReminderType.vaccination,
        time: ReminderTime.morning,
        vaccinationId: vaccination.id,
      ),
    );
  }
}

/// Her vaccination plan, seeded from the age- and stage-based schedule.
@Riverpod(keepAlive: true)
class VaccinationsController extends _$VaccinationsController {
  static const VaccinationSchedule schedule = VaccinationSchedule();

  @override
  List<Vaccination> build() {
    final stored = ref
        .watch(trackerSettingsRepositoryProvider)
        .readVaccinations();
    if (stored.isNotEmpty) return stored;
    final profile = ref.watch(userProfileControllerProvider);
    if (profile == null) return const [];
    final from = today();
    return [
      for (final code in schedule.suggestionsFor(
        ageGroup: profile.ageGroup,
        lifeStage: profile.lifeStage,
      ))
        Vaccination(
          id: 'vac.${code.name}',
          code: code,
          dueDate: schedule.defaultDueDate(code, from),
        ),
    ]..sort((a, b) => a.dueDate.compareTo(b.dueDate));
  }

  Future<void> _write(List<Vaccination> vaccinations) async {
    final sorted = [...vaccinations]
      ..sort((a, b) => a.dueDate.compareTo(b.dueDate));
    state = sorted;
    await ref.read(trackerSettingsRepositoryProvider).saveVaccinations(sorted);
  }

  Future<void> update(Vaccination vaccination) => _write([
    for (final item in state)
      if (item.id == vaccination.id)
        vaccination.copyWith(suggested: false)
      else
        item,
  ]);

  Future<void> setStatus(Vaccination vaccination, VaccinationStatus status) =>
      update(vaccination.copyWith(status: status));

  Future<void> setDueDate(Vaccination vaccination, DateTime dueDate) =>
      update(vaccination.copyWith(dueDate: dueDate.dateOnly));

  Future<void> add({required VaccineCode code, required DateTime dueDate}) =>
      _write([
        ...state,
        Vaccination(
          id: 'vac.${_uuid.v4()}',
          code: code,
          dueDate: dueDate.dateOnly,
          suggested: false,
        ),
      ]);

  Future<void> remove(String id) => _write([
    for (final item in state)
      if (item.id != id) item,
  ]);
}
