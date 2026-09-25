// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  category: $enumDecode(_$ProductCategoryEnumMap, json['category']),
  title: const LocalizedTextConverter().fromJson(
    json['title'] as Map<String, dynamic>,
  ),
  description: const LocalizedTextConverter().fromJson(
    json['description'] as Map<String, dynamic>,
  ),
  price: (json['price'] as num).toInt(),
  oldPrice: (json['oldPrice'] as num?)?.toInt(),
  sellerId: json['sellerId'] as String,
  imageUrls:
      (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  rating: (json['rating'] as num?)?.toDouble() ?? 0,
  reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
  inStock: json['inStock'] as bool? ?? true,
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
  interests:
      (json['interests'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$InterestEnumMap, e))
          .toList() ??
      const <Interest>[],
  bundleProductIds:
      (json['bundleProductIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  relatedContentId: json['relatedContentId'] as String?,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'category': _$ProductCategoryEnumMap[instance.category]!,
  'title': const LocalizedTextConverter().toJson(instance.title),
  'description': const LocalizedTextConverter().toJson(instance.description),
  'price': instance.price,
  'oldPrice': instance.oldPrice,
  'sellerId': instance.sellerId,
  'imageUrls': instance.imageUrls,
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'inStock': instance.inStock,
  'phases': instance.phases.map((e) => _$CyclePhaseEnumMap[e]!).toList(),
  'stages': instance.stages.map((e) => _$LifeStageEnumMap[e]!).toList(),
  'interests': instance.interests.map((e) => _$InterestEnumMap[e]!).toList(),
  'bundleProductIds': instance.bundleProductIds,
  'relatedContentId': instance.relatedContentId,
};

const _$ProductCategoryEnumMap = {
  ProductCategory.periodCare: 'periodCare',
  ProductCategory.pregnancy: 'pregnancy',
  ProductCategory.baby: 'baby',
  ProductCategory.beauty: 'beauty',
  ProductCategory.wellness: 'wellness',
  ProductCategory.intimateHealth: 'intimateHealth',
  ProductCategory.subscriptionBox: 'subscriptionBox',
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
