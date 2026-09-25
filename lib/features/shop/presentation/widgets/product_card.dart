import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/product.dart';
import '../product_labels.dart';

/// Product card for the shop grid and the home offers row.
///
/// "Add to cart" is green, per the design system; the cart itself arrives in
/// step 6, so [onAddToCart] is optional until then.
class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    this.onTap,
    this.onAddToCart,
    this.width,
    super.key,
  });

  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final double? width;

  static const double carouselWidth = 168;
  static const double carouselHeight = 244;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);
    final image = product.imageUrls.isEmpty ? null : product.imageUrls.first;

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
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppRadius.card),
                  ),
                  child: SizedBox(
                    height: 96,
                    width: double.infinity,
                    child: image == null
                        ? _ImageFallback(category: product.category)
                        : CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.cover,
                            placeholder: (context, _) =>
                                _ImageFallback(category: product.category),
                            errorWidget: (context, _, _) =>
                                _ImageFallback(category: product.category),
                          ),
                  ),
                ),
                if (product.isBundle)
                  Positioned(
                    top: AppSpacing.xs,
                    left: AppSpacing.xs,
                    child: PillBadge(
                      label: l10n.badgeBundle,
                      tone: AppTone.green,
                      icon: Icons.inventory_2_rounded,
                    ),
                  )
                else if (product.category == ProductCategory.subscriptionBox)
                  Positioned(
                    top: AppSpacing.xs,
                    left: AppSpacing.xs,
                    child: PillBadge(
                      label: l10n.badgeSubscription,
                      tone: AppTone.green,
                      icon: Icons.autorenew_rounded,
                    ),
                  ),
                if (product.discountPercent case final discount?)
                  Positioned(
                    top: AppSpacing.xs,
                    right: AppSpacing.xs,
                    child: PillBadge(label: '-$discount%', tone: AppTone.pink),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.of(context),
                      style: context.textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 14,
                          color: context.palette.warning,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          product.rating.toStringAsFixed(1),
                          style: context.textTheme.labelSmall,
                        ),
                        const SizedBox(width: AppSpacing.xxs),
                        Expanded(
                          child: Text(
                            '(${product.reviewCount})',
                            style: context.textTheme.labelSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (product.oldPrice case final oldPrice?)
                                Text(
                                  formatTenge(l10n, locale, oldPrice),
                                  style: context.textTheme.labelSmall?.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              Text(
                                formatTenge(l10n, locale, product.price),
                                style: context.textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                        if (onAddToCart != null)
                          IconButton.filled(
                            tooltip: l10n.shopAddToCart,
                            onPressed: onAddToCart,
                            visualDensity: VisualDensity.compact,
                            style: IconButton.styleFrom(
                              backgroundColor: context.colors.secondary,
                              foregroundColor: context.colors.onSecondary,
                            ),
                            icon: const Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 18,
                            ),
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

class _ImageFallback extends StatelessWidget {
  const _ImageFallback({required this.category});

  final ProductCategory category;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.palette.surfaceMuted,
      child: Center(
        child: Icon(
          category.icon,
          color: context.colors.secondary,
          size: AppSizes.iconLg,
        ),
      ),
    );
  }
}
