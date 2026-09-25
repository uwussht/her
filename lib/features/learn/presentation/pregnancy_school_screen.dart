import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../profile/domain/personalization.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../../tracker/domain/pregnancy_status.dart';
import 'learn_providers.dart';
import 'widgets/content_list_tile.dart';

/// Pregnancy School, week by week, with her current week first.
class PregnancySchoolScreen extends ConsumerWidget {
  const PregnancySchoolScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final items = ref.watch(pregnancySchoolProvider);
    final bookmarks = ref.watch(bookmarksControllerProvider);
    final profile = ref.watch(userProfileControllerProvider);
    final lmp = profile?.lastPeriodStart;
    final currentWeek = profile?.lifeStage == LifeStage.pregnant && lmp != null
        ? PregnancyStatus.fromLastPeriod(lmp, DateTime.now())?.week
        : null;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.categoryPregnancySchool)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: [
          if (currentWeek != null) ...[
            AppCard(
              color: context.colors.secondaryContainer,
              child: Row(
                children: [
                  Icon(
                    Icons.pregnant_woman_rounded,
                    color: context.colors.secondary,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      '${l10n.learnPregnancyThisWeek}: '
                      '${l10n.learnPregnancySchoolWeek(currentWeek)}',
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
          ],
          if (items.isEmpty)
            Text(
              l10n.learnNothingFound,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.palette.textSecondary,
              ),
            )
          else
            for (final item in items)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: ContentListTile(
                  item: item,
                  trailingLabel: item.pregnancyWeek == null
                      ? null
                      : l10n.learnPregnancySchoolWeek(item.pregnancyWeek!),
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
