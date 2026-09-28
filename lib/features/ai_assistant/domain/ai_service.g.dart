// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiChatRequest _$AiChatRequestFromJson(Map<String, dynamic> json) =>
    _AiChatRequest(
      message: json['message'] as String,
      userContext: AiUserContext.fromJson(
        json['userContext'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$AiChatRequestToJson(_AiChatRequest instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userContext': instance.userContext.toJson(),
    };

_AiChatResponse _$AiChatResponseFromJson(Map<String, dynamic> json) =>
    _AiChatResponse(
      reply: json['reply'] as String,
      references:
          (json['references'] as List<dynamic>?)
              ?.map((e) => ChatReference.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ChatReference>[],
      emergency: json['emergency'] as bool? ?? false,
    );

Map<String, dynamic> _$AiChatResponseToJson(_AiChatResponse instance) =>
    <String, dynamic>{
      'reply': instance.reply,
      'references': instance.references.map((e) => e.toJson()).toList(),
      'emergency': instance.emergency,
    };
