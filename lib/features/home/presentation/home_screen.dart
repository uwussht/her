import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/utils/greeting_period.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/presentation/widgets/content_card.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../../qa/presentation/widgets/question_card.dart';
import '../../shop/presentation/widgets/product_card.dart';
import '../../tracker/presentation/tracker_providers.dart';
import '../../tracker/presentation/widgets/cycle_status_card.dart';
import '../../tracker/presentation/widgets/daily_log_sheet.dart';
import '../domain/home_feed.dart';
import 'home_providers.dart';
import 'widgets/continue_course_card.dart';
import 'widgets/daily_tip_card.dart';
import 'widgets/horizontal_carousel.dart';
import 'widgets/pregnancy_status_card.dart';

/// The home tab: greeting, today's status, and personalised sections.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final feed = ref.watch(homeFeedProvider);
    final timeline = ref.watch(cycleTimelineProvider);
    final profile = ref.watch(userProfileControllerProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.only(bottom: AppSizes.fabClearance),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.md,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _greeting(
                      l10n,
                      GreetingPeriod.fromHour(DateTime.now().hour),
                    ),
                    style: context.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    l10n.homeSubtitle,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.palette.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  // Today's status: pregnancy week, or the cycle card.
                  if (feed?.pregnancy case final pregnancy?)
                    PregnancyStatusCard(
                      status: pregnancy,
                      babySize: feed?.babySize,
                      onTap: () => context.go(AppRoutes.tracker),
                    )
                  else if (timeline.hasData)
                    CycleStatusCard(
                      timeline: timeline,
                      onLogToday: () =>
                          DailyLogSheet.show(context, DateTime.now()),
                    )
                  else
                    FeaturePlaceholderAction(
                      icon: Icons.water_drop_rounded,
                      title: l10n.trackerEmptyTitle,
                      description: l10n.trackerEmptyBody,
                      actionLabel: l10n.trackerMarkPeriodStart,
                      onAction: () => context.go(AppRoutes.tracker),
                    ),
                ],
              ),
            ),

            if (feed == null)
              const _FeedSkeleton()
            else
              ..._sections(
                context,
                ref,
                feed,
                profileHasStage: profile != null,
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _sections(
    BuildContext context,
    WidgetRef ref,
    HomeFeed feed, {
    required bool profileHasStage,
  }) {
    final l10n = context.l10n;
    return [
      if (feed.tip case final tip?) ...[
        SectionHeader(title: l10n.homeTipOfDay),
        Padding(
          padding: AppSpacing.screen,
          child: DailyTipCard(
            tip: tip,
            onTap: tip.contentId == null
                ? null
                : () => context.push(AppRoutes.learnItem(tip.contentId!)),
          ),
        ),
      ],

      if (feed.forYou.isNotEmpty) ...[
        SectionHeader(
          title: l10n.homeForYou,
          actionLabel: l10n.homeSeeAll,
          onAction: () => context.go(AppRoutes.learn),
        ),
        HorizontalCarousel(
          height: ContentCard.carouselHeight,
          itemCount: feed.forYou.length,
          itemBuilder: (context, index) {
            final item = feed.forYou[index];
            return ContentCard(
              item: item,
              width: ContentCard.carouselWidth,
              onTap: () => context.push(AppRoutes.learnItem(item.id)),
            );
          },
        ),
      ],

      if (feed.continueCourse case final card?) ...[
        SectionHeader(
          title: card.isStarted
              ? l10n.homeContinueCourse
              : l10n.homeStartCourse,
        ),
        Padding(
          padding: AppSpacing.screen,
          child: ContinueCourseTile(
            card: card,
            onTap: () => context.push(AppRoutes.learnItem(card.content.id)),
          ),
        ),
      ],

      if (feed.offers.isNotEmpty) ...[
        SectionHeader(
          title: _offerHeading(l10n, feed.offerReason),
          actionLabel: l10n.homeSeeAll,
          onAction: () => context.go(AppRoutes.shop),
        ),
        HorizontalCarousel(
          height: ProductCard.carouselHeight,
          itemCount: feed.offers.length,
          itemBuilder: (context, index) => ProductCard(
            product: feed.offers[index],
            width: ProductCard.carouselWidth,
            onTap: () => context.go(AppRoutes.shop),
          ),
        ),
      ],

      if (feed.trendingQuestions.isNotEmpty) ...[
        SectionHeader(
          title: l10n.homeTrendingQa,
          actionLabel: l10n.homeSeeAll,
          onAction: () => context.go(AppRoutes.learn),
        ),
        for (final question in feed.trendingQuestions)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              0,
              AppSpacing.md,
              AppSpacing.sm,
            ),
            child: QuestionCard(question: question),
          ),
      ],

      if (feed.isEmpty)
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Text(
            l10n.homeFeedEmpty,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.palette.textSecondary,
            ),
          ),
        ),

      const SizedBox(height: AppSpacing.md),
      const Padding(padding: AppSpacing.screen, child: DisclaimerCard()),
    ];
  }

  static String _greeting(AppLocalizations l10n, GreetingPeriod period) {
    return switch (period) {
      GreetingPeriod.morning => l10n.greetingMorning,
      GreetingPeriod.afternoon => l10n.greetingAfternoon,
      GreetingPeriod.evening => l10n.greetingEvening,
    };
  }

  static String _offerHeading(AppLocalizations l10n, OfferReason reason) {
    return switch (reason) {
      OfferReason.periodSoon => l10n.offerHeadingPeriodSoon,
      OfferReason.periodNow => l10n.offerHeadingPeriodNow,
      OfferReason.fertileWindow => l10n.offerHeadingFertile,
      OfferReason.pregnancy => l10n.offerHeadingPregnancy,
      OfferReason.postpartum => l10n.offerHeadingPostpartum,
      OfferReason.menopause => l10n.offerHeadingMenopause,
      OfferReason.teen => l10n.offerHeadingTeen,
      OfferReason.general => l10n.offerHeadingGeneral,
    };
  }
}

/// Placeholder layout shown while the catalogue loads.
class _FeedSkeleton extends StatelessWidget {
  const _FeedSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.md,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.homeLoading,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.palette.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const SkeletonBox(height: 72, borderRadius: AppRadius.cardBorder),
          const SizedBox(height: AppSpacing.md),
          const Row(
            children: [
              Expanded(child: SkeletonCard()),
              SizedBox(width: AppSpacing.sm),
              Expanded(child: SkeletonCard()),
            ],
          ),
        ],
      ),
    );
  }
}
