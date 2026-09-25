// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregnancy_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BabySize _$BabySizeFromJson(Map<String, dynamic> json) => _BabySize(
  week: (json['week'] as num).toInt(),
  name: const LocalizedTextConverter().fromJson(
    json['name'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$BabySizeToJson(_BabySize instance) => <String, dynamic>{
  'week': instance.week,
  'name': const LocalizedTextConverter().toJson(instance.name),
};
