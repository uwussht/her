import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../home/presentation/home_providers.dart';
import '../domain/content_item.dart';
import '../domain/learn_filter.dart';
import 'content_labels.dart';
import 'learn_providers.dart';
import 'widgets/age_gate_dialog.dart';
import 'widgets/content_list_tile.dart';

/// The Learn tab: categories, search, filters and the library list.
class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key});

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen> {
  final _search = TextEditingController();

  /// She only confirms her age once per visit to the tab.
  bool _adultConfirmed = false;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  LearnFilterController get _filters =>
      ref.read(learnFilterControllerProvider.notifier);

  Future<void> _selectCategory(ContentCategory? category) async {
    if (category != null && category.isAdultOnly && !_adultConfirmed) {
      final confirmed = await AgeGateDialog.confirm(context);
      if (!confirmed) return;
      _adultConfirmed = true;
    }
    _filters.setCategory(category);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final filter = ref.watch(learnFilterControllerProvider);
    final categories = ref.watch(visibleCategoriesProvider);
    final results = ref.watch(learnResultsProvider);
    final bookmarks = ref.watch(bookmarksControllerProvider);
    final isLoading = ref.watch(contentLibraryProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navLearn),
        actions: [
          IconButton(
            tooltip: l10n.qaTitle,
            onPressed: () => context.push(AppRoutes.qa),
            icon: const Icon(Icons.forum_outlined),
          ),
          IconButton(
            tooltip: l10n.learnBookmarked,
            onPressed: _filters.toggleBookmarkedOnly,
            icon: Icon(
              filter.bookmarkedOnly
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_border_rounded,
              color: filter.bookmarkedOnly ? context.colors.primary : null,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: AppSizes.fabClearance),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.xs,
              AppSpacing.md,
              0,
            ),
            child: TextField(
              controller: _search,
              onChanged: _filters.setQuery,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: l10n.learnSearchHint,
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: filter.query.isEmpty
                    ? null
                    : IconButton(
                        tooltip: l10n.actionClose,
                        onPressed: () {
                          _search.clear();
                          _filters.setQuery('');
                        },
                        icon: const Icon(Icons.close_rounded),
                      ),
              ),
            ),
          ),

          SectionHeader(title: l10n.learnCategories),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: AppSpacing.screen,
            child: Row(
              children: [
                ChoiceChip(
                  label: Text(l10n.learnAll),
                  selected: filter.category == null,
                  onSelected: (_) => _selectCategory(null),
                ),
                for (final category in categories) ...[
                  const SizedBox(width: AppSpacing.xs),
                  ChoiceChip(
                    avatar: Icon(category.icon, size: 18),
                    label: Text(category.label(l10n)),
                    selected: filter.category == category,
                    onSelected: (_) => _selectCategory(category),
                  ),
                ],
              ],
            ),
          ),

          // Pregnancy School is week-based, so it gets its own entry point.
          if (filter.category == ContentCategory.pregnancySchool ||
              filter.category == null)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                0,
              ),
              child: AppCard(
                padding: EdgeInsets.zero,
                child: ListTile(
                  leading: const Icon(Icons.pregnant_woman_rounded),
                  title: Text(l10n.categoryPregnancySchool),
                  subtitle: Text(l10n.learnPregnancyThisWeek),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push(AppRoutes.pregnancySchool),
                ),
              ),
            ),

          _FilterRow(filter: filter),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.xs,
              AppSpacing.md,
              AppSpacing.xs,
            ),
            child: Text(
              l10n.learnResultsCount(results.length),
              style: context.textTheme.labelMedium,
            ),
          ),

          if (isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Column(
                children: [
                  SkeletonCard(imageHeight: 72),
                  SizedBox(height: AppSpacing.sm),
                  SkeletonCard(imageHeight: 72),
                ],
              ),
            )
          else if (results.isEmpty)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                children: [
                  Text(
                    l10n.learnNothingFound,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.palette.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (filter.isActive) ...[
                    const SizedBox(height: AppSpacing.sm),
                    TextButton(
                      onPressed: () {
                        _search.clear();
                        _filters.clear();
                      },
                      child: Text(l10n.learnClearFilters),
                    ),
                  ],
                ],
              ),
            )
          else
            for (final item in results)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  0,
                  AppSpacing.md,
                  AppSpacing.sm,
                ),
                child: ContentListTile(
                  item: item,
                  isBookmarked: bookmarks.contains(item.id),
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

/// Type, price and sort filters.
class _FilterRow extends ConsumerWidget {
  const _FilterRow({required this.filter});

  final LearnFilter filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final controller = ref.read(learnFilterControllerProvider.notifier);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        0,
      ),
      child: Row(
        children: [
          for (final type in ContentType.values) ...[
            FilterChip(
              avatar: Icon(type.icon, size: 18),
              label: Text(type.label(l10n)),
              selected: filter.type == type,
              onSelected: (selected) =>
                  controller.setType(selected ? type : null),
            ),
            const SizedBox(width: AppSpacing.xs),
          ],
          FilterChip(
            label: Text(l10n.learnFreeOnly),
            selected: filter.freeOnly,
            onSelected: (_) => controller.toggleFreeOnly(),
          ),
          const SizedBox(width: AppSpacing.xs),
          PopupMenuButton<LearnSort>(
            initialValue: filter.sort,
            onSelected: controller.setSort,
            tooltip: l10n.learnSortLabel,
            itemBuilder: (context) => [
              for (final sort in LearnSort.values)
                PopupMenuItem(value: sort, child: Text(_sortLabel(l10n, sort))),
            ],
            child: Chip(
              avatar: const Icon(Icons.sort_rounded, size: 18),
              label: Text(_sortLabel(l10n, filter.sort)),
            ),
          ),
        ],
      ),
    );
  }

  static String _sortLabel(AppLocalizations l10n, LearnSort sort) {
    return switch (sort) {
      LearnSort.recommended => l10n.learnSortRecommended,
      LearnSort.newest => l10n.learnSortNewest,
      LearnSort.popular => l10n.learnSortPopular,
      LearnSort.shortest => l10n.learnSortShortest,
    };
  }
}
