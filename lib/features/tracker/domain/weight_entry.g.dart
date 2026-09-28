// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeightEntry _$WeightEntryFromJson(Map<String, dynamic> json) => _WeightEntry(
  date: DateTime.parse(json['date'] as String),
  kg: (json['kg'] as num).toDouble(),
);

Map<String, dynamic> _$WeightEntryToJson(_WeightEntry instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'kg': instance.kg,
    };
