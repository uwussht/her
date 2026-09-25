/// Date helpers that treat a [DateTime] as a calendar day.
///
/// Tracker maths must ignore both the time of day and daylight-saving
/// shifts, so whole-day differences are computed on UTC midnights rather
/// than with [DateTime.difference].
extension CalendarDate on DateTime {
  /// This instant's calendar day, at local midnight.
  DateTime get dateOnly => DateTime(year, month, day);

  /// Whole days from this day to [other]. Negative when [other] is earlier.
  int daysUntil(DateTime other) {
    final from = DateTime.utc(year, month, day);
    final to = DateTime.utc(other.year, other.month, other.day);
    return to.difference(from).inDays;
  }

  DateTime addDays(int days) => DateTime(year, month, day + days);

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool isSameMonth(DateTime other) =>
      year == other.year && month == other.month;
}

/// Today, at local midnight.
DateTime today() => DateTime.now().dateOnly;
