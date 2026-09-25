import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/utils/date_utils.dart';
import 'package:her_circle/features/tracker/domain/cycle.dart';
import 'package:her_circle/features/tracker/domain/cycle_prediction.dart';
import 'package:her_circle/features/tracker/domain/prediction_service.dart';

/// Builds cycles from period start dates, oldest first.
List<Cycle> cyclesFrom(List<DateTime> starts, {int? periodLength}) {
  return [
    for (final start in starts)
      Cycle(
        id: 'c${start.millisecondsSinceEpoch}',
        startDate: start,
        periodEndDate: periodLength == null
            ? null
            : start.addDays(periodLength - 1),
      ),
  ];
}

void main() {
  const service = PredictionService();

  test('no cycles means no prediction', () {
    expect(service.predict(cycles: const []), isNull);
  });

  test('a single cycle falls back to the length she entered', () {
    final start = DateTime(2026, 9, 1);
    final prediction = service.predict(
      cycles: cyclesFrom([start]),
      fallbackCycleLength: 30,
    )!;

    expect(prediction.averageCycleLength, 30);
    expect(prediction.nextPeriodStart, DateTime(2026, 10, 1));
    expect(prediction.confidence, PredictionConfidence.estimated);
    expect(prediction.basedOnCycles, 0);
  });

  test('without any cycle length it uses 28 days', () {
    final prediction = service.predict(
      cycles: cyclesFrom([DateTime(2026, 9)]),
    )!;
    expect(prediction.averageCycleLength, PredictionService.defaultCycleLength);
  });

  test('averages the gaps between period starts', () {
    // Gaps of 28, 30 and 26 days average to 28.
    final prediction = service.predict(
      cycles: cyclesFrom([
        DateTime(2026, 5, 1),
        DateTime(2026, 5, 29),
        DateTime(2026, 6, 28),
        DateTime(2026, 7, 24),
      ]),
    )!;

    expect(prediction.averageCycleLength, 28);
    expect(prediction.basedOnCycles, 3);
    expect(prediction.variationInDays, 4);
    expect(prediction.currentCycleStart, DateTime(2026, 7, 24));
    expect(prediction.nextPeriodStart, DateTime(2026, 8, 21));
  });

  test('ovulation sits a luteal phase before the next period', () {
    final prediction = service.predict(
      cycles: cyclesFrom([DateTime(2026, 9, 1)]),
      fallbackCycleLength: 28,
    )!;

    expect(prediction.ovulationDate, DateTime(2026, 9, 15));
    // Five days before ovulation through the day after it.
    expect(prediction.fertileWindow.start, DateTime(2026, 9, 10));
    expect(prediction.fertileWindow.end, DateTime(2026, 9, 16));
    expect(prediction.fertileWindow.lengthInDays, 7);
  });

  test('the fertile window moves with cycle length', () {
    final short = service.predict(
      cycles: cyclesFrom([DateTime(2026, 9, 1)]),
      fallbackCycleLength: 21,
    )!;
    final long = service.predict(
      cycles: cyclesFrom([DateTime(2026, 9, 1)]),
      fallbackCycleLength: 35,
    )!;

    expect(short.ovulationDate, DateTime(2026, 9, 8));
    expect(long.ovulationDate, DateTime(2026, 9, 22));
  });

  test('period length is averaged from logged periods', () {
    final prediction = service.predict(
      cycles: [
        ...cyclesFrom([DateTime(2026, 7, 1)], periodLength: 4),
        ...cyclesFrom([DateTime(2026, 7, 29)], periodLength: 6),
      ],
    )!;

    expect(prediction.averagePeriodLength, 5);
    expect(prediction.nextPeriod.lengthInDays, 5);
  });

  group('confidence', () {
    CyclePrediction predictGaps(List<int> gaps) {
      var date = DateTime(2026, 1, 1);
      final starts = [date];
      for (final gap in gaps) {
        date = date.addDays(gap);
        starts.add(date);
      }
      return service.predict(cycles: cyclesFrom(starts))!;
    }

    test('one or two cycles stay low', () {
      expect(predictGaps([28]).confidence, PredictionConfidence.low);
      expect(predictGaps([28, 28]).confidence, PredictionConfidence.low);
    });

    test('three regular cycles are high', () {
      expect(predictGaps([28, 29, 28]).confidence, PredictionConfidence.high);
    });

    test('moderate variation is medium', () {
      expect(predictGaps([26, 31, 28]).confidence, PredictionConfidence.medium);
    });

    test('very irregular cycles drop back to low', () {
      final prediction = predictGaps([24, 38, 29]);
      expect(prediction.confidence, PredictionConfidence.low);
      expect(prediction.variationInDays, 14);
    });
  });

  test('implausible gaps are ignored as missed logs', () {
    // A 90-day gap means she stopped logging, not a 90-day cycle.
    final prediction = service.predict(
      cycles: cyclesFrom([
        DateTime(2026, 1, 1),
        DateTime(2026, 1, 29),
        DateTime(2026, 4, 29),
        DateTime(2026, 5, 27),
      ]),
    )!;

    expect(prediction.averageCycleLength, 28);
    expect(prediction.basedOnCycles, 2);
  });

  test('only the last six cycles count', () {
    var date = DateTime(2025, 1, 1);
    final starts = [date];
    // Four old 35-day cycles, then six recent 28-day ones.
    for (final gap in [35, 35, 35, 35, 28, 28, 28, 28, 28, 28]) {
      date = date.addDays(gap);
      starts.add(date);
    }
    final prediction = service.predict(cycles: cyclesFrom(starts))!;

    expect(prediction.basedOnCycles, PredictionService.maxCyclesUsed);
    expect(prediction.averageCycleLength, 28);
    expect(prediction.variationInDays, 0);
  });

  test('cycles are sorted and duplicate start days collapsed', () {
    final sorted = PredictionService.sortCycles([
      Cycle(id: 'b', startDate: DateTime(2026, 3, 1)),
      Cycle(id: 'a', startDate: DateTime(2026, 2, 1)),
      Cycle(
        id: 'a-dup',
        startDate: DateTime(2026, 2, 1),
        periodEndDate: DateTime(2026, 2, 5),
      ),
    ]);

    expect(sorted.map((cycle) => cycle.startDate), [
      DateTime(2026, 2, 1),
      DateTime(2026, 3, 1),
    ]);
    // The entry that knows the period end survives.
    expect(sorted.first.periodLength, 5);
  });

  test('future cycles are projected for the calendar', () {
    final prediction = service.predict(
      cycles: cyclesFrom([DateTime(2026, 9, 1)], periodLength: 5),
      fallbackCycleLength: 28,
    )!;

    final periods = service.projectFuturePeriods(prediction, count: 3);
    expect(periods.map((period) => period.start), [
      DateTime(2026, 9, 29),
      DateTime(2026, 10, 27),
      DateTime(2026, 11, 24),
    ]);
    expect(service.projectFutureOvulations(prediction, count: 2), [
      DateTime(2026, 9, 15),
      DateTime(2026, 10, 13),
    ]);
  });

  test('day maths survives the daylight-saving boundary', () {
    // Europe/Kyiv-style DST change; the app must still count whole days.
    final start = DateTime(2026, 3, 27);
    expect(start.daysUntil(DateTime(2026, 4, 3)), 7);
    expect(start.addDays(7), DateTime(2026, 4, 3));
  });
}
