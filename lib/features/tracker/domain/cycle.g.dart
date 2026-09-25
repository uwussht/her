// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cycle _$CycleFromJson(Map<String, dynamic> json) => _Cycle(
  id: json['id'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  periodEndDate: json['periodEndDate'] == null
      ? null
      : DateTime.parse(json['periodEndDate'] as String),
);

Map<String, dynamic> _$CycleToJson(_Cycle instance) => <String, dynamic>{
  'id': instance.id,
  'startDate': instance.startDate.toIso8601String(),
  'periodEndDate': instance.periodEndDate?.toIso8601String(),
};
