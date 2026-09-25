import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../home/presentation/home_providers.dart';
import '../../premium/presentation/premium_controller.dart';
import '../../premium/presentation/premium_gate_sheet.dart';
import '../../shop/domain/product.dart';
import '../../shop/presentation/widgets/product_card.dart';
import '../domain/content_item.dart';
import 'content_labels.dart';
import 'learn_providers.dart';
import 'widgets/article_body.dart';
import 'widgets/content_thumbnail.dart';
import 'widgets/expert_byline.dart';
import 'widgets/lesson_video_player.dart';

/// An article, a video lesson or a course landing page.
class ContentDetailScreen extends ConsumerWidget {
  const ContentDetailScreen({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final item = ref.watch(contentByIdProvider(id));
    final isLoading = ref.watch(contentLibraryProvider).isLoading;

    if (item == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: isLoading
                ? const SkeletonCard()
                : Text(
                    l10n.notFoundTitle,
                    style: context.textTheme.titleMedium,
                  ),
          ),
        ),
      );
    }

    // A course entry opens the course player instead of an article.
    if (item.type == ContentType.course && item.courseId != null) {
      return _CourseIntro(item: item);
    }
    return _ArticleOrVideo(item: item);
  }
}

/// Shared chrome: bookmark action, badges, byline and related products.
class _DetailScaffold extends ConsumerWidget {
  const _DetailScaffold({required this.item, required this.children});

  final ContentItem item;
  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final bookmarks = ref.watch(bookmarksControllerProvider);
    final isBookmarked = bookmarks.contains(item.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.category.label(l10n)),
        actions: [
          IconButton(
            tooltip: isBookmarked
                ? l10n.contentBookmarked
                : l10n.contentBookmark,
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final added = await ref
                  .read(bookmarksControllerProvider.notifier)
                  .toggle(item.id);
              messenger
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      added
                          ? l10n.contentBookmarked
                          : l10n.contentBookmarkRemoved,
                    ),
                  ),
                );
            },
            icon: Icon(
              isBookmarked
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_border_rounded,
              color: isBookmarked ? context.colors.primary : null,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.xl,
        ),
        children: [
          ...children,
          const SizedBox(height: AppSpacing.md),
          _RelatedProducts(item: item),
          const SizedBox(height: AppSpacing.md),
          const DisclaimerCard(),
        ],
      ),
    );
  }
}

/// Title block shared by articles, videos and courses.
class _Header extends StatelessWidget {
  const _Header({required this.item});

  final ContentItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xxs,
          children: [
            PillBadge(
              label: item.type.label(l10n),
              tone: item.category.tone,
              icon: item.type.icon,
            ),
            PillBadge(
              label: item.tier.label(l10n),
              tone: item.isPremium ? AppTone.warning : AppTone.green,
              icon: item.isPremium ? Icons.workspace_premium_rounded : null,
            ),
            PillBadge(
              label: l10n.contentMinutes(item.durationMinutes),
              tone: AppTone.pink,
              icon: Icons.schedule_rounded,
            ),
            if (item.isAdultOnly)
              PillBadge(label: l10n.badgeAdultOnly, tone: AppTone.warning),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(item.title.of(context), style: context.textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.xs),
        Text(
          item.summary.of(context),
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.palette.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ExpertByline(expertId: item.expertId),
      ],
    );
  }
}

class _ArticleOrVideo extends ConsumerWidget {
  const _ArticleOrVideo({required this.item});

  final ContentItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locked = item.isPremium && !ref.watch(hasPremiumProvider);

    return _DetailScaffold(
      item: item,
      children: [
        if (item.isPlayable && !locked)
          LessonVideoPlayer(url: item.videoUrl!)
        else
          ContentThumbnail(
            category: item.category,
            type: item.type,
            imageUrl: item.imageUrl,
            height: 180,
          ),
        const SizedBox(height: AppSpacing.md),
        _Header(item: item),
        const SizedBox(height: AppSpacing.lg),
        if (locked)
          _PremiumLock(item: item)
        else if (item.hasBody)
          ArticleBody(paragraphs: item.body)
        else if (!item.isPlayable)
          Text(
            l10n.videoNoSource,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.palette.textSecondary,
            ),
          ),
      ],
    );
  }
}

/// Course landing page: modules, progress and the way in.
class _CourseIntro extends ConsumerWidget {
  const _CourseIntro({required this.item});

  final ContentItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final course = ref.watch(courseByIdProvider(item.courseId));
    final locked = item.isPremium && !ref.watch(hasPremiumProvider);
    final progress = course == null
        ? null
        : ref.watch(courseProgressControllerProvider)[course.id];

    return _DetailScaffold(
      item: item,
      children: [
        ContentThumbnail(
          category: item.category,
          type: item.type,
          imageUrl: item.imageUrl,
          height: 180,
        ),
        const SizedBox(height: AppSpacing.md),
        _Header(item: item),
        const SizedBox(height: AppSpacing.md),
        if (course != null)
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xxs,
            children: [
              PillBadge(
                label: l10n.courseModulesCount(course.modules.length),
                tone: AppTone.green,
                icon: Icons.view_module_rounded,
              ),
              PillBadge(
                label: l10n.courseLessonsCount(course.lessonCount),
                tone: AppTone.green,
                icon: Icons.play_lesson_rounded,
              ),
              PillBadge(
                label: l10n.courseTotalTime(course.totalMinutes),
                tone: AppTone.pink,
                icon: Icons.schedule_rounded,
              ),
            ],
          ),
        const SizedBox(height: AppSpacing.lg),
        if (locked)
          _PremiumLock(item: item)
        else if (course != null)
          LoadingButton(
            label: progress?.isComplete ?? false
                ? l10n.courseRestart
                : (progress?.isStarted ?? false
                      ? l10n.courseContinue
                      : l10n.courseStart),
            icon: Icons.school_rounded,
            onPressed: () => context.push(AppRoutes.course(course.id)),
          ),
      ],
    );
  }
}

/// Premium lock shown in place of the body.
class _PremiumLock extends StatelessWidget {
  const _PremiumLock({required this.item});

  final ContentItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      color: context.palette.warningContainer,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          const IconBubble(
            icon: Icons.workspace_premium_rounded,
            tone: AppTone.warning,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.premiumGateTitle,
            style: context.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.premiumGateBody,
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          LoadingButton(
            label: l10n.premiumGateOpen,
            onPressed: () => PremiumGateSheet.show(context),
          ),
        ],
      ),
    );
  }
}

/// Products tied to this item, e.g. the Hospital Bag Bundle on the
/// hospital-bag article.
class _RelatedProducts extends ConsumerWidget {
  const _RelatedProducts({required this.item});

  final ContentItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final all = ref.watch(productsProvider).value ?? const <Product>[];
    final related = [
      for (final product in all)
        if (product.relatedContentId == item.id) product,
    ];
    if (related.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.contentRelatedProducts,
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
        ),
        SizedBox(
          height: ProductCard.carouselHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: related.length,
            clipBehavior: Clip.none,
            separatorBuilder: (context, _) =>
                const SizedBox(width: AppSpacing.sm),
            itemBuilder: (context, index) => ProductCard(
              product: related[index],
              width: ProductCard.carouselWidth,
              onTap: () => context.go(AppRoutes.shop),
            ),
          ),
        ),
      ],
    );
  }
}
