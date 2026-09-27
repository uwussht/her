import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/context_extensions.dart';
import '../shop_providers.dart';

/// Cart icon with the item count, for the shop app bar.
class CartBadge extends ConsumerWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(cartControllerProvider).itemCount;
    return IconButton(
      tooltip: context.l10n.cartTitle,
      onPressed: () => context.push(AppRoutes.cart),
      icon: Badge(
        isLabelVisible: count > 0,
        label: Text('$count'),
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
