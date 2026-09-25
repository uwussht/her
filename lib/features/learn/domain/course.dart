import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/l10n/localized_text.dart';

part 'course.freezed.dart';
part 'course.g.dart';

/// A lesson inside a course module.
@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({
    required String id,
    @LocalizedTextConverter() required LocalizedText title,
    required int durationMinutes,
    @Default(false) bool isQuiz,
    String? videoUrl,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}

/// A group of lessons, ending with an optional quiz.
@freezed
abstract class CourseModule with _$CourseModule {
  const factory CourseModule({
    required String id,
    @LocalizedTextConverter() required LocalizedText title,
    @Default(<Lesson>[]) List<Lesson> lessons,
  }) = _CourseModule;

  factory CourseModule.fromJson(Map<String, dynamic> json) =>
      _$CourseModuleFromJson(json);
}

/// A full course: modules, lessons and a completion certificate.
@freezed
abstract class Course with _$Course {
  const factory Course({
    required String id,
    @LocalizedTextConverter() required LocalizedText title,
    @Default(<CourseModule>[]) List<CourseModule> modules,
    @Default(true) bool grantsCertificate,
  }) = _Course;

  const Course._();

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  List<Lesson> get lessons => [for (final module in modules) ...module.lessons];

  int get lessonCount => lessons.length;

  int get totalMinutes =>
      lessons.fold(0, (sum, lesson) => sum + lesson.durationMinutes);

  /// The module a lesson belongs to, or null when the id is unknown.
  CourseModule? moduleOf(String lessonId) {
    for (final module in modules) {
      if (module.lessons.any((lesson) => lesson.id == lessonId)) return module;
    }
    return null;
  }

  /// The lesson after [lessonId], or null at the end of the course.
  Lesson? lessonAfter(String lessonId) {
    final all = lessons;
    final index = all.indexWhere((lesson) => lesson.id == lessonId);
    if (index < 0 || index + 1 >= all.length) return null;
    return all[index + 1];
  }
}
