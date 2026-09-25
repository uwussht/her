import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/utils/date_utils.dart';
import 'package:her_circle/features/tracker/domain/cycle.dart';
import 'package:her_circle/features/tracker/domain/cycle_timeline.dart';
import 'package:her_circle/features/tracker/domain/daily_log.dart';
import 'package:her_circle/features/tracker/domain/prediction_service.dart';
import 'package:her_circle/features/tracker/domain/tracker_enums.dart';

import 'prediction_service_test.dart' show cyclesFrom;

void main() {
  const service = PredictionService();

  CycleTimeline timelineFor(
    List<Cycle> cycles, {
    Map<DateTime, DailyLog> logs = const {},
    int? fallbackCycleLength = 28,
  }) {
    return CycleTimeline(
      cycles: cycles,
      logs: logs,
      prediction: service.predict(
        cycles: cycles,
        fallbackCycleLength: fallbackCycleLength,
      ),
    );
  }

  test('an empty timeline knows nothing', () {
    final timeline = timelineFor(const []);
    expect(timeline.hasData, isFalse);
    expect(timeline.currentCycleDay, isNull);
    expect(timeline.daysLate, isNull);
    expect(timeline.phaseFor(today()), CyclePhase.unknown);
  });

  test('counts the cycle day from the current period start', () {
    final timeline = timelineFor(cyclesFrom([today().addDays(-11)]));
    expect(timeline.currentCycleDay, 12);
    expect(timeline.cycleDayFor(today().addDays(-11)), 1);
    // Days before the cycle started have no cycle day.
    expect(timeline.cycleDayFor(today().addDays(-12)), isNull);
  });

  test('phases run period → fertile → ovulation → luteal', () {
    final start = today();
    final timeline = timelineFor(cyclesFrom([start], periodLength: 5));

    expect(timeline.phaseFor(start), CyclePhase.period);
    expect(timeline.phaseFor(start.addDays(4)), CyclePhase.period);
    expect(timeline.phaseFor(start.addDays(6)), CyclePhase.follicular);
    expect(timeline.phaseFor(start.addDays(9)), CyclePhase.fertile);
    expect(timeline.phaseFor(start.addDays(14)), CyclePhase.ovulation);
    expect(timeline.phaseFor(start.addDays(16)), CyclePhase.luteal);
    expect(timeline.phaseFor(start.addDays(28)), CyclePhase.predictedPeriod);
  });

  test('a logged period always wins over a prediction', () {
    final start = today().addDays(-30);
    // She logged a period two days ago, earlier than predicted.
    final timeline = timelineFor(
      cyclesFrom([start, today().addDays(-2)], periodLength: 4),
    );
    expect(timeline.phaseFor(today()), CyclePhase.period);
    expect(timeline.isBleedingOn(today()), isTrue);
    expect(timeline.daysLate, isNull);
  });

  test('reports how late an overdue period is', () {
    final timeline = timelineFor(cyclesFrom([today().addDays(-31)]));
    expect(timeline.daysLate, 3);
  });

  test('a single-day period covers only that day', () {
    final timeline = timelineFor(cyclesFrom([today()]));
    expect(timeline.isBleedingOn(today()), isTrue);
    expect(timeline.isBleedingOn(today().addDays(1)), isFalse);
  });

  test('mood series skips days with no mood and stays in order', () {
    final logs = {
      for (final offset in [-6, -4, -1])
        today().addDays(offset): DailyLog(
          date: today().addDays(offset),
          mood: offset == -4 ? Mood.awful : Mood.good,
        ),
      // A log without a mood must not appear in the chart.
      today().addDays(-3): DailyLog(
        date: today().addDays(-3),
        flow: FlowLevel.light,
      ),
    };
    final timeline = timelineFor(cyclesFrom([today().addDays(-6)]), logs: logs);

    final series = timeline.moodSeries(days: 7);
    expect(series.length, 3);
    expect(series.map((entry) => entry.$2), [4, 1, 4]);
    expect(series.first.$1, today().addDays(-6));
    // Days outside the window are excluded.
    expect(timeline.moodSeries(days: 2).length, 1);
  });

  test('logs are looked up by calendar day, ignoring the time', () {
    final date = DateTime(2026, 9, 10, 23, 45);
    final timeline = timelineFor(
      cyclesFrom([DateTime(2026, 9, 1)]),
      logs: {date.dateOnly: DailyLog(date: date, mood: Mood.okay)},
    );
    expect(timeline.logFor(DateTime(2026, 9, 10, 6)), isNotNull);
  });
}
