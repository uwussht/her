// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) =>
    _QuizQuestion(
      question: const LocalizedTextConverter().fromJson(
        json['question'] as Map<String, dynamic>,
      ),
      options: const LocalizedTextListConverter().fromJson(
        json['options'] as List,
      ),
      correctIndex: (json['correctIndex'] as num).toInt(),
      explanation: _$JsonConverterFromJson<Map<String, dynamic>, LocalizedText>(
        json['explanation'],
        const LocalizedTextConverter().fromJson,
      ),
    );

Map<String, dynamic> _$QuizQuestionToJson(_QuizQuestion instance) =>
    <String, dynamic>{
      'question': const LocalizedTextConverter().toJson(instance.question),
      'options': const LocalizedTextListConverter().toJson(instance.options),
      'correctIndex': instance.correctIndex,
      'explanation': _$JsonConverterToJson<Map<String, dynamic>, LocalizedText>(
        instance.explanation,
        const LocalizedTextConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_Lesson _$LessonFromJson(Map<String, dynamic> json) => _Lesson(
  id: json['id'] as String,
  title: const LocalizedTextConverter().fromJson(
    json['title'] as Map<String, dynamic>,
  ),
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  isQuiz: json['isQuiz'] as bool? ?? false,
  videoUrl: json['videoUrl'] as String?,
  body: json['body'] == null
      ? const <LocalizedText>[]
      : const LocalizedTextListConverter().fromJson(json['body'] as List),
  questions:
      (json['questions'] as List<dynamic>?)
          ?.map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <QuizQuestion>[],
);

Map<String, dynamic> _$LessonToJson(_Lesson instance) => <String, dynamic>{
  'id': instance.id,
  'title': const LocalizedTextConverter().toJson(instance.title),
  'durationMinutes': instance.durationMinutes,
  'isQuiz': instance.isQuiz,
  'videoUrl': instance.videoUrl,
  'body': const LocalizedTextListConverter().toJson(instance.body),
  'questions': instance.questions.map((e) => e.toJson()).toList(),
};

_CourseModule _$CourseModuleFromJson(Map<String, dynamic> json) =>
    _CourseModule(
      id: json['id'] as String,
      title: const LocalizedTextConverter().fromJson(
        json['title'] as Map<String, dynamic>,
      ),
      lessons:
          (json['lessons'] as List<dynamic>?)
              ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Lesson>[],
    );

Map<String, dynamic> _$CourseModuleToJson(_CourseModule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': const LocalizedTextConverter().toJson(instance.title),
      'lessons': instance.lessons.map((e) => e.toJson()).toList(),
    };

_Course _$CourseFromJson(Map<String, dynamic> json) => _Course(
  id: json['id'] as String,
  title: const LocalizedTextConverter().fromJson(
    json['title'] as Map<String, dynamic>,
  ),
  modules:
      (json['modules'] as List<dynamic>?)
          ?.map((e) => CourseModule.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CourseModule>[],
  grantsCertificate: json['grantsCertificate'] as bool? ?? true,
);

Map<String, dynamic> _$CourseToJson(_Course instance) => <String, dynamic>{
  'id': instance.id,
  'title': const LocalizedTextConverter().toJson(instance.title),
  'modules': instance.modules.map((e) => e.toJson()).toList(),
  'grantsCertificate': instance.grantsCertificate,
};
