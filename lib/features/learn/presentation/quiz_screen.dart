import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../home/presentation/home_providers.dart';
import '../domain/course.dart';
import 'learn_providers.dart';

/// A lesson quiz: one question at a time, with feedback and a result.
class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({required this.courseId, required this.lessonId, super.key});

  final String courseId;
  final String lessonId;

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  int _index = 0;
  int? _selected;
  bool _checked = false;
  int _correct = 0;
  bool _finished = false;

  void _restart() => setState(() {
    _index = 0;
    _selected = null;
    _checked = false;
    _correct = 0;
    _finished = false;
  });

  void _check(QuizQuestion question) {
    setState(() {
      _checked = true;
      if (_selected == question.correctIndex) _correct++;
    });
  }

  void _next(int total) {
    if (_index + 1 >= total) {
      setState(() => _finished = true);
      return;
    }
    setState(() {
      _index++;
      _selected = null;
      _checked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final course = ref.watch(courseByIdProvider(widget.courseId));
    final lesson = course?.lessonById(widget.lessonId);
    if (course == null || lesson == null || lesson.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.notFoundTitle)),
      );
    }

    final total = lesson.questions.length;
    if (_finished) {
      return _Result(
        course: course,
        lessonId: widget.lessonId,
        correct: _correct,
        total: total,
        onRetry: _restart,
      );
    }

    final question = lesson.questions[_index];
    return Scaffold(
      appBar: AppBar(title: Text(l10n.quizTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.xl,
        ),
        children: [
          StepProgress(step: _index + 1, total: total),
          const SizedBox(height: AppSpacing.lg),
          Text(
            question.question.of(context),
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.lg),
          for (var i = 0; i < question.options.length; i++) ...[
            _AnswerOption(
              label: question.options[i].of(context),
              selected: _selected == i,
              state: !_checked
                  ? _AnswerState.idle
                  : (i == question.correctIndex
                        ? _AnswerState.correct
                        : (_selected == i
                              ? _AnswerState.wrong
                              : _AnswerState.idle)),
              onTap: _checked ? null : () => setState(() => _selected = i),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
          if (_checked) ...[
            const SizedBox(height: AppSpacing.xs),
            AppCard(
              elevated: false,
              color: _selected == question.correctIndex
                  ? context.palette.successContainer
                  : context.palette.warningContainer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selected == question.correctIndex
                        ? l10n.quizCorrect
                        : l10n.quizWrong,
                    style: context.textTheme.titleSmall,
                  ),
                  if (question.explanation case final explanation?) ...[
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      explanation.of(context),
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.lg),
          LoadingButton(
            label: _checked
                ? (_index + 1 >= total ? l10n.quizFinish : l10n.quizNext)
                : l10n.quizCheck,
            onPressed: _checked
                ? () => _next(total)
                : (_selected == null ? null : () => _check(question)),
          ),
        ],
      ),
    );
  }
}

enum _AnswerState { idle, correct, wrong }

class _AnswerOption extends StatelessWidget {
  const _AnswerOption({
    required this.label,
    required this.selected,
    required this.state,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final _AnswerState state;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final (Color border, Color? fill, IconData? icon) = switch (state) {
      _AnswerState.correct => (
        context.colors.secondary,
        context.palette.successContainer,
        Icons.check_circle_rounded,
      ),
      _AnswerState.wrong => (
        context.colors.error,
        context.colors.errorContainer,
        Icons.cancel_rounded,
      ),
      _AnswerState.idle => (
        selected ? context.colors.primary : context.colors.outlineVariant,
        selected ? context.colors.primaryContainer : null,
        null,
      ),
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: fill ?? context.colors.surface,
        borderRadius: AppRadius.cardBorder,
        border: Border.all(
          color: border,
          width: selected || icon != null ? 2 : 1,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: AppRadius.cardBorder,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Expanded(
                  child: Text(label, style: context.textTheme.bodyLarge),
                ),
                if (icon != null) Icon(icon, color: border),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Result extends ConsumerWidget {
  const _Result({
    required this.course,
    required this.lessonId,
    required this.correct,
    required this.total,
    required this.onRetry,
  });

  final Course course;
  final String lessonId;
  final int correct;
  final int total;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final passed = correct / total >= Lesson.passMark;
    final next = course.lessonAfter(lessonId);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.quizResultTitle)),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            const Spacer(),
            IconBubble(
              icon: passed ? Icons.emoji_events_rounded : Icons.refresh_rounded,
              tone: passed ? AppTone.green : AppTone.warning,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              passed ? l10n.quizPassed : l10n.quizFailed,
              style: context.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.quizScore(correct, total),
              style: context.textTheme.titleMedium?.copyWith(
                color: context.palette.textSecondary,
              ),
            ),
            const Spacer(),
            if (passed)
              LoadingButton(
                label: next == null ? l10n.courseFinish : l10n.courseNext,
                onPressed: () async {
                  await ref
                      .read(courseProgressControllerProvider.notifier)
                      .completeLesson(course: course, lessonId: lessonId);
                  if (!context.mounted) return;
                  if (next == null) {
                    context.pop();
                  } else {
                    context.pushReplacement(
                      AppRoutes.lesson(course.id, next.id),
                    );
                  }
                },
              )
            else
              LoadingButton(label: l10n.quizRetry, onPressed: onRetry),
            const SizedBox(height: AppSpacing.xs),
            TextButton(
              onPressed: () => context.pop(),
              child: Text(l10n.actionClose),
            ),
          ],
        ),
      ),
    );
  }
}
