import '../../../core/utils/date_utils.dart';
import 'cycle.dart';
import 'cycle_prediction.dart';

/// Turns logged cycles into period, ovulation and fertile-window forecasts.
///
/// Deliberately a standalone, dependency-free service: the algorithm here is
/// simple on purpose and can be replaced (or moved behind an API) without
/// touching the UI or the storage layer.
class PredictionService {
  const PredictionService();

  /// Fallback when she has never told us her cycle length.
  static const int defaultCycleLength = 28;
  static const int defaultPeriodLength = 5;

  /// Days from ovulation to the next period. Held roughly constant across
  /// cycle lengths, which is why the fertile window moves with cycle length.
  static const int lutealPhaseLength = 14;

  /// Fertile window: sperm survive a few days, the egg about one.
  static const int fertileDaysBeforeOvulation = 5;
  static const int fertileDaysAfterOvulation = 1;

  /// Cycle lengths outside this range are treated as a missed log or a typo
  /// and left out of the averages.
  static const int minPlausibleCycleLength = 15;
  static const int maxPlausibleCycleLength = 60;

  /// Averages use at most this many recent cycles, so old cycles stop
  /// dragging the forecast.
  static const int maxCyclesUsed = 6;

  /// Enough cycles to talk about regularity at all.
  static const int minCyclesForConfidence = 3;

  /// Builds a forecast from [cycles], newest start winning.
  ///
  /// [fallbackCycleLength] is her answer from the quiz, used until there are
  /// two cycles to measure a gap between. Returns null when there is no
  /// period date at all to anchor to.
  CyclePrediction? predict({
    required List<Cycle> cycles,
    int? fallbackCycleLength,
    int? fallbackPeriodLength,
  }) {
    final sorted = sortCycles(cycles);
    if (sorted.isEmpty) return null;

    final lengths = _recentCycleLengths(sorted);
    final averageCycleLength = lengths.isEmpty
        ? (fallbackCycleLength ?? defaultCycleLength)
        : _mean(lengths);
    final variation = lengths.isEmpty
        ? 0
        : lengths.reduce((a, b) => a > b ? a : b) -
              lengths.reduce((a, b) => a < b ? a : b);

    final periodLengths = sorted
        .map((cycle) => cycle.periodLength)
        .whereType<int>()
        .toList();
    final averagePeriodLength = periodLengths.isEmpty
        ? (fallbackPeriodLength ?? defaultPeriodLength)
        : _mean(
            periodLengths.sublist(
              periodLengths.length > maxCyclesUsed
                  ? periodLengths.length - maxCyclesUsed
                  : 0,
            ),
          );

    final currentStart = sorted.last.startDate;
    final nextStart = currentStart.addDays(averageCycleLength);
    final ovulation = nextStart.addDays(-lutealPhaseLength);

    return CyclePrediction(
      currentCycleStart: currentStart,
      averageCycleLength: averageCycleLength,
      averagePeriodLength: averagePeriodLength,
      nextPeriodStart: nextStart,
      nextPeriod: DateRange(
        start: nextStart,
        end: nextStart.addDays(averagePeriodLength - 1),
      ),
      ovulationDate: ovulation,
      fertileWindow: DateRange(
        start: ovulation.addDays(-fertileDaysBeforeOvulation),
        end: ovulation.addDays(fertileDaysAfterOvulation),
      ),
      confidence: _confidence(lengths.length, variation),
      basedOnCycles: lengths.length,
      variationInDays: variation,
    );
  }

  /// [prediction] rolled forward, so the calendar can show later months.
  /// The first entry is [CyclePrediction.nextPeriod].
  List<DateRange> projectFuturePeriods(
    CyclePrediction prediction, {
    required int count,
  }) {
    return [
      for (var i = 0; i < count; i++)
        DateRange(
          start: prediction.nextPeriodStart.addDays(
            i * prediction.averageCycleLength,
          ),
          end: prediction.nextPeriod.end.addDays(
            i * prediction.averageCycleLength,
          ),
        ),
    ];
  }

  /// Fertile windows for the projected cycles, aligned with
  /// [projectFuturePeriods].
  List<DateRange> projectFutureFertileWindows(
    CyclePrediction prediction, {
    required int count,
  }) {
    return [
      for (var i = 0; i < count; i++)
        DateRange(
          start: prediction.fertileWindow.start.addDays(
            i * prediction.averageCycleLength,
          ),
          end: prediction.fertileWindow.end.addDays(
            i * prediction.averageCycleLength,
          ),
        ),
    ];
  }

  /// Ovulation dates for the projected cycles.
  List<DateTime> projectFutureOvulations(
    CyclePrediction prediction, {
    required int count,
  }) {
    return [
      for (var i = 0; i < count; i++)
        prediction.ovulationDate.addDays(i * prediction.averageCycleLength),
    ];
  }

  /// Oldest start first, with duplicate start dates collapsed.
  static List<Cycle> sortCycles(List<Cycle> cycles) {
    final byDay = <DateTime, Cycle>{};
    for (final cycle in cycles) {
      final key = cycle.startDate.dateOnly;
      final existing = byDay[key];
      // Keep whichever entry knows where the period ended.
      if (existing == null || existing.periodEndDate == null) {
        byDay[key] = cycle;
      }
    }
    final sorted = byDay.values.toList()
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
    return sorted;
  }

  /// Gaps between consecutive period starts, most recent last, keeping only
  /// plausible values and at most [maxCyclesUsed].
  List<int> _recentCycleLengths(List<Cycle> sorted) {
    final lengths = <int>[];
    for (var i = 1; i < sorted.length; i++) {
      final length = sorted[i - 1].startDate.daysUntil(sorted[i].startDate);
      if (length >= minPlausibleCycleLength &&
          length <= maxPlausibleCycleLength) {
        lengths.add(length);
      }
    }
    return lengths.length > maxCyclesUsed
        ? lengths.sublist(lengths.length - maxCyclesUsed)
        : lengths;
  }

  static PredictionConfidence _confidence(int cycleCount, int variation) {
    if (cycleCount == 0) return PredictionConfidence.estimated;
    if (cycleCount < minCyclesForConfidence) return PredictionConfidence.low;
    if (variation <= 4) return PredictionConfidence.high;
    if (variation <= 8) return PredictionConfidence.medium;
    return PredictionConfidence.low;
  }

  static int _mean(List<int> values) =>
      (values.reduce((a, b) => a + b) / values.length).round();
}
