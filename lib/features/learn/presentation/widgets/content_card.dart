import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/content_item.dart';
import '../content_labels.dart';
import 'content_thumbnail.dart';

/// Content card used in the "For you" carousel and the Learn lists.
class ContentCard extends StatelessWidget {
  const ContentCard({required this.item, this.onTap, this.width, super.key});

  final ContentItem item;
  final VoidCallback? onTap;

  /// Set in horizontal carousels; null makes the card fill its parent.
  final double? width;

  static const double carouselWidth = 220;
  static const double carouselHeight = 248;

  /// Cover height inside a carousel card, leaving room for two lines of
  /// title and two of summary.
  static const double coverHeight = 104;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: width,
      child: AppCard(
        onTap: onTap,
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ContentThumbnail(
                  category: item.category,
                  type: item.type,
                  imageUrl: item.imageUrl,
                  height: coverHeight,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppRadius.card),
                  ),
                ),
                Positioned(
                  top: AppSpacing.xs,
                  left: AppSpacing.xs,
                  child: PillBadge(
                    label: item.type.label(l10n),
                    tone: item.category.tone,
                    icon: item.type.icon,
                  ),
                ),
                Positioned(
                  top: AppSpacing.xs,
                  right: AppSpacing.xs,
                  child: PillBadge(
                    label: item.tier.label(l10n),
                    tone: item.isPremium ? AppTone.warning : AppTone.green,
                    icon: item.isPremium
                        ? Icons.workspace_premium_rounded
                        : null,
                  ),
                ),
              ],
            ),
            // Flexible so a long title or a large text scale shortens the
            // summary instead of overflowing the card.
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        item.title.of(context),
                        style: context.textTheme.titleSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Flexible(
                      child: Text(
                        item.summary.of(context),
                        style: context.textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule_rounded,
                          size: 14,
                          color: context.palette.textSecondary,
                        ),
                        const SizedBox(width: AppSpacing.xxs),
                        Text(
                          l10n.contentMinutes(item.durationMinutes),
                          style: context.textTheme.labelSmall,
                        ),
                        const Spacer(),
                        Text(
                          item.category.label(l10n),
                          style: context.textTheme.labelSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
