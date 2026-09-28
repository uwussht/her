// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_quota.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiUsage _$AiUsageFromJson(Map<String, dynamic> json) => _AiUsage(
  day: DateTime.parse(json['day'] as String),
  count: (json['count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$AiUsageToJson(_AiUsage instance) => <String, dynamic>{
  'day': instance.day.toIso8601String(),
  'count': instance.count,
};
