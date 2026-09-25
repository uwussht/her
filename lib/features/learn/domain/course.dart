import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/l10n/localized_text.dart';

part 'course.freezed.dart';
part 'course.g.dart';

/// One multiple-choice question in a lesson quiz.
@freezed
abstract class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    @LocalizedTextConverter() required LocalizedText question,
    @LocalizedTextListConverter() required List<LocalizedText> options,

    /// Index into [options].
    required int correctIndex,
    @LocalizedTextConverter() LocalizedText? explanation,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
}

/// A lesson inside a course module.
@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({
    required String id,
    @LocalizedTextConverter() required LocalizedText title,
    required int durationMinutes,
    @Default(false) bool isQuiz,
    String? videoUrl,

    /// Lesson text, one entry per paragraph, used when there is no video.
    @Default(<LocalizedText>[])
    @LocalizedTextListConverter()
    List<LocalizedText> body,

    /// Questions for a quiz lesson.
    @Default(<QuizQuestion>[]) List<QuizQuestion> questions,
  }) = _Lesson;

  const Lesson._();

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  /// A quiz needs at least one question to be worth opening.
  bool get isPlayableQuiz => isQuiz && questions.isNotEmpty;

  /// Share of correct answers needed to pass a quiz.
  static const double passMark = 0.7;
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
  Lesson? lessonById(String id) {
    for (final lesson in lessons) {
      if (lesson.id == id) return lesson;
    }
    return null;
  }

  /// 1-based position of [lessonId] in the whole course.
  int? lessonNumber(String lessonId) {
    final index = lessons.indexWhere((lesson) => lesson.id == lessonId);
    return index < 0 ? null : index + 1;
  }

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
