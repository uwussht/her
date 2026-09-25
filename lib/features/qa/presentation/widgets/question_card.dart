import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../home/presentation/home_providers.dart';
import '../../../learn/presentation/content_labels.dart';
import '../../domain/question.dart';

/// A Q&A entry: the question, its top answer and the doctor's badge.
class QuestionCard extends ConsumerWidget {
  const QuestionCard({required this.question, this.onTap, super.key});

  final Question question;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final answer = question.topAnswer;
    final expert = ref.watch(expertByIdProvider(answer?.expertId));

    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PillBadge(
                label: question.category.label(l10n),
                tone: question.category.tone,
                icon: question.category.icon,
              ),
              const Spacer(),
              Icon(
                Icons.arrow_upward_rounded,
                size: 14,
                color: context.colors.primary,
              ),
              const SizedBox(width: 2),
              Text(
                '${question.upvotes}',
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            question.body.of(context),
            style: context.textTheme.titleSmall,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.xs),
          if (answer == null)
            PillBadge(
              label: l10n.qaAwaitingAnswer,
              tone: AppTone.warning,
              icon: Icons.hourglass_empty_rounded,
            )
          else ...[
            Row(
              children: [
                Icon(
                  Icons.verified_rounded,
                  size: AppSizes.iconSm,
                  color: context.colors.secondary,
                ),
                const SizedBox(width: AppSpacing.xxs),
                Expanded(
                  child: Text(
                    expert == null
                        ? l10n.badgeVerifiedDoctor
                        : l10n.qaAnsweredBy(expert.name),
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colors.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              answer.body.of(context),
              style: context.textTheme.bodySmall,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
