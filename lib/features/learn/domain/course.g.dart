// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lesson _$LessonFromJson(Map<String, dynamic> json) => _Lesson(
  id: json['id'] as String,
  title: const LocalizedTextConverter().fromJson(
    json['title'] as Map<String, dynamic>,
  ),
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  isQuiz: json['isQuiz'] as bool? ?? false,
  videoUrl: json['videoUrl'] as String?,
);

Map<String, dynamic> _$LessonToJson(_Lesson instance) => <String, dynamic>{
  'id': instance.id,
  'title': const LocalizedTextConverter().toJson(instance.title),
  'durationMinutes': instance.durationMinutes,
  'isQuiz': instance.isQuiz,
  'videoUrl': instance.videoUrl,
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
