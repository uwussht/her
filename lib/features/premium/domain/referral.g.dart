// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferralState _$ReferralStateFromJson(Map<String, dynamic> json) =>
    _ReferralState(
      code: json['code'] as String,
      invitedCount: (json['invitedCount'] as num?)?.toInt() ?? 0,
      rewardedMonths: (json['rewardedMonths'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ReferralStateToJson(_ReferralState instance) =>
    <String, dynamic>{
      'code': instance.code,
      'invitedCount': instance.invitedCount,
      'rewardedMonths': instance.rewardedMonths,
    };
