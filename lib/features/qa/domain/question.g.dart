// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Answer _$AnswerFromJson(Map<String, dynamic> json) => _Answer(
  id: json['id'] as String,
  questionId: json['questionId'] as String,
  expertId: json['expertId'] as String,
  body: const LocalizedTextConverter().fromJson(
    json['body'] as Map<String, dynamic>,
  ),
  answeredAt: DateTime.parse(json['answeredAt'] as String),
  upvotes: (json['upvotes'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$AnswerToJson(_Answer instance) => <String, dynamic>{
  'id': instance.id,
  'questionId': instance.questionId,
  'expertId': instance.expertId,
  'body': const LocalizedTextConverter().toJson(instance.body),
  'answeredAt': instance.answeredAt.toIso8601String(),
  'upvotes': instance.upvotes,
};

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
  id: json['id'] as String,
  body: const LocalizedTextConverter().fromJson(
    json['body'] as Map<String, dynamic>,
  ),
  category: $enumDecode(_$ContentCategoryEnumMap, json['category']),
  askedAt: DateTime.parse(json['askedAt'] as String),
  askedBy: json['askedBy'] as String?,
  upvotes: (json['upvotes'] as num?)?.toInt() ?? 0,
  answers:
      (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Answer>[],
  priority: json['priority'] as bool? ?? false,
);

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
  'id': instance.id,
  'body': const LocalizedTextConverter().toJson(instance.body),
  'category': _$ContentCategoryEnumMap[instance.category]!,
  'askedAt': instance.askedAt.toIso8601String(),
  'askedBy': instance.askedBy,
  'upvotes': instance.upvotes,
  'answers': instance.answers.map((e) => e.toJson()).toList(),
  'priority': instance.priority,
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
