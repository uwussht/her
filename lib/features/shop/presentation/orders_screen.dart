import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/presentation/learn_providers.dart';
import '../domain/order.dart';
import 'product_labels.dart';
import 'shop_labels.dart';
import 'shop_providers.dart';

/// Her order history.
class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);
    final localeTag = ref.watch(localeTagProvider);
    final orders = ref.watch(ordersControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.ordersTitle)),
      body: orders.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const IconBubble(
                      icon: Icons.receipt_long_outlined,
                      tone: AppTone.green,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      l10n.ordersEmpty,
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    FilledButton(
                      onPressed: () => context.go(AppRoutes.shop),
                      child: Text(l10n.cartGoShopping),
                    ),
                  ],
                ),
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
                for (final order in orders)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: AppCard(
                      onTap: () => context.push(AppRoutes.order(order.id)),
                      child: Row(
                        children: [
                          IconBubble(
                            icon: order.status == OrderStatus.delivered
                                ? Icons.inventory_2_rounded
                                : Icons.local_shipping_rounded,
                            tone: order.status == OrderStatus.delivered
                                ? AppTone.green
                                : AppTone.pink,
                            size: 44,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.orderNumber(order.reference),
                                  style: context.textTheme.titleSmall,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${l10n.orderItemsCount(order.itemCount)} · '
                                  '${formatTenge(l10n, locale, order.total)}',
                                  style: context.textTheme.bodySmall,
                                ),
                                Text(
                                  l10n.orderPlacedOn(
                                    DateFormat.yMMMd(localeTag)
                                        .format(order.placedAt),
                                  ),
                                  style: context.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                          PillBadge(
                            label: order.status.label(l10n),
                            tone: switch (order.status) {
                              OrderStatus.delivered => AppTone.green,
                              OrderStatus.cancelled => AppTone.warning,
                              _ => AppTone.pink,
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
