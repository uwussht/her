import 'package:freezed_annotation/freezed_annotation.dart';

import 'tracker_enums.dart';

part 'daily_log.freezed.dart';
part 'daily_log.g.dart';

/// One day's tracker entry. Health data, so it stays in the encrypted
/// local store.
@freezed
abstract class DailyLog with _$DailyLog {
  const factory DailyLog({
    required DateTime date,
    FlowLevel? flow,
    @Default(<Symptom>[]) List<Symptom> symptoms,
    Mood? mood,
    EnergyLevel? energy,
    double? sleepHours,
    String? notes,
  }) = _DailyLog;

  const DailyLog._();

  factory DailyLog.fromJson(Map<String, dynamic> json) =>
      _$DailyLogFromJson(json);

  static const double maxSleepHours = 14;

  /// True when nothing was actually recorded, so the entry can be deleted
  /// instead of stored empty.
  bool get isEmpty =>
      flow == null &&
      symptoms.isEmpty &&
      mood == null &&
      energy == null &&
      sleepHours == null &&
      (notes == null || notes!.trim().isEmpty);
}
