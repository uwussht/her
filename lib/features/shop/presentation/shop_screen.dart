import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../home/presentation/home_providers.dart';
import '../domain/product.dart';
import '../domain/shop_catalogue.dart';
import 'product_labels.dart';
import 'shop_labels.dart';
import 'shop_providers.dart';
import 'widgets/cart_badge.dart';
import 'widgets/product_card.dart';

/// The Shop tab: recommendations, categories, filters and the grid.
class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen({super.key});

  @override
  ConsumerState<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends ConsumerState<ShopScreen> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  ShopFilterController get _filters =>
      ref.read(shopFilterControllerProvider.notifier);

  Future<void> _addToCart(Product product) async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    await ref.read(cartControllerProvider.notifier).add(product.id);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(l10n.productAddedToCart),
          action: SnackBarAction(
            label: l10n.cartTitle,
            onPressed: () => context.push(AppRoutes.cart),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final filter = ref.watch(shopFilterControllerProvider);
    final categories = ref.watch(shopCategoriesProvider);
    final results = ref.watch(shopResultsProvider);
    final recommended = ref.watch(recommendedProductsProvider);
    final isLoading = ref.watch(productsProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navShop),
        actions: [
          IconButton(
            tooltip: l10n.ordersTitle,
            onPressed: () => context.push(AppRoutes.orders),
            icon: const Icon(Icons.receipt_long_outlined),
          ),
          const CartBadge(),
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
                hintText: l10n.shopSearchHint,
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

          // Timed to the tracker forecast, so this row changes through the month.
          if (recommended.isNotEmpty && !filter.isActive) ...[
            SectionHeader(
              title: ref.watch(shopOfferReasonProvider).label(l10n),
            ),
            SizedBox(
              height: ProductCard.carouselHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: AppSpacing.screen,
                itemCount: recommended.length,
                clipBehavior: Clip.none,
                separatorBuilder: (context, _) =>
                    const SizedBox(width: AppSpacing.sm),
                itemBuilder: (context, index) {
                  final product = recommended[index];
                  return ProductCard(
                    product: product,
                    width: ProductCard.carouselWidth,
                    onTap: () => context.push(AppRoutes.product(product.id)),
                    onAddToCart: () => _addToCart(product),
                  );
                },
              ),
            ),
          ],

          SectionHeader(title: l10n.learnCategories),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: AppSpacing.screen,
            child: Row(
              children: [
                ChoiceChip(
                  label: Text(l10n.learnAll),
                  selected: filter.category == null,
                  onSelected: (_) => _filters.setCategory(null),
                ),
                for (final category in categories) ...[
                  const SizedBox(width: AppSpacing.xs),
                  ChoiceChip(
                    avatar: Icon(category.icon, size: 18),
                    label: Text(category.label(l10n)),
                    selected: filter.category == category,
                    onSelected: (_) => _filters.setCategory(category),
                  ),
                ],
              ],
            ),
          ),

          _FilterRow(filter: filter),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.xs,
            ),
            child: Text(
              l10n.shopResultsCount(results.length),
              style: context.textTheme.labelMedium,
            ),
          ),

          if (isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Row(
                children: [
                  Expanded(child: SkeletonCard()),
                  SizedBox(width: AppSpacing.sm),
                  Expanded(child: SkeletonCard()),
                ],
              ),
            )
          else if (results.isEmpty)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                children: [
                  Text(
                    l10n.shopNothingFound,
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
            Padding(
              padding: AppSpacing.screen,
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  mainAxisExtent: ProductCard.carouselHeight,
                  crossAxisSpacing: AppSpacing.sm,
                  mainAxisSpacing: AppSpacing.sm,
                ),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final product = results[index];
                  return ProductCard(
                    product: product,
                    onTap: () => context.push(AppRoutes.product(product.id)),
                    onAddToCart: product.inStock
                        ? () => _addToCart(product)
                        : null,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

/// Price, local-brand, sale and sort filters.
class _FilterRow extends ConsumerWidget {
  const _FilterRow({required this.filter});

  final ShopFilter filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);
    final controller = ref.read(shopFilterControllerProvider.notifier);
    final products = ref.watch(productsProvider).value ?? const [];
    final maxPrice = ref.watch(shopCatalogueProvider).maxPriceIn(products);

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
          FilterChip(
            label: Text(l10n.shopLocalBrands),
            selected: filter.localBrandsOnly,
            onSelected: (_) => controller.toggleLocalBrands(),
          ),
          const SizedBox(width: AppSpacing.xs),
          FilterChip(
            label: Text(l10n.shopDiscounted),
            selected: filter.discountedOnly,
            onSelected: (_) => controller.toggleDiscounted(),
          ),
          const SizedBox(width: AppSpacing.xs),
          PopupMenuButton<int?>(
            initialValue: filter.maxPrice,
            onSelected: controller.setMaxPrice,
            tooltip: l10n.shopMaxPrice(''),
            itemBuilder: (context) => [
              PopupMenuItem(value: null, child: Text(l10n.shopAnyPrice)),
              for (final price in _priceSteps(maxPrice))
                PopupMenuItem(
                  value: price,
                  child: Text(
                    l10n.shopMaxPrice(formatTenge(l10n, locale, price)),
                  ),
                ),
            ],
            child: Chip(
              avatar: const Icon(Icons.payments_outlined, size: 18),
              label: Text(
                filter.maxPrice == null
                    ? l10n.shopAnyPrice
                    : l10n.shopMaxPrice(
                        formatTenge(l10n, locale, filter.maxPrice!),
                      ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          PopupMenuButton<ShopSort>(
            initialValue: filter.sort,
            onSelected: controller.setSort,
            tooltip: l10n.learnSortLabel,
            itemBuilder: (context) => [
              for (final sort in ShopSort.values)
                PopupMenuItem(value: sort, child: Text(sort.label(l10n))),
            ],
            child: Chip(
              avatar: const Icon(Icons.sort_rounded, size: 18),
              label: Text(filter.sort.label(l10n)),
            ),
          ),
        ],
      ),
    );
  }

  /// Round price caps up to the catalogue's maximum.
  static List<int> _priceSteps(int maxPrice) => [
    for (final step in [3000, 5000, 10000, 20000])
      if (step < maxPrice) step,
  ];
}
