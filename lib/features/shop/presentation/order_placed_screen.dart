import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/presentation/learn_providers.dart';
import 'shop_providers.dart';

/// Confirmation after a successful payment.
class OrderPlacedScreen extends ConsumerWidget {
  const OrderPlacedScreen({required this.orderId, super.key});

  final String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final order = ref.watch(orderByIdProvider(orderId));
    final localeTag = ref.watch(localeTagProvider);

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            const Spacer(),
            const IconBubble(
              icon: Icons.check_circle_rounded,
              tone: AppTone.green,
              size: 120,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              l10n.orderPlacedTitle,
              style: context.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.orderPlacedBody,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.palette.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (order != null) ...[
              const SizedBox(height: AppSpacing.lg),
              PillBadge(
                label: l10n.orderNumber(order.reference),
                icon: Icons.receipt_long_rounded,
              ),
              if (order.estimatedDelivery case final date?) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  l10n.orderEstimated(
                    DateFormat.yMMMMd(localeTag).format(date),
                  ),
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ],
            const Spacer(),
            if (order != null)
              LoadingButton(
                label: l10n.orderTrack,
                icon: Icons.local_shipping_outlined,
                onPressed: () =>
                    context.pushReplacement(AppRoutes.order(order.id)),
              ),
            const SizedBox(height: AppSpacing.xs),
            TextButton(
              onPressed: () => context.go(AppRoutes.shop),
              child: Text(l10n.orderContinueShopping),
            ),
          ],
        ),
      ),
    );
  }
}
