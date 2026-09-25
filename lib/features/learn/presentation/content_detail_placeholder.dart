import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../home/presentation/home_providers.dart';
import 'content_labels.dart';
import 'widgets/content_thumbnail.dart';

/// Stands in for the lesson, article and course screens that step 5 builds.
///
/// It already resolves the item so deep links from the feed and the tip of
/// the day land somewhere meaningful.
class ContentDetailPlaceholder extends ConsumerWidget {
  const ContentDetailPlaceholder({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final library = ref.watch(contentLibraryProvider).value ?? const [];
    final item = library.where((entry) => entry.id == id).firstOrNull;

    return Scaffold(
      appBar: AppBar(title: Text(item?.category.label(l10n) ?? l10n.navLearn)),
      body: item == null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Text(
                  l10n.notFoundTitle,
                  style: context.textTheme.titleMedium,
                ),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                ContentThumbnail(
                  category: item.category,
                  type: item.type,
                  imageUrl: item.imageUrl,
                  height: 180,
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    PillBadge(
                      label: item.type.label(l10n),
                      tone: item.category.tone,
                      icon: item.type.icon,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    PillBadge(
                      label: item.tier.label(l10n),
                      tone: item.isPremium ? AppTone.warning : AppTone.green,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      l10n.contentMinutes(item.durationMinutes),
                      style: context.textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  item.title.of(context),
                  style: context.textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  item.summary.of(context),
                  style: context.textTheme.bodyLarge,
                ),
                const SizedBox(height: AppSpacing.lg),
                FeaturePlaceholder(
                  icon: item.type.icon,
                  title: item.type.label(l10n),
                  description: l10n.learnPlaceholder,
                  tone: item.category.tone,
                ),
                const SizedBox(height: AppSpacing.md),
                const DisclaimerCard(),
              ],
            ),
    );
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
