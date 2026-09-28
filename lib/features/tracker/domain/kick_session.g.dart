// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kick_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KickSession _$KickSessionFromJson(Map<String, dynamic> json) => _KickSession(
  id: json['id'] as String,
  startedAt: DateTime.parse(json['startedAt'] as String),
  kicks:
      (json['kicks'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList() ??
      const <DateTime>[],
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
);

Map<String, dynamic> _$KickSessionToJson(_KickSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startedAt': instance.startedAt.toIso8601String(),
      'kicks': instance.kicks.map((e) => e.toIso8601String()).toList(),
      'endedAt': instance.endedAt?.toIso8601String(),
    };
