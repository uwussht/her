import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../home/presentation/home_providers.dart';
import '../../learn/presentation/learn_providers.dart';
import '../domain/product.dart';
import '../domain/review.dart';
import '../../profile/domain/personalization.dart';
import '../../tracker/presentation/tracker_providers.dart';
import '../domain/subscription.dart';
import 'product_labels.dart';
import 'shop_labels.dart';
import 'shop_providers.dart';
import 'widgets/cart_badge.dart';
import 'widgets/quantity_stepper.dart';

/// Product page: photos, description, reviews, seller and "Add to cart".
class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({required this.productId, super.key});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);
    final product = ref.watch(productByIdProvider(productId));
    if (product == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ref.watch(productsProvider).isLoading
              ? const Padding(
                  padding: EdgeInsets.all(AppSpacing.md),
                  child: SkeletonCard(),
                )
              : Text(l10n.notFoundTitle),
        ),
      );
    }

    final inCart = ref.watch(cartControllerProvider).quantityOf(productId);
    final reviews = ref.watch(reviewsForProductProvider(productId));
    final isBox = product.category == ProductCategory.subscriptionBox;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.category.label(l10n)),
        actions: const [CartBadge()],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.xl,
        ),
        children: [
          _Gallery(product: product),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xxs,
            children: [
              if (product.isBundle)
                PillBadge(
                  label: l10n.badgeBundle,
                  tone: AppTone.green,
                  icon: Icons.inventory_2_rounded,
                ),
              if (isBox)
                PillBadge(
                  label: l10n.badgeSubscription,
                  tone: AppTone.green,
                  icon: Icons.autorenew_rounded,
                ),
              if (!product.inStock)
                PillBadge(label: l10n.shopOutOfStock, tone: AppTone.warning),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            product.title.of(context),
            style: context.textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSpacing.xs),
          _RatingRow(product: product, reviewCount: reviews.length),
          const SizedBox(height: AppSpacing.md),
          _PriceBlock(product: product),
          const SizedBox(height: AppSpacing.lg),

          if (isBox)
            _SubscriptionPanel(product: product)
          else
            _AddToCart(product: product, inCart: inCart),

          const SizedBox(height: AppSpacing.lg),
          Text(l10n.productDescription, style: context.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.xs),
          Text(
            product.description.of(context),
            style: context.textTheme.bodyLarge?.copyWith(height: 1.5),
          ),

          if (product.isBundle) ...[
            const SizedBox(height: AppSpacing.lg),
            Text(
              l10n.productBundleContents,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            _BundleContents(product: product),
          ],

          const SizedBox(height: AppSpacing.lg),
          _SellerCard(sellerId: product.sellerId),

          if (product.relatedContentId case final contentId?) ...[
            const SizedBox(height: AppSpacing.lg),
            _RelatedContent(contentId: contentId),
          ],

          const SizedBox(height: AppSpacing.lg),
          Text(
            '${l10n.productReviewsTitle} · ${reviews.length}',
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.xs),
          if (reviews.isEmpty)
            Text(
              l10n.productNoReviews,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.palette.textSecondary,
              ),
            )
          else
            for (final review in reviews)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: _ReviewTile(review: review, locale: locale),
              ),
        ],
      ),
    );
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final images = product.imageUrls;
    if (images.isEmpty) {
      return ClipRRect(
        borderRadius: AppRadius.cardBorder,
        child: SizedBox(
          height: 220,
          width: double.infinity,
          child: ColoredBox(
            color: context.palette.surfaceMuted,
            child: Center(
              child: Icon(
                product.category.icon,
                size: 64,
                color: context.colors.secondary,
              ),
            ),
          ),
        ),
      );
    }
    return SizedBox(
      height: 220,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: AppRadius.cardBorder,
          child: CachedNetworkImage(
            imageUrl: images[index],
            fit: BoxFit.cover,
            placeholder: (context, _) => const SkeletonBox(
              height: 220,
              borderRadius: AppRadius.cardBorder,
            ),
            errorWidget: (context, _, _) => ColoredBox(
              color: context.palette.surfaceMuted,
              child: Center(child: Icon(product.category.icon, size: 64)),
            ),
          ),
        ),
      ),
    );
  }
}

