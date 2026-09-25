import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/date_utils.dart';

part 'cycle.freezed.dart';
part 'cycle.g.dart';

/// One menstrual cycle, identified by the day the period started.
///
/// [periodEndDate] is the last day of bleeding, which is null while the
/// period is still going. The cycle's own length is not stored: it is the
/// gap to the next cycle's [startDate], so a corrected start date never
/// leaves a stale length behind.
@freezed
abstract class Cycle with _$Cycle {
  const factory Cycle({
    required String id,
    required DateTime startDate,
    DateTime? periodEndDate,
  }) = _Cycle;

  const Cycle._();

  factory Cycle.fromJson(Map<String, dynamic> json) => _$CycleFromJson(json);

  /// Days of bleeding logged so far, or null while the period is open.
  int? get periodLength =>
      periodEndDate == null ? null : startDate.daysUntil(periodEndDate!) + 1;

  bool get isPeriodOpen => periodEndDate == null;

  bool coversPeriodDay(DateTime day) {
    final date = day.dateOnly;
    if (date.isBefore(startDate)) return false;
    final end = periodEndDate;
    return end == null ? date == startDate : !date.isAfter(end);
  }
}
