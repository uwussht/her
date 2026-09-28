// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_membership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PremiumMembership _$PremiumMembershipFromJson(Map<String, dynamic> json) =>
    _PremiumMembership(
      status:
          $enumDecodeNullable(_$PremiumStatusEnumMap, json['status']) ??
          PremiumStatus.free,
      plan: $enumDecodeNullable(_$PremiumPlanEnumMap, json['plan']),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      trialEndsAt: json['trialEndsAt'] == null
          ? null
          : DateTime.parse(json['trialEndsAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      bonusMonths: (json['bonusMonths'] as num?)?.toInt() ?? 0,
      trialUsed: json['trialUsed'] as bool? ?? false,
    );

Map<String, dynamic> _$PremiumMembershipToJson(_PremiumMembership instance) =>
    <String, dynamic>{
      'status': _$PremiumStatusEnumMap[instance.status]!,
      'plan': _$PremiumPlanEnumMap[instance.plan],
      'startedAt': instance.startedAt?.toIso8601String(),
      'trialEndsAt': instance.trialEndsAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'bonusMonths': instance.bonusMonths,
      'trialUsed': instance.trialUsed,
    };

const _$PremiumStatusEnumMap = {
  PremiumStatus.free: 'free',
  PremiumStatus.trial: 'trial',
  PremiumStatus.active: 'active',
};

const _$PremiumPlanEnumMap = {
  PremiumPlan.monthly: 'monthly',
  PremiumPlan.yearly: 'yearly',
};
