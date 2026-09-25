import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/home_feed.dart';

/// "Continue course" card: progress bar and the next lesson.
class ContinueCourseTile extends StatelessWidget {
  const ContinueCourseTile({required this.card, this.onTap, super.key});

  final ContinueCourseCard card;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final percent = (card.fraction * 100).round();

    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const IconBubble(icon: Icons.school_rounded, size: 44),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.course.title.of(context),
                      style: context.textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.courseLessonsCount(card.course.lessonCount),
                      style: context.textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
              if (card.content.isPremium)
                PillBadge(
                  label: l10n.badgePremium,
                  tone: AppTone.warning,
                  icon: Icons.workspace_premium_rounded,
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          if (card.isStarted) ...[
            ClipRRect(
              borderRadius: AppRadius.pillBorder,
              child: LinearProgressIndicator(
                value: card.fraction,
                minHeight: AppSpacing.xs,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.courseProgressPercent(percent),
              style: context.textTheme.labelMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
          ],
          Text(
            l10n.courseNextLesson(card.nextLesson.title.of(context)),
            style: context.textTheme.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
