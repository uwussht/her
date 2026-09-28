import '../../../core/utils/date_utils.dart';
import 'daily_log.dart';
import 'tracker_enums.dart';

/// How often a symptom showed up, for the menopause and postpartum views.
class SymptomCount {
  const SymptomCount(this.symptom, this.days);

  final Symptom symptom;

  /// Days it was logged in the window.
  final int days;
}

/// Reads the daily logs for the non-cycle modes (spec 5.4: the menopause
/// symptom log). Pure, so the windows and averages are tested.
class SymptomSummary {
  const SymptomSummary({
    required this.counts,
    required this.daysLogged,
    required this.windowDays,
    this.averageSleepHours,
    this.averageMoodScore,
  });

  /// Most frequent first.
  final List<SymptomCount> counts;

  /// Days in the window with anything logged at all.
  final int daysLogged;
  final int windowDays;

  final double? averageSleepHours;

  /// Mean mood on the 1-5 scale, or null when she logged no moods.
  final double? averageMoodScore;

  bool get isEmpty => daysLogged == 0;

  /// The most frequent symptom, or null when nothing was logged.
  SymptomCount? get top => counts.isEmpty ? null : counts.first;

  static const int defaultWindowDays = 30;

  /// Summarises the logs in the [windowDays] days up to and including [to].
  ///
  /// [group] narrows it to one section of the log sheet, which is how the
  /// menopause view shows hot flashes and night sweats without the rest.
  static SymptomSummary of(
    Iterable<DailyLog> logs, {
    required DateTime to,
    int windowDays = defaultWindowDays,
    SymptomGroup? group,
  }) {
    final end = to.dateOnly;
    final start = end.addDays(-(windowDays - 1));
    final tally = <Symptom, int>{};
    final sleeps = <double>[];
    final moods = <int>[];
    var daysLogged = 0;

    for (final log in logs) {
      final day = log.date.dateOnly;
      if (day.isBefore(start) || day.isAfter(end)) continue;
      if (log.isEmpty) continue;
      daysLogged++;
      for (final symptom in log.symptoms) {
        if (group != null && symptom.group != group) continue;
        tally.update(symptom, (value) => value + 1, ifAbsent: () => 1);
      }
      final sleep = log.sleepHours;
      if (sleep != null) sleeps.add(sleep);
      final mood = log.mood;
      if (mood != null) moods.add(mood.score);
    }

    final counts =
        [
          for (final entry in tally.entries)
            SymptomCount(entry.key, entry.value),
        ]..sort((a, b) {
          final byDays = b.days.compareTo(a.days);
          // Stable order for equal counts, so the card does not shuffle.
          return byDays != 0
              ? byDays
              : a.symptom.index.compareTo(b.symptom.index);
        });

    return SymptomSummary(
      counts: counts,
      daysLogged: daysLogged,
      windowDays: windowDays,
      averageSleepHours: sleeps.isEmpty ? null : _mean(sleeps),
      averageMoodScore: moods.isEmpty
          ? null
          : _mean(moods.map((score) => score.toDouble()).toList()),
    );
  }

  static double _mean(List<double> values) =>
      values.reduce((a, b) => a + b) / values.length;
}
