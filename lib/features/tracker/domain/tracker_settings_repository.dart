import 'reminder.dart';
import 'vaccination.dart';

/// Storage for reminders and the vaccination list.
abstract interface class TrackerSettingsRepository {
  List<Reminder> readReminders();

  Future<void> saveReminders(List<Reminder> reminders);

  List<Vaccination> readVaccinations();

  Future<void> saveVaccinations(List<Vaccination> vaccinations);
}
