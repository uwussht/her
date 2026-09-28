// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CircleLink _$CircleLinkFromJson(Map<String, dynamic> json) => _CircleLink(
  id: json['id'] as String,
  kind: $enumDecode(_$LinkKindEnumMap, json['kind']),
  side: $enumDecode(_$LinkSideEnumMap, json['side']),
  code: json['code'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  status:
      $enumDecodeNullable(_$LinkStatusEnumMap, json['status']) ??
      LinkStatus.pending,
  peerUid: json['peerUid'] as String?,
  peerName: json['peerName'] as String?,
  shares:
      (json['shares'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ShareScopeEnumMap, e))
          .toSet() ??
      const <ShareScope>{},
  linkedAt: json['linkedAt'] == null
      ? null
      : DateTime.parse(json['linkedAt'] as String),
);

Map<String, dynamic> _$CircleLinkToJson(_CircleLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$LinkKindEnumMap[instance.kind]!,
      'side': _$LinkSideEnumMap[instance.side]!,
      'code': instance.code,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': _$LinkStatusEnumMap[instance.status]!,
      'peerUid': instance.peerUid,
      'peerName': instance.peerName,
      'shares': instance.shares.map((e) => _$ShareScopeEnumMap[e]!).toList(),
      'linkedAt': instance.linkedAt?.toIso8601String(),
    };

const _$LinkKindEnumMap = {
  LinkKind.partner: 'partner',
  LinkKind.family: 'family',
};

const _$LinkSideEnumMap = {
  LinkSide.sharer: 'sharer',
  LinkSide.viewer: 'viewer',
};

const _$LinkStatusEnumMap = {
  LinkStatus.pending: 'pending',
  LinkStatus.active: 'active',
};

const _$ShareScopeEnumMap = {
  ShareScope.lifeStage: 'lifeStage',
  ShareScope.cyclePhase: 'cyclePhase',
  ShareScope.mood: 'mood',
  ShareScope.pregnancy: 'pregnancy',
  ShareScope.symptoms: 'symptoms',
};
