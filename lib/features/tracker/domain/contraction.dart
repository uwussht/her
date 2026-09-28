import 'package:freezed_annotation/freezed_annotation.dart';

part 'contraction.freezed.dart';
part 'contraction.g.dart';

/// One contraction (spec 5.4).
@freezed
abstract class Contraction with _$Contraction {
  const factory Contraction({
    required String id,
    required DateTime startedAt,
    DateTime? endedAt,
  }) = _Contraction;

  const Contraction._();

  factory Contraction.fromJson(Map<String, dynamic> json) =>
      _$ContractionFromJson(json);

  bool get isRunning => endedAt == null;

  Duration duration(DateTime now) => (endedAt ?? now).difference(startedAt);

  Contraction stop(DateTime at) => isRunning ? copyWith(endedAt: at) : this;
}

/// What the timer shows, and whether the pattern is the one hospitals ask
/// about.
@immutable
class ContractionStats {
  const ContractionStats({
    required this.count,
    this.averageDuration,
    this.averageInterval,
    this.lastInterval,
    this.matchesFiveOneOne = false,
  });

  /// Contractions in the window looked at.
  final int count;

  /// Mean length of a finished contraction.
  final Duration? averageDuration;

  /// Mean time from the start of one contraction to the start of the next.
  final Duration? averageInterval;
  final Duration? lastInterval;

  /// The 5-1-1 pattern: five minutes apart, a minute long, for an hour.
  ///
  /// A widely used guideline for when to go in, not a diagnosis; the UI
  /// phrases it as "time to call", and the disclaimer stays on screen.
  final bool matchesFiveOneOne;
}

/// Reads a list of contractions. Pure, so the 5-1-1 rule is tested rather
/// than eyeballed.
class ContractionAnalyser {
  const ContractionAnalyser();

  static const Duration fiveOneOneInterval = Duration(minutes: 5);
  static const Duration fiveOneOneDuration = Duration(minutes: 1);
  static const Duration fiveOneOneWindow = Duration(hours: 1);

  /// Stats over the contractions that started within [window] of [now].
  ContractionStats analyse(
    List<Contraction> contractions, {
    required DateTime now,
    Duration window = fiveOneOneWindow,
  }) {
    final recent = [
      for (final contraction in contractions)
        if (now.difference(contraction.startedAt) <= window) contraction,
    ]..sort((a, b) => a.startedAt.compareTo(b.startedAt));
    if (recent.isEmpty) return const ContractionStats(count: 0);

    final finished = [
      for (final contraction in recent)
        if (!contraction.isRunning) contraction,
    ];
    final durations = [
      for (final contraction in finished) contraction.duration(now),
    ];
    final intervals = <Duration>[
      for (var i = 1; i < recent.length; i++)
        recent[i].startedAt.difference(recent[i - 1].startedAt),
    ];

    final averageDuration = durations.isEmpty ? null : _mean(durations);
    final averageInterval = intervals.isEmpty ? null : _mean(intervals);

    return ContractionStats(
      count: recent.length,
      averageDuration: averageDuration,
      averageInterval: averageInterval,
      lastInterval: intervals.isEmpty ? null : intervals.last,
      matchesFiveOneOne: _matchesFiveOneOne(
        recent: recent,
        intervals: intervals,
        averageDuration: averageDuration,
        now: now,
      ),
    );
  }

  bool _matchesFiveOneOne({
    required List<Contraction> recent,
    required List<Duration> intervals,
    required Duration? averageDuration,
    required DateTime now,
  }) {
    if (averageDuration == null || intervals.isEmpty) return false;
    if (averageDuration < fiveOneOneDuration) return false;
    // Regular enough: every gap in the hour is five minutes or less.
    if (intervals.any((interval) => interval > fiveOneOneInterval)) {
      return false;
    }
    // And the pattern covers the hour. The first contraction of the hour can
    // only ever be just inside the window, so allow for one missing gap
    // rather than demanding a full sixty minutes.
    final spanned = now.difference(recent.first.startedAt);
    return spanned >= fiveOneOneWindow - fiveOneOneInterval;
  }

  static Duration _mean(List<Duration> values) => Duration(
    milliseconds:
        values.fold(0, (sum, value) => sum + value.inMilliseconds) ~/
        values.length,
  );
}
