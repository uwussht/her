import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage/local_store.dart';
import '../../../core/utils/date_utils.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../profile/domain/personalization.dart';
import '../../profile/domain/user_profile.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../data/local_tracker_repository.dart';
import '../data/local_tracker_settings_repository.dart';
import '../domain/cycle.dart';
import '../domain/cycle_prediction.dart';
import '../domain/cycle_timeline.dart';
import '../domain/daily_log.dart';
import '../domain/prediction_service.dart';
import '../domain/tracker_repository.dart';
import '../domain/tracker_settings_repository.dart';

part 'tracker_providers.g.dart';

/// Which tracker mode to show. Follows her life stage; pregnancy and
/// menopause modes arrive in step 10.
enum TrackerMode {
  cycle,
  pregnancy,
  postpartum,
  menopause;

  static TrackerMode forStage(LifeStage? stage) => switch (stage) {
    LifeStage.pregnant => TrackerMode.pregnancy,
    LifeStage.postpartum => TrackerMode.postpartum,
    LifeStage.perimenopause || LifeStage.menopause => TrackerMode.menopause,
    _ => TrackerMode.cycle,
  };
}

@Riverpod(keepAlive: true)
PredictionService predictionService(Ref ref) => const PredictionService();

@Riverpod(keepAlive: true)
TrackerRepository trackerRepository(Ref ref) {
  final uid = ref.watch(currentUserProvider)?.uid;
  return LocalTrackerRepository(ref.watch(localStoreProvider), uid ?? 'guest');
}

@Riverpod(keepAlive: true)
TrackerSettingsRepository trackerSettingsRepository(Ref ref) {
  final uid = ref.watch(currentUserProvider)?.uid;
  return LocalTrackerSettingsRepository(
    ref.watch(localStoreProvider),
    uid ?? 'guest',
  );
}

@Riverpod(keepAlive: true)
TrackerMode trackerMode(Ref ref) =>
    TrackerMode.forStage(ref.watch(userProfileControllerProvider)?.lifeStage);

/// Cycles and daily logs for the signed-in user.
@Riverpod(keepAlive: true)
class TrackerController extends _$TrackerController {
  TrackerRepository get _repo => ref.read(trackerRepositoryProvider);

  @override
  TrackerData build() {
    final repo = ref.watch(trackerRepositoryProvider);
    final stored = repo.readCycles();
    final profile = ref.watch(userProfileControllerProvider);
    return TrackerData(
      // Until she logs a period, the date from the quiz anchors the forecast.
      cycles: stored.isEmpty ? _seedFromProfile(profile) : stored,
      logs: repo.readLogs(),
    );
  }

  static List<Cycle> _seedFromProfile(UserProfile? profile) {
    final start = profile?.lastPeriodStart;
    if (start == null) return const [];
    return [Cycle(id: cycleIdFor(start), startDate: start.dateOnly)];
  }

  /// Stable, date-derived id so the same day never produces two cycles.
  static String cycleIdFor(DateTime start) =>
      'cycle.${start.year}-${start.month.toString().padLeft(2, '0')}'
      '-${start.day.toString().padLeft(2, '0')}';

  /// Writes the date from the quiz to storage the first time anything is
  /// saved, so that first data point is not lost behind the new entry.
  Future<void> _ensureSeeded() async {
    if (_repo.readCycles().isNotEmpty) return;
    for (final cycle in _seedFromProfile(
      ref.read(userProfileControllerProvider),
    )) {
      await _repo.saveCycle(cycle);
    }
  }

  /// Marks [date] as the first day of a period, starting a new cycle.
  Future<void> startPeriod(DateTime date) async {
    await _ensureSeeded();
    final day = date.dateOnly;
    final cycle = Cycle(id: cycleIdFor(day), startDate: day);
    await _repo.saveCycle(cycle);
    _refresh();
  }

  /// Sets the last day of bleeding for the cycle that [date] belongs to.
  Future<void> endPeriod(DateTime date) async {
    await _ensureSeeded();
    final day = date.dateOnly;
    final cycle = _cycleContaining(day);
    if (cycle == null) return;
    await _repo.saveCycle(cycle.copyWith(periodEndDate: day));
    _refresh();
  }

  /// Removes the period mark that covers [date].
  Future<void> removePeriodMark(DateTime date) async {
    await _ensureSeeded();
    final day = date.dateOnly;
    final cycle = state.cycles.firstWhereOrNull(
      (item) => item.coversPeriodDay(day),
    );
    if (cycle == null) return;
    if (cycle.startDate.isSameDay(day)) {
      await _repo.deleteCycle(cycle.id);
    } else if (cycle.startDate.addDays(1).isSameDay(day)) {
      // Removing the second day leaves a single-day period.
      await _repo.saveCycle(cycle.copyWith(periodEndDate: cycle.startDate));
    } else {
      await _repo.saveCycle(cycle.copyWith(periodEndDate: day.addDays(-1)));
    }
    _refresh();
  }

  Future<void> saveLog(DailyLog log) async {
    await _ensureSeeded();
    if (log.isEmpty) {
      await _repo.deleteLog(log.date);
    } else {
      await _repo.saveLog(log);
    }
    _refresh();
  }

  Future<void> deleteLog(DateTime date) async {
    await _repo.deleteLog(date);
    _refresh();
  }

  /// The cycle [day] belongs to: the most recent one that started on or
  /// before it.
  Cycle? _cycleContaining(DateTime day) {
    Cycle? match;
    for (final cycle in state.cycles) {
      if (!cycle.startDate.isAfter(day)) match = cycle;
    }
    return match;
  }

  void _refresh() {
    state = TrackerData(cycles: _repo.readCycles(), logs: _repo.readLogs());
  }
}

/// Raw tracker state.
class TrackerData {
  const TrackerData({required this.cycles, required this.logs});

  final List<Cycle> cycles;
  final Map<DateTime, DailyLog> logs;
}

@Riverpod(keepAlive: true)
CyclePrediction? cyclePrediction(Ref ref) {
  final data = ref.watch(trackerControllerProvider);
  final profile = ref.watch(userProfileControllerProvider);
  return ref
      .watch(predictionServiceProvider)
      .predict(cycles: data.cycles, fallbackCycleLength: profile?.cycleLength);
}

/// What the tracker UI reads: cycles, logs, forecast and day phases.
@Riverpod(keepAlive: true)
CycleTimeline cycleTimeline(Ref ref) {
  final data = ref.watch(trackerControllerProvider);
  return CycleTimeline(
    cycles: data.cycles,
    logs: data.logs,
    prediction: ref.watch(cyclePredictionProvider),
    service: ref.watch(predictionServiceProvider),
  );
}

extension _FirstWhereOrNull<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final item in this) {
      if (test(item)) return item;
    }
    return null;
  }
}
