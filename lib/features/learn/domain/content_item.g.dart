// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContentItem _$ContentItemFromJson(Map<String, dynamic> json) => _ContentItem(
  id: json['id'] as String,
  type: $enumDecode(_$ContentTypeEnumMap, json['type']),
  category: $enumDecode(_$ContentCategoryEnumMap, json['category']),
  title: const LocalizedTextConverter().fromJson(
    json['title'] as Map<String, dynamic>,
  ),
  summary: const LocalizedTextConverter().fromJson(
    json['summary'] as Map<String, dynamic>,
  ),
  tier:
      $enumDecodeNullable(_$AccessTierEnumMap, json['tier']) ?? AccessTier.free,
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  stages:
      (json['stages'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$LifeStageEnumMap, e))
          .toList() ??
      const <LifeStage>[],
  interests:
      (json['interests'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$InterestEnumMap, e))
          .toList() ??
      const <Interest>[],
  pregnancyWeek: (json['pregnancyWeek'] as num?)?.toInt(),
  courseId: json['courseId'] as String?,
  expertId: json['expertId'] as String?,
  imageUrl: json['imageUrl'] as String?,
  videoUrl: json['videoUrl'] as String?,
  viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
  publishedAt: json['publishedAt'] == null
      ? null
      : DateTime.parse(json['publishedAt'] as String),
);

Map<String, dynamic> _$ContentItemToJson(
  _ContentItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$ContentTypeEnumMap[instance.type]!,
  'category': _$ContentCategoryEnumMap[instance.category]!,
  'title': const LocalizedTextConverter().toJson(instance.title),
  'summary': const LocalizedTextConverter().toJson(instance.summary),
  'tier': _$AccessTierEnumMap[instance.tier]!,
  'durationMinutes': instance.durationMinutes,
  'stages': instance.stages.map((e) => _$LifeStageEnumMap[e]!).toList(),
  'interests': instance.interests.map((e) => _$InterestEnumMap[e]!).toList(),
  'pregnancyWeek': instance.pregnancyWeek,
  'courseId': instance.courseId,
  'expertId': instance.expertId,
  'imageUrl': instance.imageUrl,
  'videoUrl': instance.videoUrl,
  'viewCount': instance.viewCount,
  'publishedAt': instance.publishedAt?.toIso8601String(),
};

const _$ContentTypeEnumMap = {
  ContentType.video: 'video',
  ContentType.article: 'article',
  ContentType.course: 'course',
  ContentType.podcast: 'podcast',
};

const _$ContentCategoryEnumMap = {
  ContentCategory.myBody: 'myBody',
  ContentCategory.cycleHealth: 'cycleHealth',
  ContentCategory.pregnancySchool: 'pregnancySchool',
  ContentCategory.postpartum: 'postpartum',
  ContentCategory.menopause: 'menopause',
  ContentCategory.mentalHealth: 'mentalHealth',
  ContentCategory.nutrition: 'nutrition',
  ContentCategory.intimacy: 'intimacy',
};

const _$AccessTierEnumMap = {
  AccessTier.free: 'free',
  AccessTier.premium: 'premium',
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
