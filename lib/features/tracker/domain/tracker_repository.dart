import 'cycle.dart';
import 'daily_log.dart';

/// Local-first storage for cycles and daily logs.
abstract interface class TrackerRepository {
  List<Cycle> readCycles();

  Future<void> saveCycle(Cycle cycle);

  Future<void> deleteCycle(String id);

  /// Keyed by calendar day.
  Map<DateTime, DailyLog> readLogs();

  Future<void> saveLog(DailyLog log);

  Future<void> deleteLog(DateTime date);

  /// Removes every tracker entry, e.g. on account deletion.
  Future<void> clear();
}
