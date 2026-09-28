// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatReference _$ChatReferenceFromJson(Map<String, dynamic> json) =>
    _ChatReference(
      kind: $enumDecode(_$ReferenceKindEnumMap, json['kind']),
      id: json['id'] as String,
    );

Map<String, dynamic> _$ChatReferenceToJson(_ChatReference instance) =>
    <String, dynamic>{
      'kind': _$ReferenceKindEnumMap[instance.kind]!,
      'id': instance.id,
    };

const _$ReferenceKindEnumMap = {
  ReferenceKind.lesson: 'lesson',
  ReferenceKind.product: 'product',
};

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  id: json['id'] as String,
  role: $enumDecode(_$ChatRoleEnumMap, json['role']),
  text: json['text'] as String,
  sentAt: DateTime.parse(json['sentAt'] as String),
  references:
      (json['references'] as List<dynamic>?)
          ?.map((e) => ChatReference.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ChatReference>[],
  isEmergency: json['isEmergency'] as bool? ?? false,
  isError: json['isError'] as bool? ?? false,
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$ChatRoleEnumMap[instance.role]!,
      'text': instance.text,
      'sentAt': instance.sentAt.toIso8601String(),
      'references': instance.references.map((e) => e.toJson()).toList(),
      'isEmergency': instance.isEmergency,
      'isError': instance.isError,
    };

const _$ChatRoleEnumMap = {
  ChatRole.user: 'user',
  ChatRole.assistant: 'assistant',
};
