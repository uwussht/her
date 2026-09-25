import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../home/presentation/home_providers.dart';
import '../../learn/presentation/content_labels.dart';
import '../../learn/presentation/learn_providers.dart';
import '../domain/question.dart';
import 'qa_controller.dart';

/// A question with its answers, the doctor's credentials and upvoting.
class QuestionDetailScreen extends ConsumerWidget {
  const QuestionDetailScreen({required this.questionId, super.key});

  final String questionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final question = ref.watch(questionByIdProvider(questionId));
    if (question == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.notFoundTitle)),
      );
    }

    final localeTag = ref.watch(localeTagProvider);
    final upvoted = ref
        .watch(qaControllerProvider)
        .upvotedQuestionIds
        .contains(questionId);

    return Scaffold(
      appBar: AppBar(title: Text(question.category.label(l10n))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.xl,
        ),
        children: [
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xxs,
            children: [
              PillBadge(
                label: question.category.label(l10n),
                tone: question.category.tone,
                icon: question.category.icon,
              ),
              if (question.priority)
                PillBadge(
                  label: l10n.qaPriorityBadge,
                  tone: AppTone.warning,
                  icon: Icons.bolt_rounded,
                ),
              if (question.isAnonymous)
                PillBadge(
                  label: l10n.qaAnonymous,
                  tone: AppTone.green,
                  icon: Icons.visibility_off_rounded,
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(question.body.of(context), style: context.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.qaAskedOn(
              DateFormat.yMMMd(localeTag).format(question.askedAt),
            ),
            style: context.textTheme.labelSmall,
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () async {
                  await ref
                      .read(qaControllerProvider.notifier)
                      .toggleUpvote(questionId);
                },
                icon: Icon(
                  upvoted ? Icons.thumb_up_rounded : Icons.thumb_up_outlined,
                ),
                label: Text('${l10n.qaUpvote} · ${question.upvotes}'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: upvoted
                      ? context.colors.primary
                      : context.palette.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          if (!question.isAnswered)
            AppCard(
              color: context.palette.warningContainer,
              child: Row(
                children: [
                  Icon(
                    Icons.hourglass_empty_rounded,
                    color: context.palette.warning,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      l10n.qaAwaitingAnswer,
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            )
          else
            for (final answer in question.answers)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: _AnswerCard(answer: answer, localeTag: localeTag),
              ),
          const SizedBox(height: AppSpacing.md),
          DisclaimerCard(text: l10n.qaDisclaimer),
        ],
      ),
    );
  }
}

class _AnswerCard extends ConsumerWidget {
  const _AnswerCard({required this.answer, required this.localeTag});

  final Answer answer;
  final String localeTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final expert = ref.watch(expertByIdProvider(answer.expertId));

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const IconBubble(
                icon: Icons.medical_services_rounded,
                tone: AppTone.green,
                size: 44,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            expert?.name ?? l10n.badgeVerifiedDoctor,
                            style: context.textTheme.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (expert?.verified ?? true) ...[
                          const SizedBox(width: AppSpacing.xxs),
                          Icon(
                            Icons.verified_rounded,
                            size: AppSizes.iconSm,
                            color: context.colors.secondary,
                          ),
                        ],
                      ],
                    ),
                    if (expert != null)
                      Text(
                        expert.city == null
                            ? expert.specialty.of(context)
                            : l10n.qaExpertOf(
                                expert.specialty.of(context),
                                expert.city!,
                              ),
                        style: context.textTheme.bodySmall,
                      ),
                    if (expert?.yearsOfPractice case final years?)
                      Text(
                        l10n.qaYearsOfPractice(years),
                        style: context.textTheme.labelSmall,
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(answer.body.of(context), style: context.textTheme.bodyLarge),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.qaAnsweredOn(
              DateFormat.yMMMd(localeTag).format(answer.answeredAt),
            ),
            style: context.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
