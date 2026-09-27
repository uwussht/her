import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../domain/cart.dart';

/// Minus / count / plus control for a cart line.
class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    required this.quantity,
    required this.onChanged,
    super.key,
  });

  final int quantity;

  /// Called with the new quantity; zero means remove.
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Semantics(
      label: l10n.cartQuantity,
      value: '$quantity',
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.palette.surfaceMuted,
          borderRadius: AppRadius.pillBorder,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: quantity <= 1 ? l10n.cartRemove : null,
              onPressed: () => onChanged(quantity - 1),
              visualDensity: VisualDensity.compact,
              icon: Icon(
                quantity <= 1
                    ? Icons.delete_outline_rounded
                    : Icons.remove_rounded,
                size: AppSizes.iconSm,
              ),
            ),
            SizedBox(
              width: 24,
              child: Text(
                '$quantity',
                style: context.textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: quantity >= Cart.maxQuantityPerLine
                  ? null
                  : () => onChanged(quantity + 1),
              visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.add_rounded, size: AppSizes.iconSm),
            ),
          ],
        ),
      ),
    );
  }
}
