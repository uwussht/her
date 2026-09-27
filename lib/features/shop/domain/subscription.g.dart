// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Subscription _$SubscriptionFromJson(Map<String, dynamic> json) =>
    _Subscription(
      id: json['id'] as String,
      productId: json['productId'] as String,
      cadence: $enumDecode(_$BoxCadenceEnumMap, json['cadence']),
      startedAt: DateTime.parse(json['startedAt'] as String),
      nextDelivery: DateTime.parse(json['nextDelivery'] as String),
      active: json['active'] as bool? ?? true,
      deliveriesMade: (json['deliveriesMade'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SubscriptionToJson(_Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'cadence': _$BoxCadenceEnumMap[instance.cadence]!,
      'startedAt': instance.startedAt.toIso8601String(),
      'nextDelivery': instance.nextDelivery.toIso8601String(),
      'active': instance.active,
      'deliveriesMade': instance.deliveriesMade,
    };

const _$BoxCadenceEnumMap = {
  BoxCadence.monthly: 'monthly',
  BoxCadence.trimester: 'trimester',
};
