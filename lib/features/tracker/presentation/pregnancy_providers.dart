import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/services/storage/local_store.dart';
import '../../../core/utils/date_utils.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../home/presentation/home_providers.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../data/local_pregnancy_repository.dart';
import '../domain/contraction.dart';
import '../domain/kick_session.dart';
import '../domain/pregnancy_repository.dart';
import '../domain/pregnancy_status.dart';
import '../domain/symptom_summary.dart';
import '../domain/tracker_enums.dart';
import '../domain/weight_entry.dart';
import 'tracker_providers.dart';

part 'pregnancy_providers.g.dart';

const _uuid = Uuid();

@Riverpod(keepAlive: true)
PregnancyRepository pregnancyRepository(Ref ref) => LocalPregnancyRepository(
  ref.watch(localStoreProvider),
  ref.watch(currentUserProvider)?.uid ?? 'guest',
);

@Riverpod(keepAlive: true)
ContractionAnalyser contractionAnalyser(Ref ref) => const ContractionAnalyser();

/// A clock the running timers rebuild on.
///
/// A provider rather than a widget timer, so tests can override it with an
/// empty stream and still drive the counters through the controllers.
@riverpod
Stream<DateTime> ticker(Ref ref) => Stream<DateTime>.periodic(
  const Duration(seconds: 1),
  (_) => DateTime.now(),
);

/// Where she is in the pregnancy, from the last period in her profile.
@riverpod
PregnancyStatus? pregnancyStatus(Ref ref) {
  final lastPeriod = ref.watch(userProfileControllerProvider)?.lastPeriodStart;
  if (lastPeriod == null) return null;
  return PregnancyStatus.fromLastPeriod(lastPeriod, DateTime.now());
}

/// This week's baby size, if the mock data covers the week.
@riverpod
BabySize? babySizeThisWeek(Ref ref) {
  final week = ref.watch(pregnancyStatusProvider)?.week;
  if (week == null) return null;
  for (final size in ref.watch(babySizesProvider).value ?? const <BabySize>[]) {
    if (size.week == week) return size;
  }
  return null;
}

/// Kick counting (spec 5.4).
@Riverpod(keepAlive: true)
class KickCounterController extends _$KickCounterController {
  @override
  List<KickSession> build() =>
      ref.watch(pregnancyRepositoryProvider).readKickSessions();

  /// The session she is counting in, if any.
  KickSession? get running {
    for (final session in state) {
      if (session.isRunning) return session;
    }
    return null;
  }

  /// Newest first, for the history list.
  List<KickSession> get history =>
      [...state]..sort((a, b) => b.startedAt.compareTo(a.startedAt));

  /// Starts a session, or returns the one already running.
  Future<KickSession> start({DateTime? now}) async {
    final existing = running;
    if (existing != null) return existing;
    final session = KickSession(
      id: _uuid.v4(),
      startedAt: now ?? DateTime.now(),
    );
    await _write([...state, session]);
    return session;
  }

  /// Counts a movement, starting a session if she has not already.
  Future<KickSession> kick({DateTime? now}) async {
    final at = now ?? DateTime.now();
    final session = running ?? await start(now: at);
    final next = session.addKick(at);
    await _write([
      for (final item in state)
        if (item.id == next.id) next else item,
    ]);
    return next;
  }

  Future<void> stop({DateTime? now}) async {
    final session = running;
    if (session == null) return;
    await _write([
      for (final item in state)
        if (item.id == session.id) item.stop(now ?? DateTime.now()) else item,
    ]);
  }

  Future<void> remove(String id) => _write([
    for (final item in state)
      if (item.id != id) item,
  ]);

  Future<void> _write(List<KickSession> sessions) async {
    state = sessions;
    await ref.read(pregnancyRepositoryProvider).saveKickSessions(sessions);
  }
}

/// The contraction timer (spec 5.4).
@Riverpod(keepAlive: true)
class ContractionController extends _$ContractionController {
  @override
  List<Contraction> build() =>
      ref.watch(pregnancyRepositoryProvider).readContractions();

  Contraction? get running {
    for (final contraction in state) {
      if (contraction.isRunning) return contraction;
    }
    return null;
  }

  /// Newest first.
  List<Contraction> get history =>
      [...state]..sort((a, b) => b.startedAt.compareTo(a.startedAt));

  /// Starts timing, or stops the one that is running — the single button the
  /// screen needs when a contraction begins and ends.
  Future<void> toggle({DateTime? now}) async {
    final at = now ?? DateTime.now();
    final current = running;
    if (current != null) {
      await _write([
        for (final item in state)
          if (item.id == current.id) item.stop(at) else item,
      ]);
      return;
    }
    await _write([...state, Contraction(id: _uuid.v4(), startedAt: at)]);
  }

  Future<void> remove(String id) => _write([
    for (final item in state)
      if (item.id != id) item,
  ]);

  Future<void> clear() => _write(const []);

  Future<void> _write(List<Contraction> contractions) async {
    state = contractions;
    await ref.read(pregnancyRepositoryProvider).saveContractions(contractions);
  }
}

/// Stats over the last hour, including the 5-1-1 pattern.
@riverpod
ContractionStats contractionStats(Ref ref, DateTime now) => ref
    .watch(contractionAnalyserProvider)
    .analyse(ref.watch(contractionControllerProvider), now: now);

/// The weight log (spec 5.4).
@Riverpod(keepAlive: true)
class WeightLogController extends _$WeightLogController {
  @override
  List<WeightEntry> build() =>
      ref.watch(pregnancyRepositoryProvider).readWeights();

  WeightLog get log => WeightLog(state);

  Future<void> record(double kg, {DateTime? on}) async {
    final entry = WeightEntry(date: (on ?? DateTime.now()).dateOnly, kg: kg);
    await _write(log.upsert(entry));
  }

  Future<void> removeOn(DateTime day) => _write(log.removeOn(day));

  Future<void> _write(List<WeightEntry> entries) async {
    state = entries;
    await ref.read(pregnancyRepositoryProvider).saveWeights(entries);
  }
}

/// Symptoms over the last 30 days, for the menopause and postpartum views.
@riverpod
SymptomSummary symptomSummary(Ref ref, {SymptomGroup? group}) =>
    SymptomSummary.of(
      ref.watch(cycleTimelineProvider).logs.values,
      to: today(),
      group: group,
    );
