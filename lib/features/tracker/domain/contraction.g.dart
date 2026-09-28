// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contraction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Contraction _$ContractionFromJson(Map<String, dynamic> json) => _Contraction(
  id: json['id'] as String,
  startedAt: DateTime.parse(json['startedAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
);

Map<String, dynamic> _$ContractionToJson(_Contraction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt?.toIso8601String(),
    };
