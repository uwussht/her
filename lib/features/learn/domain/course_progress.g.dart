// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseProgress _$CourseProgressFromJson(Map<String, dynamic> json) =>
    _CourseProgress(
      courseId: json['courseId'] as String,
      completedLessonIds:
          (json['completedLessonIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      lastLessonId: json['lastLessonId'] as String?,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$CourseProgressToJson(_CourseProgress instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'completedLessonIds': instance.completedLessonIds,
      'lastLessonId': instance.lastLessonId,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };
