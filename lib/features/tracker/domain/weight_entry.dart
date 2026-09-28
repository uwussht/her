import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/date_utils.dart';

part 'weight_entry.freezed.dart';
part 'weight_entry.g.dart';

/// One weighing (spec 5.4: the pregnancy weight log).
@freezed
abstract class WeightEntry with _$WeightEntry {
  const factory WeightEntry({required DateTime date, required double kg}) =
      _WeightEntry;

  const WeightEntry._();

  factory WeightEntry.fromJson(Map<String, dynamic> json) =>
      _$WeightEntryFromJson(json);

  /// Sanity bounds for the input field.
  static const double minKg = 30;
  static const double maxKg = 250;
}

/// Reads the weight log. Pure: gain is arithmetic, not advice.
class WeightLog {
  const WeightLog(List<WeightEntry> entries) : _entries = entries;

  final List<WeightEntry> _entries;

  /// Oldest first, one entry per day (the latest weighing wins).
  List<WeightEntry> get entries {
    final byDay = <DateTime, WeightEntry>{};
    for (final entry in _entries) {
      byDay[entry.date.dateOnly] = entry;
    }
    return byDay.values.toList()..sort((a, b) => a.date.compareTo(b.date));
  }

  bool get isEmpty => entries.isEmpty;

  WeightEntry? get first => entries.isEmpty ? null : entries.first;

  WeightEntry? get latest => entries.isEmpty ? null : entries.last;

  /// Kilograms gained since the first weighing, or null with fewer than two.
  double? get totalGainKg {
    final all = entries;
    if (all.length < 2) return null;
    return all.last.kg - all.first.kg;
  }

  /// Change since the previous weighing, or null with fewer than two.
  double? get lastChangeKg {
    final all = entries;
    if (all.length < 2) return null;
    return all.last.kg - all[all.length - 2].kg;
  }

  /// Entries as (pregnancy week, kg) for the chart, given the last period.
  ///
  /// Weighings before the pregnancy started are left out.
  List<(int week, double kg)> byPregnancyWeek(DateTime lastPeriodStart) {
    final series = <(int, double)>[];
    for (final entry in entries) {
      final days = lastPeriodStart.daysUntil(entry.date);
      if (days < 0) continue;
      series.add((days ~/ 7 + 1, entry.kg));
    }
    return series;
  }

  /// Replaces the entry for that day, or adds one.
  List<WeightEntry> upsert(WeightEntry entry) => [
    for (final existing in _entries)
      if (!existing.date.isSameDay(entry.date)) existing,
    entry,
  ]..sort((a, b) => a.date.compareTo(b.date));

  List<WeightEntry> removeOn(DateTime day) => [
    for (final existing in _entries)
      if (!existing.date.isSameDay(day)) existing,
  ];
}
