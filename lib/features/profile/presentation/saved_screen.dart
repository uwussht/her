import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../home/presentation/home_providers.dart';
import '../../learn/presentation/learn_providers.dart';
import '../../learn/presentation/widgets/content_list_tile.dart';

/// Everything she bookmarked in Learn.
class SavedScreen extends ConsumerWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final bookmarks = ref.watch(bookmarksControllerProvider);
    final library = ref.watch(contentLibraryProvider).value ?? const [];
    final saved = [
      for (final item in library)
        if (bookmarks.contains(item.id)) item,
    ];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileSaved)),
      body: saved.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: FeaturePlaceholder(
                icon: Icons.bookmark_border_rounded,
                title: l10n.profileSaved,
                description: l10n.savedEmpty,
              ),
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.xs,
                AppSpacing.md,
                AppSpacing.lg,
              ),
              children: [
                for (final item in saved)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                    child: ContentListTile(
                      item: item,
                      isBookmarked: true,
                      onBookmark: () => ref
                          .read(bookmarksControllerProvider.notifier)
                          .toggle(item.id),
                      onTap: () => context.push(AppRoutes.learnItem(item.id)),
                    ),
                  ),
              ],
            ),
    );
  }
}