class _RatingRow extends StatelessWidget {
  const _RatingRow({required this.product, required this.reviewCount});

  final Product product;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: [
        Icon(Icons.star_rounded, size: 18, color: context.palette.warning),
        const SizedBox(width: 2),
        Text(
          product.rating.toStringAsFixed(1),
          style: context.textTheme.titleSmall,
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(
          l10n.productReviews(
            reviewCount == 0 ? product.reviewCount : reviewCount,
          ),
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _PriceBlock extends StatelessWidget {
  const _PriceBlock({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          formatTenge(l10n, locale, product.price),
          style: context.textTheme.headlineMedium?.copyWith(
            color: context.colors.primary,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        if (product.oldPrice case final oldPrice?) ...[
          Text(
            formatTenge(l10n, locale, oldPrice),
            style: context.textTheme.bodyMedium?.copyWith(
              decoration: TextDecoration.lineThrough,
              color: context.palette.textSecondary,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          PillBadge(
            label: l10n.productSaveAmount(
              formatTenge(l10n, locale, oldPrice - product.price),
            ),
            tone: AppTone.green,
          ),
        ],
      ],
    );
  }
}

class _AddToCart extends ConsumerWidget {
  const _AddToCart({required this.product, required this.inCart});

  final Product product;
  final int inCart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    if (!product.inStock) {
      return AppCard(
        color: context.palette.warningContainer,
        child: Row(
          children: [
            Icon(Icons.inventory_rounded, color: context.palette.warning),
            const SizedBox(width: AppSpacing.sm),
            Expanded(child: Text(l10n.shopOutOfStock)),
          ],
        ),
      );
    }

    if (inCart > 0) {
      return AppCard(
        child: Row(
          children: [
            Expanded(
              child: Text(
                l10n.productInCart(inCart),
                style: context.textTheme.titleSmall,
              ),
            ),
            QuantityStepper(
              quantity: inCart,
              onChanged: (quantity) => ref
                  .read(cartControllerProvider.notifier)
                  .setQuantity(product.id, quantity),
            ),
            const SizedBox(width: AppSpacing.xs),
            FilledButton(
              onPressed: () => context.push(AppRoutes.cart),
              child: Text(l10n.cartTitle),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        // Green: the design system reserves it for "Add to cart".
        style: FilledButton.styleFrom(
          backgroundColor: context.colors.secondary,
          foregroundColor: context.colors.onSecondary,
        ),
        onPressed: () async {
          final messenger = ScaffoldMessenger.of(context);
          await ref.read(cartControllerProvider.notifier).add(product.id);
          messenger
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(l10n.productAddedToCart)));
        },
        icon: const Icon(Icons.add_shopping_cart_rounded),
        label: Text(l10n.shopAddToCart),
      ),
    );
  }
}

/// Subscribe / cancel plus the delivery schedule for a box.
class _SubscriptionPanel extends ConsumerWidget {
  const _SubscriptionPanel({required this.product});

  final Product product;

  BoxCadence get _cadence => product.stages.contains(LifeStageForBox.pregnant)
      ? BoxCadence.trimester
      : BoxCadence.monthly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final localeTag = ref.watch(localeTagProvider);
    final subscription = ref.watch(subscriptionForProvider(product.id));
    final cycleLength = ref.watch(cyclePredictionProvider)?.averageCycleLength;

    return AppCard(
      color: context.colors.secondaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.autorenew_rounded, color: context.colors.secondary),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  _cadence.label(l10n),
                  style: context.textTheme.titleSmall,
                ),
              ),
            ],
          ),
          if (subscription != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(l10n.boxSchedule, style: context.textTheme.titleSmall),
            const SizedBox(height: AppSpacing.xs),
            for (final (index, date)
                in subscription.upcoming(cycleLength: cycleLength).indexed)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
                child: Row(
                  children: [
                    Icon(
                      index == 0
                          ? Icons.local_shipping_rounded
                          : Icons.schedule_rounded,
                      size: AppSizes.iconSm,
                      color: context.colors.secondary,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Text(
                        '${l10n.boxDeliveryNumber(index + 1)} · '
                        '${DateFormat.yMMMd(localeTag).format(date)}',
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: AppSpacing.md),
            OutlinedButton.icon(
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final message = l10n.boxCancelled;
                await ref
                    .read(subscriptionsControllerProvider.notifier)
                    .cancel(subscription.id);
                messenger.showSnackBar(SnackBar(content: Text(message)));
              },
              icon: const Icon(Icons.close_rounded),
              label: Text(l10n.boxCancel),
            ),
          ] else ...[
            const SizedBox(height: AppSpacing.md),
            LoadingButton(
              label: l10n.boxSubscribe,
              icon: Icons.card_giftcard_rounded,
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final created = await ref
                    .read(subscriptionsControllerProvider.notifier)
                    .subscribe(product: product, cadence: _cadence);
                messenger.showSnackBar(
                  SnackBar(
                    content: Text(
                      l10n.boxNextDelivery(
                        DateFormat.yMMMd(localeTag)
                            .format(created.nextDelivery),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

/// Alias so the cadence check reads clearly.
typedef LifeStageForBox = LifeStage;

class _BundleContents extends ConsumerWidget {
  const _BundleContents({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalogue = ref.watch(productsByIdProvider);
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (final id in product.bundleProductIds)
            if (catalogue[id] case final item?)
              ListTile(
                leading: Icon(item.category.icon),
                title: Text(item.title.of(context)),
                subtitle: Text(formatTenge(l10n, locale, item.price)),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push(AppRoutes.product(item.id)),
              ),
        ],
      ),
    );
  }
}

class _SellerCard extends ConsumerWidget {
  const _SellerCard({required this.sellerId});

  final String sellerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final sellers = ref.watch(sellersProvider).value ?? const [];
    final seller = sellers.where((item) => item.id == sellerId).firstOrNull;
    if (seller == null) return const SizedBox.shrink();

    return AppCard(
      child: Row(
        children: [
          const IconBubble(
            icon: Icons.storefront_rounded,
            tone: AppTone.green,
            size: 44,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.productSeller, style: context.textTheme.labelSmall),
                Text(seller.name, style: context.textTheme.titleSmall),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 14,
                      color: context.palette.warning,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      seller.rating.toStringAsFixed(1),
                      style: context.textTheme.labelSmall,
                    ),
                    if (seller.city case final city?) ...[
                      const SizedBox(width: AppSpacing.xs),
                      Text(city, style: context.textTheme.labelSmall),
                    ],
                  ],
                ),
              ],
            ),
          ),
          if (seller.isLocalBrand)
            PillBadge(
              label: l10n.badgeLocalBrand,
              tone: AppTone.green,
              icon: Icons.location_on_rounded,
            ),
        ],
      ),
    );
  }
}

class _RelatedContent extends ConsumerWidget {
  const _RelatedContent({required this.contentId});

  final String contentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(contentByIdProvider(contentId));
    if (item == null) return const SizedBox.shrink();
    final l10n = context.l10n;

    return AppCard(
      onTap: () => context.push(AppRoutes.learnItem(contentId)),
      child: Row(
        children: [
          const IconBubble(icon: Icons.menu_book_rounded, size: 44),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.productRelatedContent,
                  style: context.textTheme.labelSmall,
                ),
                Text(
                  item.title.of(context),
                  style: context.textTheme.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({required this.review, required this.locale});

  final Review review;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(review.author, style: context.textTheme.titleSmall),
              ),
              for (var star = 1; star <= 5; star++)
                Icon(
                  star <= review.rating
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  size: 14,
                  color: context.palette.warning,
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(review.text, style: context.textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.xxs),
          Row(
            children: [
              Text(
                DateFormat.yMMMd(locale.toLanguageTag())
                    .format(review.createdAt),
                style: context.textTheme.labelSmall,
              ),
              if (review.verifiedPurchase) ...[
                const SizedBox(width: AppSpacing.xs),
                Icon(
                  Icons.verified_rounded,
                  size: 14,
                  color: context.colors.secondary,
                ),
                const SizedBox(width: 2),
                Text(
                  l10n.productVerifiedPurchase,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colors.secondary,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
