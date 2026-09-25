import '../../../core/services/storage/local_store.dart';
import '../domain/reminder.dart';
import '../domain/tracker_settings_repository.dart';
import '../domain/vaccination.dart';

class LocalTrackerSettingsRepository implements TrackerSettingsRepository {
  const LocalTrackerSettingsRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _remindersKey => 'tracker.reminders.$_uid';
  String get _vaccinationsKey => 'tracker.vaccinations.$_uid';

  @override
  List<Reminder> readReminders() {
    final items =
        _store.readJson(_remindersKey)?['items'] as List<dynamic>? ?? const [];
    return [
      for (final item in items) Reminder.fromJson(item as Map<String, dynamic>),
    ];
  }

  @override
  Future<void> saveReminders(List<Reminder> reminders) =>
      _store.writeJson(_remindersKey, {
        'items': [for (final reminder in reminders) reminder.toJson()],
      });

  @override
  List<Vaccination> readVaccinations() {
    final items =
        _store.readJson(_vaccinationsKey)?['items'] as List<dynamic>? ??
        const [];
    return [
      for (final item in items)
        Vaccination.fromJson(item as Map<String, dynamic>),
    ];
  }

  @override
  Future<void> saveVaccinations(List<Vaccination> vaccinations) {
    final sorted = [...vaccinations]
      ..sort((a, b) => a.dueDate.compareTo(b.dueDate));
    return _store.writeJson(_vaccinationsKey, {
      'items': [for (final vaccination in sorted) vaccination.toJson()],
    });
  }
}
