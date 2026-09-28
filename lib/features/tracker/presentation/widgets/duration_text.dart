/// Formats a duration for the timers: `4:12` or `1:04:12`.
///
/// Locale-independent on purpose — these are stopwatch readings, and every
/// language shows them the same way.
String formatStopwatch(Duration duration) {
  final seconds = duration.inSeconds.abs();
  final hours = seconds ~/ 3600;
  final minutes = (seconds % 3600) ~/ 60;
  final secs = seconds % 60;
  final mm = hours > 0 ? minutes.toString().padLeft(2, '0') : '$minutes';
  final ss = secs.toString().padLeft(2, '0');
  return hours > 0 ? '$hours:$mm:$ss' : '$mm:$ss';
}
