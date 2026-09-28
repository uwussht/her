import 'package:freezed_annotation/freezed_annotation.dart';

part 'kick_session.freezed.dart';
part 'kick_session.g.dart';

/// One "count to ten" session (spec 5.4).
///
/// Obstetric practice is to count ten movements within two hours. The rule
/// lives here, not in the widget, so it is unit-tested and easy to correct if
/// her doctor's protocol differs.
@freezed
abstract class KickSession with _$KickSession {
  const factory KickSession({
    required String id,
    required DateTime startedAt,

    /// When each movement was tapped, oldest first.
    @Default(<DateTime>[]) List<DateTime> kicks,

    /// Set when she stopped counting, or when the target was reached.
    DateTime? endedAt,
  }) = _KickSession;

  const KickSession._();

  factory KickSession.fromJson(Map<String, dynamic> json) =>
      _$KickSessionFromJson(json);

  /// Movements to count.
  static const int targetKicks = 10;

  /// How long the count may take before it is worth mentioning to a doctor.
  static const Duration window = Duration(hours: 2);

  int get count => kicks.length;

  bool get isComplete => count >= targetKicks;

  bool get isRunning => endedAt == null;

  /// End of the session, or [now] while it is still going.
  DateTime finishedAt(DateTime now) => endedAt ?? now;

  Duration elapsed(DateTime now) => finishedAt(now).difference(startedAt);

  /// Movements left to reach the target.
  int get remaining => isComplete ? 0 : targetKicks - count;

  /// True when two hours have passed without ten movements. Not a diagnosis:
  /// the UI says to call her doctor, nothing more.
  bool needsAttention(DateTime now) => !isComplete && elapsed(now) >= window;

  /// Adds a movement, ignoring double taps within a second, and closes the
  /// session once the target is reached.
  KickSession addKick(DateTime at) {
    if (!isRunning || isComplete) return this;
    final last = kicks.isEmpty ? null : kicks.last;
    if (last != null && at.difference(last) < const Duration(seconds: 1)) {
      return this;
    }
    final next = [...kicks, at];
    return copyWith(
      kicks: next,
      endedAt: next.length >= targetKicks ? at : null,
    );
  }

  KickSession stop(DateTime at) => isRunning ? copyWith(endedAt: at) : this;
}
