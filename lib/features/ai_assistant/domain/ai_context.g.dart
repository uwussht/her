// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiUserContext _$AiUserContextFromJson(Map<String, dynamic> json) =>
    _AiUserContext(
      ageGroup: json['ageGroup'] as String?,
      stage: json['stage'] as String?,
      cycleDay: (json['cycleDay'] as num?)?.toInt(),
      pregWeek: (json['pregWeek'] as num?)?.toInt(),
      language: json['language'] as String,
    );

Map<String, dynamic> _$AiUserContextToJson(_AiUserContext instance) =>
    <String, dynamic>{
      'ageGroup': instance.ageGroup,
      'stage': instance.stage,
      'cycleDay': instance.cycleDay,
      'pregWeek': instance.pregWeek,
      'language': instance.language,
    };
