import 'package:freezed_annotation/freezed_annotation.dart';

import 'course.dart';

part 'course_progress.freezed.dart';
part 'course_progress.g.dart';

/// How far she has got in a course. Stored on device.
@freezed
abstract class CourseProgress with _$CourseProgress {
  const factory CourseProgress({
    required String courseId,
    @Default(<String>[]) List<String> completedLessonIds,

    /// The lesson to resume from.
    String? lastLessonId,
    required DateTime updatedAt,
    DateTime? completedAt,
  }) = _CourseProgress;

  const CourseProgress._();

  factory CourseProgress.fromJson(Map<String, dynamic> json) =>
      _$CourseProgressFromJson(json);

  bool get isStarted => completedLessonIds.isNotEmpty || lastLessonId != null;

  bool get isComplete => completedAt != null;

  /// 0.0 to 1.0 through [course].
  double fractionOf(Course course) {
    if (course.lessonCount == 0) return 0;
    final done = course.lessons
        .where((lesson) => completedLessonIds.contains(lesson.id))
        .length;
    return done / course.lessonCount;
  }

  /// The lesson to open next: where she left off, or the first unfinished one.
  Lesson? nextLesson(Course course) {
    for (final lesson in course.lessons) {
      if (!completedLessonIds.contains(lesson.id)) return lesson;
    }
    return null;
  }
}
