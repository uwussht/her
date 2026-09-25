import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../home/presentation/home_providers.dart';
import 'learn_providers.dart';
import 'quiz_screen.dart';
import 'widgets/article_body.dart';
import 'widgets/lesson_video_player.dart';

/// One lesson: video or text, then "mark done" and the next lesson.
class LessonScreen extends ConsumerWidget {
  const LessonScreen({
    required this.courseId,
    required this.lessonId,
    super.key,
  });

  final String courseId;
  final String lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final course = ref.watch(courseByIdProvider(courseId));
    final lesson = course?.lessonById(lessonId);
    if (course == null || lesson == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.notFoundTitle)),
      );
    }

    // A quiz lesson is its own screen.
    if (lesson.isPlayableQuiz) {
      return QuizScreen(courseId: courseId, lessonId: lessonId);
    }

    final progress = ref.watch(courseProgressControllerProvider)[courseId];
    final done = progress?.completedLessonIds.contains(lessonId) ?? false;
    final next = course.lessonAfter(lessonId);
    final number = course.lessonNumber(lessonId) ?? 1;

    Future<void> complete() async {
      await ref
          .read(courseProgressControllerProvider.notifier)
          .completeLesson(course: course, lessonId: lessonId);
      if (!context.mounted) return;
      if (next != null) {
        context.pushReplacement(AppRoutes.lesson(courseId, next.id));
      } else {
        context.pop();
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(course.title.of(context))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.xl,
        ),
        children: [
          Text(
            l10n.courseLessonOf(number, course.lessonCount),
            style: context.textTheme.labelMedium,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            lesson.title.of(context),
            style: context.textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSpacing.md),
          if (lesson.videoUrl case final url?) ...[
            LessonVideoPlayer(url: url),
            const SizedBox(height: AppSpacing.md),
          ],
          if (lesson.body.isNotEmpty)
            ArticleBody(paragraphs: lesson.body)
          else if (lesson.videoUrl == null)
            Text(
              l10n.videoNoSource,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.palette.textSecondary,
              ),
            ),
          const SizedBox(height: AppSpacing.lg),
          if (done)
            PillBadge(
              label: l10n.courseLessonDone,
              tone: AppTone.green,
              icon: Icons.check_circle_rounded,
            ),
          const SizedBox(height: AppSpacing.sm),
          LoadingButton(
            label: next == null ? l10n.courseFinish : l10n.courseNext,
            icon: next == null
                ? Icons.flag_rounded
                : Icons.arrow_forward_rounded,
            onPressed: complete,
          ),
        ],
      ),
    );
  }
}
