// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiAnswer _$AiAnswerFromJson(Map<String, dynamic> json) => _AiAnswer(
  id: json['id'] as String,
  keywords:
      (json['keywords'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ) ??
      const <String, List<String>>{},
  answer: const LocalizedTextConverter().fromJson(
    json['answer'] as Map<String, dynamic>,
  ),
  references:
      (json['references'] as List<dynamic>?)
          ?.map((e) => ChatReference.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ChatReference>[],
);

Map<String, dynamic> _$AiAnswerToJson(_AiAnswer instance) => <String, dynamic>{
  'id': instance.id,
  'keywords': instance.keywords,
  'answer': const LocalizedTextConverter().toJson(instance.answer),
  'references': instance.references.map((e) => e.toJson()).toList(),
};
