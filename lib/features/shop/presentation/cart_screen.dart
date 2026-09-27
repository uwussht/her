import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../domain/product.dart';
import 'product_labels.dart';
import 'shop_providers.dart';
import 'widgets/price_row.dart';
import 'widgets/quantity_stepper.dart';

/// The cart: lines, totals and the way to checkout.
class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);
    final cart = ref.watch(cartControllerProvider);
    final catalogue = ref.watch(productsByIdProvider);
    final totals = ref.watch(cartTotalsProvider);

    if (cart.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.cartTitle)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const IconBubble(
                  icon: Icons.shopping_cart_outlined,
                  tone: AppTone.green,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(l10n.cartEmpty, style: context.textTheme.titleLarge),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  l10n.cartEmptyBody,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.palette.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.lg),
                FilledButton(
                  onPressed: () => context.go(AppRoutes.shop),
                  child: Text(l10n.cartGoShopping),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.cartTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.md,
        ),
        children: [
          for (final line in cart.lines)
            if (catalogue[line.productId] case final product?)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: _CartLineTile(
                  product: product,
                  quantity: line.quantity,
                  onChanged: (quantity) async {
                    final messenger = ScaffoldMessenger.of(context);
                    final removedMessage = l10n.cartRemoved;
                    await ref
                        .read(cartControllerProvider.notifier)
                        .setQuantity(product.id, quantity);
                    if (quantity <= 0) {
                      messenger
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text(removedMessage)));
                    }
                  },
                ),
              ),

          if (totals.toFreeDelivery case final remaining?) ...[
            const SizedBox(height: AppSpacing.xs),
            AppCard(
              elevated: false,
              color: context.palette.successContainer,
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Row(
                children: [
                  Icon(
                    Icons.local_shipping_outlined,
                    size: AppSizes.iconSm,
                    color: context.colors.secondary,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      l10n.cartFreeDeliveryFrom(
                        formatTenge(l10n, locale, remaining),
                      ),
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: AppSpacing.md),
          AppCard(
            child: Column(
              children: [
                PriceRow(
                  label: l10n.cartSubtotal,
                  value: formatTenge(l10n, locale, totals.subtotal),
                ),
                PriceRow(
                  label: l10n.cartDelivery,
                  value: totals.delivery == 0
                      ? l10n.cartDeliveryFree
                      : formatTenge(l10n, locale, totals.delivery),
                  tone: totals.delivery == 0 ? context.colors.secondary : null,
                ),
                if (totals.savings > 0)
                  PriceRow(
                    label: l10n.cartSavings(
                      formatTenge(l10n, locale, totals.savings),
                    ),
                    value: '',
                    tone: context.colors.secondary,
                  ),
                const Divider(height: AppSpacing.lg),
                PriceRow(
                  label: l10n.cartTotal,
                  value: formatTenge(l10n, locale, totals.total),
                  emphasised: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          LoadingButton(
            label: l10n.cartCheckout,
            icon: Icons.lock_outline_rounded,
            onPressed: () => context.push(AppRoutes.checkout),
          ),
        ],
      ),
    );
  }
}

class _CartLineTile extends StatelessWidget {
  const _CartLineTile({
    required this.product,
    required this.quantity,
    required this.onChanged,
  });

  final Product product;
  final int quantity;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);

    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: context.palette.surfaceMuted,
              borderRadius: AppRadius.cardBorder,
            ),
            child: Icon(product.category.icon, color: context.colors.secondary),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
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
                Text(
                  formatTenge(l10n, locale, product.price * quantity),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.primary,
                  ),
                ),
              ],
            ),
          ),
          QuantityStepper(quantity: quantity, onChanged: onChanged),
        ],
      ),
    );
  }
}
