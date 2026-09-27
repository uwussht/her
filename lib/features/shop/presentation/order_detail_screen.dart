import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/presentation/learn_providers.dart';
import '../domain/order.dart';
import 'product_labels.dart';
import 'shop_labels.dart';
import 'shop_providers.dart';
import 'widgets/price_row.dart';

/// One order: tracking timeline, contents and delivery details.
class OrderDetailScreen extends ConsumerWidget {
  const OrderDetailScreen({required this.orderId, super.key});

  final String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);
    final localeTag = ref.watch(localeTagProvider);
    final order = ref.watch(orderByIdProvider(orderId));

    if (order == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.notFoundTitle)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.orderNumber(order.reference))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.xl,
        ),
        children: [
          _Tracking(order: order, localeTag: localeTag),
          const SizedBox(height: AppSpacing.lg),

          Text(l10n.orderSummary, style: context.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.xs),
          AppCard(
            child: Column(
              children: [
                for (final line in order.lines)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            line.title.of(context),
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          l10n.orderQuantityShort(line.quantity),
                          style: context.textTheme.labelMedium,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          formatTenge(l10n, locale, line.lineTotal),
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                const Divider(height: AppSpacing.lg),
                PriceRow(
                  label: l10n.cartSubtotal,
                  value: formatTenge(l10n, locale, order.subtotal),
                ),
                PriceRow(
                  label: l10n.cartDelivery,
                  value: order.delivery == 0
                      ? l10n.cartDeliveryFree
                      : formatTenge(l10n, locale, order.delivery),
                ),
                PriceRow(
                  label: l10n.cartTotal,
                  value: formatTenge(l10n, locale, order.total),
                  emphasised: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.orderDeliveryTo, style: context.textTheme.labelSmall),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  order.address.fullName,
                  style: context.textTheme.titleSmall,
                ),
                Text(order.address.phone, style: context.textTheme.bodySmall),
                Text(
                  [
                    order.address.city,
                    order.address.street,
                    ?order.address.apartment,
                    ?order.address.postalCode,
                  ].join(', '),
                  style: context.textTheme.bodySmall,
                ),
                if (order.address.comment case final comment?) ...[
                  const SizedBox(height: AppSpacing.xxs),
                  Text(comment, style: context.textTheme.bodySmall),
                ],
                const Divider(height: AppSpacing.lg),
                Row(
                  children: [
                    Icon(
                      Icons.payments_outlined,
                      size: AppSizes.iconSm,
                      color: context.palette.textSecondary,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Text(
                        order.paymentMethod.label(l10n),
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                if (order.paymentReference case final reference?) ...[
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    l10n.orderPaymentReference(reference),
                    style: context.textTheme.labelSmall,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The tracking timeline. Steps ahead of the current one are greyed out.
class _Tracking extends StatelessWidget {
  const _Tracking({required this.order, required this.localeTag});

  final Order order;
  final String localeTag;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (order.status == OrderStatus.cancelled) {
      return AppCard(
        color: context.palette.warningContainer,
        child: Row(
          children: [
            Icon(Icons.cancel_outlined, color: context.palette.warning),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                l10n.orderStatusCancelled,
                style: context.textTheme.titleSmall,
              ),
            ),
          ],
        ),
      );
    }

    final current = order.status.step ?? 0;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (order.estimatedDelivery case final date?) ...[
            Text(
              l10n.orderEstimated(DateFormat.yMMMMd(localeTag).format(date)),
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: AppSpacing.md),
          ],
          for (final (index, status) in OrderStatus.timeline.indexed)
            _TimelineStep(
              label: status.label(l10n),
              done: index <= current,
              isLast: index == OrderStatus.timeline.length - 1,
            ),
        ],
      ),
    );
  }
}

class _TimelineStep extends StatelessWidget {
  const _TimelineStep({
    required this.label,
    required this.done,
    required this.isLast,
  });

  final String label;
  final bool done;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final colour = done
        ? context.colors.secondary
        : context.colors.outlineVariant;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: done ? colour : context.colors.surface,
                shape: BoxShape.circle,
                border: Border.all(color: colour, width: 2),
              ),
              child: done
                  ? Icon(
                      Icons.check_rounded,
                      size: 14,
                      color: context.colors.onSecondary,
                    )
                  : null,
            ),
            if (!isLast) Container(width: 2, height: 28, color: colour),
          ],
        ),
        const SizedBox(width: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Text(
            label,
            style: context.textTheme.bodyLarge?.copyWith(
              color: done
                  ? context.colors.onSurface
                  : context.palette.textSecondary,
              fontWeight: done ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
