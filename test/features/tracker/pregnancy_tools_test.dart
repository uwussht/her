import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/features/tracker/domain/contraction.dart';
import 'package:her_circle/features/tracker/domain/daily_log.dart';
import 'package:her_circle/features/tracker/domain/kick_session.dart';
import 'package:her_circle/features/tracker/domain/symptom_summary.dart';
import 'package:her_circle/features/tracker/domain/tracker_enums.dart';
import 'package:her_circle/features/tracker/domain/weight_entry.dart';

void main() {
  final start = DateTime(2026, 9, 28, 9);

  group('KickSession', () {
    test('counts to ten and closes itself', () {
      var session = KickSession(id: 's1', startedAt: start);
      expect(session.isRunning, isTrue);
      expect(session.remaining, KickSession.targetKicks);

      for (var i = 1; i <= KickSession.targetKicks; i++) {
        session = session.addKick(start.add(Duration(minutes: i)));
      }

      expect(session.count, KickSession.targetKicks);
      expect(session.isComplete, isTrue);
      expect(session.remaining, 0);
      expect(session.isRunning, isFalse, reason: 'the target closes it');
      expect(session.elapsed(start), const Duration(minutes: 10));
    });

    test('ignores a double tap within a second', () {
      var session = KickSession(id: 's1', startedAt: start);
      session = session.addKick(start.add(const Duration(seconds: 5)));
      session = session.addKick(
        start.add(const Duration(seconds: 5, milliseconds: 400)),
      );
      expect(session.count, 1);

      session = session.addKick(start.add(const Duration(seconds: 7)));
      expect(session.count, 2);
    });

    test('a slow count is flagged after two hours, not before', () {
      final session = KickSession(
        id: 's1',
        startedAt: start,
      ).addKick(start.add(const Duration(minutes: 1)));

      expect(
        session.needsAttention(start.add(const Duration(hours: 1))),
        isFalse,
      );
      expect(
        session.needsAttention(start.add(const Duration(hours: 2))),
        isTrue,
      );
    });

    test('a completed count is never flagged', () {
      var session = KickSession(id: 's1', startedAt: start);
      for (var i = 1; i <= KickSession.targetKicks; i++) {
        session = session.addKick(start.add(Duration(minutes: i * 20)));
      }
      expect(session.isComplete, isTrue);
      expect(
        session.needsAttention(start.add(const Duration(hours: 5))),
        isFalse,
      );
    });

    test('a stopped session takes no more kicks', () {
      final stopped = KickSession(
        id: 's1',
        startedAt: start,
      ).stop(start.add(const Duration(minutes: 5)));
      expect(stopped.addKick(start.add(const Duration(minutes: 6))).count, 0);
    });
  });

  group('ContractionAnalyser', () {
    const analyser = ContractionAnalyser();

    List<Contraction> pattern({
      required Duration every,
      required Duration lasting,
      required int count,
      DateTime? from,
    }) {
      final base = from ?? start;
      return [
        for (var i = 0; i < count; i++)
          Contraction(
            id: 'c$i',
            startedAt: base.add(every * i),
            endedAt: base.add(every * i).add(lasting),
          ),
      ];
    }

    test('nothing to report on an empty list', () {
      final stats = analyser.analyse(const [], now: start);
      expect(stats.count, 0);
      expect(stats.averageDuration, isNull);
      expect(stats.matchesFiveOneOne, isFalse);
    });

    test('averages the durations and the gaps', () {
      final stats = analyser.analyse(
        pattern(
          every: const Duration(minutes: 10),
          lasting: const Duration(seconds: 40),
          count: 4,
        ),
        now: start.add(const Duration(minutes: 31)),
      );

      expect(stats.count, 4);
      expect(stats.averageDuration, const Duration(seconds: 40));
      expect(stats.averageInterval, const Duration(minutes: 10));
      expect(stats.lastInterval, const Duration(minutes: 10));
    });

    test('only counts what happened in the last hour', () {
      final old = pattern(
        every: const Duration(minutes: 5),
        lasting: const Duration(minutes: 1),
        count: 3,
        from: start.subtract(const Duration(hours: 3)),
      );
      final stats = analyser.analyse(old, now: start);
      expect(stats.count, 0);
    });

    test('recognises the 5-1-1 pattern', () {
      // Five minutes apart, a minute long, for a full hour.
      final contractions = pattern(
        every: const Duration(minutes: 5),
        lasting: const Duration(minutes: 1),
        count: 13,
      );
      final stats = analyser.analyse(
        contractions,
        now: start.add(const Duration(hours: 1)),
      );
      expect(stats.matchesFiveOneOne, isTrue);
    });

    test('does not cry wolf on contractions that are too short', () {
      final stats = analyser.analyse(
        pattern(
          every: const Duration(minutes: 5),
          lasting: const Duration(seconds: 30),
          count: 13,
        ),
        now: start.add(const Duration(hours: 1)),
      );
      expect(stats.matchesFiveOneOne, isFalse);
    });

    test('does not cry wolf on an irregular hour', () {
      final contractions = [
        ...pattern(
          every: const Duration(minutes: 5),
          lasting: const Duration(minutes: 1),
          count: 6,
        ),
        // Then a twenty-minute gap: not the pattern hospitals ask about.
        Contraction(
          id: 'late',
          startedAt: start.add(const Duration(minutes: 50)),
          endedAt: start.add(const Duration(minutes: 51)),
        ),
      ];
      final stats = analyser.analyse(
        contractions,
        now: start.add(const Duration(hours: 1)),
      );
      expect(stats.matchesFiveOneOne, isFalse);
    });

    test('does not cry wolf before the pattern has lasted an hour', () {
      final contractions = pattern(
        every: const Duration(minutes: 5),
        lasting: const Duration(minutes: 1),
        count: 5,
      );
      expect(
        analyser
            .analyse(contractions, now: start.add(const Duration(minutes: 25)))
            .matchesFiveOneOne,
        isFalse,
      );
      // Half an hour in is still not the hour hospitals ask about.
      expect(
        analyser
            .analyse(contractions, now: start.add(const Duration(minutes: 40)))
            .matchesFiveOneOne,
        isFalse,
      );
    });

    test('a running contraction counts but has no duration yet', () {
      final stats = analyser.analyse([
        Contraction(id: 'c1', startedAt: start),
      ], now: start.add(const Duration(seconds: 30)));
      expect(stats.count, 1);
      expect(stats.averageDuration, isNull);
    });
  });

  group('WeightLog', () {
    final day = DateTime(2026, 9, 1);

    test('keeps one entry per day, latest wins', () {
      final log = WeightLog([
        WeightEntry(date: day, kg: 60),
        WeightEntry(date: day.add(const Duration(hours: 20)), kg: 60.5),
      ]);
      expect(log.entries, hasLength(1));
      expect(log.latest!.kg, 60.5);
    });

    test('reports the gain and the last change', () {
      final log = WeightLog([
        WeightEntry(date: day, kg: 60),
        WeightEntry(date: day.add(const Duration(days: 7)), kg: 60.8),
        WeightEntry(date: day.add(const Duration(days: 14)), kg: 61.5),
      ]);
      expect(log.totalGainKg, closeTo(1.5, 0.001));
      expect(log.lastChangeKg, closeTo(0.7, 0.001));
    });

    test('a single weighing has no gain to report', () {
      final log = WeightLog([WeightEntry(date: day, kg: 60)]);
      expect(log.totalGainKg, isNull);
      expect(log.lastChangeKg, isNull);
      expect(log.isEmpty, isFalse);
    });

    test('maps entries onto pregnancy weeks and drops earlier ones', () {
      final lastPeriod = DateTime(2026, 3, 1);
      final log = WeightLog([
        WeightEntry(date: DateTime(2026, 2, 1), kg: 59),
        WeightEntry(date: lastPeriod, kg: 60),
        WeightEntry(date: lastPeriod.add(const Duration(days: 70)), kg: 62),
      ]);
      expect(log.byPregnancyWeek(lastPeriod), [(1, 60.0), (11, 62.0)]);
    });

    test('upsert replaces the day and remove drops it', () {
      final log = WeightLog([WeightEntry(date: day, kg: 60)]);
      final updated = log.upsert(WeightEntry(date: day, kg: 61));
      expect(updated, hasLength(1));
      expect(updated.single.kg, 61);
      expect(WeightLog(updated).removeOn(day), isEmpty);
    });
  });

  group('SymptomSummary', () {
    final today = DateTime(2026, 9, 28);

    DailyLog log(
      int daysAgo, {
      List<Symptom> symptoms = const [],
      Mood? mood,
      double? sleep,
    }) => DailyLog(
      date: today.subtract(Duration(days: daysAgo)),
      symptoms: symptoms,
      mood: mood,
      sleepHours: sleep,
    );

    test('counts the days each symptom was logged, most frequent first', () {
      final summary = SymptomSummary.of([
        log(0, symptoms: const [Symptom.hotFlashes, Symptom.insomnia]),
        log(1, symptoms: const [Symptom.hotFlashes]),
        log(2, symptoms: const [Symptom.hotFlashes, Symptom.nightSweats]),
      ], to: today);

      expect(summary.daysLogged, 3);
      expect(summary.top!.symptom, Symptom.hotFlashes);
      expect(summary.top!.days, 3);
      expect(summary.counts.map((count) => count.symptom), [
        Symptom.hotFlashes,
        Symptom.insomnia,
        Symptom.nightSweats,
      ]);
    });

    test('ignores anything outside the window', () {
      final summary = SymptomSummary.of([
        log(0, symptoms: const [Symptom.hotFlashes]),
        log(40, symptoms: const [Symptom.hotFlashes]),
      ], to: today);
      expect(summary.top!.days, 1);
      expect(summary.daysLogged, 1);
    });

    test('narrows to one section of the log sheet', () {
      final summary = SymptomSummary.of(
        [
          log(0, symptoms: const [Symptom.hotFlashes, Symptom.cramps]),
        ],
        to: today,
        group: SymptomGroup.menopause,
      );
      expect(summary.counts.map((count) => count.symptom), [
        Symptom.hotFlashes,
      ]);
      // The day still counts as logged; only the symptom list is narrowed.
      expect(summary.daysLogged, 1);
    });

    test('averages sleep and mood over the days she logged them', () {
      final summary = SymptomSummary.of([
        log(0, mood: Mood.good, sleep: 7),
        log(1, mood: Mood.awful, sleep: 5),
        log(2, symptoms: const [Symptom.cramps]),
      ], to: today);

      expect(summary.averageSleepHours, 6);
      expect(
        summary.averageMoodScore,
        (Mood.good.score + Mood.awful.score) / 2,
      );
    });

    test('empty when nothing was logged', () {
      final summary = SymptomSummary.of(const [], to: today);
      expect(summary.isEmpty, isTrue);
      expect(summary.top, isNull);
      expect(summary.averageMoodScore, isNull);
    });
  });
}
