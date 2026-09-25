import '../../../core/services/storage/local_store.dart';
import '../../../core/utils/date_utils.dart';
import '../domain/cycle.dart';
import '../domain/daily_log.dart';
import '../domain/tracker_repository.dart';

/// Tracker storage in the encrypted local store, one document per user.
///
/// Cycles and logs are small (a few hundred entries at most), so they are
/// held in a single document each and rewritten on save. Nothing leaves the
/// device: cloud sync is opt-in and arrives behind this interface.
class LocalTrackerRepository implements TrackerRepository {
  const LocalTrackerRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _cyclesKey => 'tracker.cycles.$_uid';
  String get _logsKey => 'tracker.logs.$_uid';

  @override
  List<Cycle> readCycles() {
    final json = _store.readJson(_cyclesKey);
    final items = json?['items'] as List<dynamic>? ?? const [];
    return [
      for (final item in items) Cycle.fromJson(item as Map<String, dynamic>),
    ];
  }

  @override
  Future<void> saveCycle(Cycle cycle) async {
    final cycles = readCycles()
      ..removeWhere(
        (existing) =>
            existing.id == cycle.id ||
            existing.startDate.isSameDay(cycle.startDate),
      )
      ..add(cycle);
    await _writeCycles(cycles);
  }

  @override
  Future<void> deleteCycle(String id) async {
    final cycles = readCycles()..removeWhere((cycle) => cycle.id == id);
    await _writeCycles(cycles);
  }

  @override
  Map<DateTime, DailyLog> readLogs() {
    final json = _store.readJson(_logsKey);
    final items = json?['items'] as List<dynamic>? ?? const [];
    return {
      for (final item in items)
        if (DailyLog.fromJson(item as Map<String, dynamic>) case final log)
          log.date.dateOnly: log,
    };
  }

  @override
  Future<void> saveLog(DailyLog log) async {
    final logs = readLogs()..[log.date.dateOnly] = log;
    await _writeLogs(logs);
  }

  @override
  Future<void> deleteLog(DateTime date) async {
    final logs = readLogs()..remove(date.dateOnly);
    await _writeLogs(logs);
  }

  @override
  Future<void> clear() async {
    await _store.delete(_cyclesKey);
    await _store.delete(_logsKey);
  }

  Future<void> _writeCycles(List<Cycle> cycles) {
    cycles.sort((a, b) => a.startDate.compareTo(b.startDate));
    return _store.writeJson(_cyclesKey, {
      'items': [for (final cycle in cycles) cycle.toJson()],
    });
  }

  Future<void> _writeLogs(Map<DateTime, DailyLog> logs) {
    final sorted = logs.values.toList()
      ..sort((a, b) => a.date.compareTo(b.date));
    return _store.writeJson(_logsKey, {
      'items': [for (final log in sorted) log.toJson()],
    });
  }
}
