import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/date_utils.dart';

part 'ai_quota.freezed.dart';
part 'ai_quota.g.dart';

/// How many assistant messages she has sent today.
@freezed
abstract class AiUsage with _$AiUsage {
  const factory AiUsage({required DateTime day, @Default(0) int count}) =
      _AiUsage;

  const AiUsage._();

  factory AiUsage.fromJson(Map<String, dynamic> json) =>
      _$AiUsageFromJson(json);

  /// Usage for [now], resetting when the calendar day has changed.
  AiUsage on(DateTime now) =>
      day.isSameDay(now) ? this : AiUsage(day: now.dateOnly);

  AiUsage increment(DateTime now) {
    final current = on(now);
    return current.copyWith(count: current.count + 1);
  }
}

/// The free-tier daily limit.
///
/// Pure, so the boundary between the fifth and sixth message of the day is
/// unit-tested rather than discovered in production.
class AiQuota {
  const AiQuota({this.freeMessagesPerDay = defaultFreeMessagesPerDay});

  static const int defaultFreeMessagesPerDay = 5;

  final int freeMessagesPerDay;

  bool canSend({
    required AiUsage usage,
    required bool hasPremium,
    required DateTime now,
  }) => hasPremium || usage.on(now).count < freeMessagesPerDay;

  /// Messages left today, or null when she has premium.
  int? remaining({
    required AiUsage usage,
    required bool hasPremium,
    required DateTime now,
  }) {
    if (hasPremium) return null;
    final used = usage.on(now).count;
    return used >= freeMessagesPerDay ? 0 : freeMessagesPerDay - used;
  }
}

abstract interface class AiUsageRepository {
  AiUsage read();

  Future<void> save(AiUsage usage);
}
