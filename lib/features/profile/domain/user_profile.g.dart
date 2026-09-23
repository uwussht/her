// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  uid: json['uid'] as String,
  ageGroup: $enumDecode(_$AgeGroupEnumMap, json['ageGroup']),
  lifeStage: $enumDecode(_$LifeStageEnumMap, json['lifeStage']),
  lastPeriodStart: json['lastPeriodStart'] == null
      ? null
      : DateTime.parse(json['lastPeriodStart'] as String),
  cycleLength: (json['cycleLength'] as num?)?.toInt(),
  interests:
      (json['interests'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$InterestEnumMap, e))
          .toList() ??
      const <Interest>[],
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserProfileToJson(
  _UserProfile instance,
) => <String, dynamic>{
  'uid': instance.uid,
  'ageGroup': _$AgeGroupEnumMap[instance.ageGroup]!,
  'lifeStage': _$LifeStageEnumMap[instance.lifeStage]!,
  'lastPeriodStart': instance.lastPeriodStart?.toIso8601String(),
  'cycleLength': instance.cycleLength,
  'interests': instance.interests.map((e) => _$InterestEnumMap[e]!).toList(),
  'createdAt': instance.createdAt.toIso8601String(),
};

const _$AgeGroupEnumMap = {
  AgeGroup.age10to15: 'age10to15',
  AgeGroup.age16to24: 'age16to24',
  AgeGroup.age25to34: 'age25to34',
  AgeGroup.age35to44: 'age35to44',
  AgeGroup.age45plus: 'age45plus',
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

const _$InterestEnumMap = {
  Interest.myBody: 'myBody',
  Interest.cycleHealth: 'cycleHealth',
  Interest.fertility: 'fertility',
  Interest.pregnancy: 'pregnancy',
  Interest.babyAndMotherhood: 'babyAndMotherhood',
  Interest.menopause: 'menopause',
  Interest.mentalHealth: 'mentalHealth',
  Interest.nutrition: 'nutrition',
  Interest.fitness: 'fitness',
  Interest.beauty: 'beauty',
  Interest.intimacy: 'intimacy',
};
