import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/content_item.dart';
import '../content_labels.dart';
import 'content_thumbnail.dart';

/// Row used by the Learn lists: thumbnail, title, badges and duration.
class ContentListTile extends StatelessWidget {
  const ContentListTile({
    required this.item,
    this.onTap,
    this.isBookmarked = false,
    this.onBookmark,
    this.trailingLabel,
    super.key,
  });

  final ContentItem item;
  final VoidCallback? onTap;
  final bool isBookmarked;
  final VoidCallback? onBookmark;

  /// Extra label, e.g. the pregnancy week.
  final String? trailingLabel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 84,
            child: ContentThumbnail(
              category: item.category,
              type: item.type,
              imageUrl: item.imageUrl,
              height: 72,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title.of(context),
                  style: context.textTheme.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.xxs),
                Wrap(
                  spacing: AppSpacing.xxs,
                  runSpacing: AppSpacing.xxs,
                  children: [
                    PillBadge(
                      label: item.type.label(l10n),
                      tone: item.category.tone,
                      icon: item.type.icon,
                    ),
                    if (item.isPremium)
                      PillBadge(
                        label: l10n.badgePremium,
                        tone: AppTone.warning,
                        icon: Icons.workspace_premium_rounded,
                      ),
                    if (trailingLabel != null)
                      PillBadge(label: trailingLabel!, tone: AppTone.green),
                  ],
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  l10n.contentMinutes(item.durationMinutes),
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
          if (onBookmark != null)
            IconButton(
              tooltip: isBookmarked
                  ? l10n.contentBookmarked
                  : l10n.contentBookmark,
              onPressed: onBookmark,
              icon: Icon(
                isBookmarked
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_border_rounded,
                color: isBookmarked ? context.colors.primary : null,
              ),
            ),
        ],
      ),
    );
  }
}
