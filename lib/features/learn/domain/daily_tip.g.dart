// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_tip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyTip _$DailyTipFromJson(Map<String, dynamic> json) => _DailyTip(
  id: json['id'] as String,
  text: const LocalizedTextConverter().fromJson(
    json['text'] as Map<String, dynamic>,
  ),
  phases:
      (json['phases'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CyclePhaseEnumMap, e))
          .toList() ??
      const <CyclePhase>[],
  stages:
      (json['stages'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$LifeStageEnumMap, e))
          .toList() ??
      const <LifeStage>[],
  contentId: json['contentId'] as String?,
);

Map<String, dynamic> _$DailyTipToJson(_DailyTip instance) => <String, dynamic>{
  'id': instance.id,
  'text': const LocalizedTextConverter().toJson(instance.text),
  'phases': instance.phases.map((e) => _$CyclePhaseEnumMap[e]!).toList(),
  'stages': instance.stages.map((e) => _$LifeStageEnumMap[e]!).toList(),
  'contentId': instance.contentId,
};

const _$CyclePhaseEnumMap = {
  CyclePhase.period: 'period',
  CyclePhase.predictedPeriod: 'predictedPeriod',
  CyclePhase.follicular: 'follicular',
  CyclePhase.fertile: 'fertile',
  CyclePhase.ovulation: 'ovulation',
  CyclePhase.luteal: 'luteal',
  CyclePhase.unknown: 'unknown',
};

const _$LifeStageEnumMap = {
  LifeStage.firstPeriod: 'firstPeriod',
  LifeStage.trackingCycle: 'trackingCycle',
  LifeStage.tryingToConceive: 'tryingToConceive',
  LifeStage.pregnant: 'pregnant',
  LifeStage.postpartum: 'postpartum',
  LifeStage.perimenopause: 'perimenopause',
  LifeStage.menopause: 'menopause',
};
