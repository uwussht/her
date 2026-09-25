// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyLog _$DailyLogFromJson(Map<String, dynamic> json) => _DailyLog(
  date: DateTime.parse(json['date'] as String),
  flow: $enumDecodeNullable(_$FlowLevelEnumMap, json['flow']),
  symptoms:
      (json['symptoms'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SymptomEnumMap, e))
          .toList() ??
      const <Symptom>[],
  mood: $enumDecodeNullable(_$MoodEnumMap, json['mood']),
  energy: $enumDecodeNullable(_$EnergyLevelEnumMap, json['energy']),
  sleepHours: (json['sleepHours'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$DailyLogToJson(_DailyLog instance) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'flow': _$FlowLevelEnumMap[instance.flow],
  'symptoms': instance.symptoms.map((e) => _$SymptomEnumMap[e]!).toList(),
  'mood': _$MoodEnumMap[instance.mood],
  'energy': _$EnergyLevelEnumMap[instance.energy],
  'sleepHours': instance.sleepHours,
  'notes': instance.notes,
};

const _$FlowLevelEnumMap = {
  FlowLevel.spotting: 'spotting',
  FlowLevel.light: 'light',
  FlowLevel.medium: 'medium',
  FlowLevel.heavy: 'heavy',
};

const _$SymptomEnumMap = {
  Symptom.cramps: 'cramps',
  Symptom.headache: 'headache',
  Symptom.backPain: 'backPain',
  Symptom.bloating: 'bloating',
  Symptom.breastTenderness: 'breastTenderness',
  Symptom.nausea: 'nausea',
  Symptom.acne: 'acne',
  Symptom.fatigue: 'fatigue',
  Symptom.cravings: 'cravings',
  Symptom.insomnia: 'insomnia',
  Symptom.hotFlashes: 'hotFlashes',
  Symptom.nightSweats: 'nightSweats',
  Symptom.irritability: 'irritability',
  Symptom.anxiety: 'anxiety',
  Symptom.lowMood: 'lowMood',
};

const _$MoodEnumMap = {
  Mood.great: 'great',
  Mood.good: 'good',
  Mood.okay: 'okay',
  Mood.low: 'low',
  Mood.awful: 'awful',
};

const _$EnergyLevelEnumMap = {
  EnergyLevel.low: 'low',
  EnergyLevel.medium: 'medium',
  EnergyLevel.high: 'high',
};
