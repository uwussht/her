import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/date_utils.dart';

part 'cycle_prediction.freezed.dart';

/// How much to trust a prediction. Shown next to it so she is never given
/// false certainty.
enum PredictionConfidence {
  /// Based on the cycle length she typed, with no logged cycles yet.
  estimated,

  /// One or two cycles, or very irregular ones.
  low,
  medium,
  high,
}

/// A closed date range, both ends included.
@freezed
abstract class DateRange with _$DateRange {
  const factory DateRange({required DateTime start, required DateTime end}) =
      _DateRange;

  const DateRange._();

  bool contains(DateTime day) {
    final date = day.dateOnly;
    return !date.isBefore(start) && !date.isAfter(end);
  }

  int get lengthInDays => start.daysUntil(end) + 1;
}

/// Forecast for the current cycle.
@freezed
abstract class CyclePrediction with _$CyclePrediction {
  const factory CyclePrediction({
    /// Start of the cycle this forecast is anchored to.
    required DateTime currentCycleStart,
    required int averageCycleLength,
    required int averagePeriodLength,
    required DateTime nextPeriodStart,
    required DateRange nextPeriod,
    required DateTime ovulationDate,
    required DateRange fertileWindow,
    required PredictionConfidence confidence,

    /// How many past cycles the averages came from.
    required int basedOnCycles,

    /// Spread between the shortest and longest cycle used, in days.
    required int variationInDays,
  }) = _CyclePrediction;

  const CyclePrediction._();

  /// 1-based day of the cycle for [day], or null before the cycle started.
  int? cycleDayFor(DateTime day) {
    final diff = currentCycleStart.daysUntil(day);
    return diff < 0 ? null : diff + 1;
  }

  /// Days until the next period starts. Negative once it is late.
  int daysUntilNextPeriod(DateTime from) => from.daysUntil(nextPeriodStart);
}
