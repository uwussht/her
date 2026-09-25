import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../home/presentation/home_providers.dart';
import '../domain/course.dart';
import '../domain/course_progress.dart';
import 'learn_providers.dart';

/// Course contents: modules, lessons, progress and the certificate.
class CourseScreen extends ConsumerWidget {
  const CourseScreen({required this.courseId, super.key});

  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final course = ref.watch(courseByIdProvider(courseId));
    if (course == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.notFoundTitle)),
      );
    }

    final progress = ref.watch(courseProgressControllerProvider)[courseId];
    final nextLesson =
        progress?.nextLesson(course) ?? course.lessons.firstOrNull;
    final fraction = progress?.fractionOf(course) ?? 0;

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
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.courseProgressPercent((fraction * 100).round()),
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    if (progress?.isComplete ?? false)
                      PillBadge(
                        label: l10n.courseCompleted,
                        tone: AppTone.green,
                        icon: Icons.check_circle_rounded,
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                ClipRRect(
                  borderRadius: AppRadius.pillBorder,
                  child: LinearProgressIndicator(
                    value: fraction,
                    minHeight: AppSpacing.xs,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                if (nextLesson != null)
                  LoadingButton(
                    label: (progress?.isStarted ?? false)
                        ? l10n.courseContinue
                        : l10n.courseStart,
                    icon: Icons.play_arrow_rounded,
                    onPressed: () =>
                        context.push(AppRoutes.lesson(courseId, nextLesson.id)),
                  ),
                if (course.grantsCertificate &&
                    (progress?.isComplete ?? false)) ...[
                  const SizedBox(height: AppSpacing.xs),
                  OutlinedButton.icon(
                    onPressed: () =>
                        context.push(AppRoutes.certificate(courseId)),
                    icon: const Icon(Icons.workspace_premium_rounded),
                    label: Text(l10n.certificateSave),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          for (final module in course.modules) ...[
            SectionHeader(
              title: module.title.of(context),
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            ),
            AppCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  for (final lesson in module.lessons)
                    _LessonTile(
                      course: course,
                      lesson: lesson,
                      progress: progress,
                      isLast: lesson == module.lessons.last,
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
          ],
        ],
      ),
    );
  }
}

class _LessonTile extends StatelessWidget {
  const _LessonTile({
    required this.course,
    required this.lesson,
    required this.progress,
    required this.isLast,
  });

  final Course course;
  final Lesson lesson;
  final CourseProgress? progress;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final done = progress?.completedLessonIds.contains(lesson.id) ?? false;
    final number = course.lessonNumber(lesson.id) ?? 1;

    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 16,
            backgroundColor: done
                ? context.colors.secondaryContainer
                : context.palette.surfaceMuted,
            child: done
                ? Icon(
                    Icons.check_rounded,
                    size: 18,
                    color: context.colors.secondary,
                  )
                : Text('$number', style: context.textTheme.labelMedium),
          ),
          title: Text(
            lesson.title.of(context),
            style: context.textTheme.bodyLarge,
          ),
          subtitle: Row(
            children: [
              Text(l10n.contentMinutes(lesson.durationMinutes)),
              if (lesson.isQuiz) ...[
                const SizedBox(width: AppSpacing.xs),
                PillBadge(
                  label: l10n.courseQuizBadge,
                  tone: AppTone.green,
                  icon: Icons.quiz_rounded,
                ),
              ],
            ],
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: () => context.push(AppRoutes.lesson(course.id, lesson.id)),
        ),
        if (!isLast)
          const Divider(
            height: 1,
            indent: AppSpacing.md,
            endIndent: AppSpacing.md,
          ),
      ],
    );
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
