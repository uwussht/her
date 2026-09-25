import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/l10n/localized_text.dart';
import '../../../core/utils/date_utils.dart';

part 'pregnancy_status.freezed.dart';
part 'pregnancy_status.g.dart';

/// How big the baby is this week, for the home status card.
@freezed
abstract class BabySize with _$BabySize {
  const factory BabySize({
    required int week,
    @LocalizedTextConverter() required LocalizedText name,
  }) = _BabySize;

  factory BabySize.fromJson(Map<String, dynamic> json) =>
      _$BabySizeFromJson(json);
}

/// Where she is in a pregnancy, dated from the last menstrual period.
///
/// Step 10 builds the full pregnancy tracker; this is what the home feed
/// needs today.
@immutable
class PregnancyStatus {
  const PregnancyStatus({
    required this.week,
    required this.dayOfWeek,
    required this.dueDate,
    required this.daysRemaining,
  });

  /// A pregnancy is dated as 40 weeks from the last period.
  static const int fullTermDays = 280;
  static const int maxWeek = 42;

  /// Current week, 1-based, as clinicians count it.
  final int week;

  /// Day within [week], 0-6.
  final int dayOfWeek;
  final DateTime dueDate;

  /// Days left until [dueDate]; negative once overdue.
  final int daysRemaining;

  /// 1, 2 or 3.
  int get trimester => week <= 13 ? 1 : (week <= 27 ? 2 : 3);

  /// Null when the dates make no sense as a pregnancy, e.g. a last period
  /// far in the past.
  static PregnancyStatus? fromLastPeriod(
    DateTime lastPeriodStart,
    DateTime on,
  ) {
    final elapsed = lastPeriodStart.daysUntil(on);
    if (elapsed < 0) return null;
    final week = elapsed ~/ 7 + 1;
    if (week > maxWeek) return null;
    final dueDate = lastPeriodStart.addDays(fullTermDays);
    return PregnancyStatus(
      week: week,
      dayOfWeek: elapsed % 7,
      dueDate: dueDate,
      daysRemaining: on.daysUntil(dueDate),
    );
  }

  /// The closest size entry at or before [week].
  static BabySize? sizeFor(int week, List<BabySize> sizes) {
    BabySize? match;
    for (final size in sizes) {
      if (size.week <= week && (match == null || size.week > match.week)) {
        match = size;
      }
    }
    return match;
  }
}
