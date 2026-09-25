import '../../../core/utils/date_utils.dart';
import 'cycle.dart';
import 'cycle_prediction.dart';
import 'daily_log.dart';
import 'prediction_service.dart';
import 'tracker_enums.dart';

/// Read model the tracker UI works from: logged cycles, the forecast, and
/// the phase of any given day.
class CycleTimeline {
  CycleTimeline({
    required List<Cycle> cycles,
    required this.logs,
    required this.prediction,
    this.projectedCycles = 6,
    this.service = const PredictionService(),
  }) : cycles = PredictionService.sortCycles(cycles);

  /// Oldest first.
  final List<Cycle> cycles;

  /// Keyed by calendar day.
  final Map<DateTime, DailyLog> logs;
  final CyclePrediction? prediction;

  /// How many cycles ahead the calendar shows predictions for.
  final int projectedCycles;

  final PredictionService service;

  List<DateRange>? _futurePeriods;
  List<DateRange>? _futureFertile;
  List<DateTime>? _futureOvulations;

  Cycle? get currentCycle => cycles.isEmpty ? null : cycles.last;

  bool get hasData => cycles.isNotEmpty;

  DailyLog? logFor(DateTime day) => logs[day.dateOnly];

  /// 1-based day within the current cycle, or null when unknown or before it.
  int? cycleDayFor(DateTime day) {
    final start = currentCycle?.startDate;
    if (start == null) return null;
    final diff = start.daysUntil(day);
    return diff < 0 ? null : diff + 1;
  }

  /// Days since the period started, for the status card.
  int? get currentCycleDay => cycleDayFor(today());

  /// How late the period is, or null when it is not overdue.
  int? get daysLate {
    final next = prediction?.nextPeriodStart;
    if (next == null) return null;
    final late = next.daysUntil(today());
    return late > 0 && !isBleedingOn(today()) ? late : null;
  }

  bool isBleedingOn(DateTime day) =>
      cycles.any((cycle) => cycle.coversPeriodDay(day));

  CyclePhase phaseFor(DateTime day) {
    final date = day.dateOnly;
    if (isBleedingOn(date)) return CyclePhase.period;

    final prediction = this.prediction;
    if (prediction == null) return CyclePhase.unknown;

    if (_periods.any((range) => range.contains(date))) {
      return CyclePhase.predictedPeriod;
    }
    if (_ovulations.any((ovulation) => ovulation.isSameDay(date))) {
      return CyclePhase.ovulation;
    }
    if (_fertileWindows.any((range) => range.contains(date))) {
      return CyclePhase.fertile;
    }

    // Inside a known or projected cycle, the phase is decided by that
    // cycle's own ovulation day: before it is follicular, after it luteal.
    final ovulation = _ovulationForCycleContaining(date);
    if (ovulation == null) return CyclePhase.unknown;
    return date.isBefore(ovulation) ? CyclePhase.follicular : CyclePhase.luteal;
  }

  /// Ovulation of the cycle [date] falls in, or null when [date] is outside
  /// the projected range.
  DateTime? _ovulationForCycleContaining(DateTime date) {
    final prediction = this.prediction!;
    final offset = prediction.currentCycleStart.daysUntil(date);
    if (offset < 0) return null;
    final index = offset ~/ prediction.averageCycleLength;
    final ovulations = _ovulations;
    return index < ovulations.length ? ovulations[index] : null;
  }

  List<DateRange> get _periods => _futurePeriods ??= service
      .projectFuturePeriods(prediction!, count: projectedCycles);

  List<DateRange> get _fertileWindows => _futureFertile ??= service
      .projectFutureFertileWindows(prediction!, count: projectedCycles);

  List<DateTime> get _ovulations => _futureOvulations ??= service
      .projectFutureOvulations(prediction!, count: projectedCycles);

  /// Mood scores by day over the last [days] days, oldest first. Days with
  /// no mood logged are left out.
  List<(DateTime, int)> moodSeries({required int days, DateTime? from}) {
    final end = (from ?? today()).dateOnly;
    final start = end.addDays(-(days - 1));
    final series = <(DateTime, int)>[];
    for (var date = start; !date.isAfter(end); date = date.addDays(1)) {
      final mood = logs[date]?.mood;
      if (mood != null) series.add((date, mood.score));
    }
    return series;
  }
}
