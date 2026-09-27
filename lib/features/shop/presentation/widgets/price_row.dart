import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';

/// A label and an amount on one line, e.g. "Delivery — Free".
class PriceRow extends StatelessWidget {
  const PriceRow({
    required this.label,
    required this.value,
    this.emphasised = false,
    this.tone,
    super.key,
  });

  final String label;
  final String value;

  /// Used for the total.
  final bool emphasised;
  final Color? tone;

  @override
  Widget build(BuildContext context) {
    final style = emphasised
        ? context.textTheme.titleMedium
        : context.textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: style?.copyWith(
                color:
                    tone ??
                    (emphasised
                        ? context.colors.onSurface
                        : context.palette.textSecondary),
              ),
            ),
          ),
          Text(value, style: style?.copyWith(color: tone)),
        ],
      ),
    );
  }
}
