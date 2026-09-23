import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../utils/context_extensions.dart';

/// Rounded card with a soft shadow. The base surface for feed items,
/// tracker tiles and product cards.
class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.onTap,
    this.color,
    this.padding = AppSpacing.card,
    this.elevated = true,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;

  /// Background colour. Defaults to the theme surface.
  final Color? color;
  final EdgeInsetsGeometry padding;

  /// Adds the soft drop shadow. Turn it off for tinted cards.
  final bool elevated;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppRadius.cardBorder,
        boxShadow: elevated
            ? [
                BoxShadow(
                  color: context.palette.shadow,
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Material(
        color: color ?? context.colors.surface,
        borderRadius: AppRadius.cardBorder,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
