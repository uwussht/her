import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../utils/context_extensions.dart';

/// Page indicator: the active dot stretches into a pill.
class PageDots extends StatelessWidget {
  const PageDots({
    required this.count,
    required this.index,
    this.semanticsLabel,
    super.key,
  });

  final int count;
  final int index;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < count; i++)
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
              width: i == index ? AppSpacing.lg : AppSpacing.xs,
              height: AppSpacing.xs,
              decoration: BoxDecoration(
                color: i == index
                    ? context.colors.primary
                    : context.colors.primaryFixedDim,
                borderRadius: AppRadius.pillBorder,
              ),
            ),
        ],
      ),
    );
  }
}
