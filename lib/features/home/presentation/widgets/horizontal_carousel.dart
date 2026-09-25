import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';

/// Horizontally scrolling row used by the feed carousels.
///
/// Sits inside the page's vertical list, so it takes a fixed height and
/// pads its own edges to line up with the screen gutter.
class HorizontalCarousel extends StatelessWidget {
  const HorizontalCarousel({
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  final double height;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: AppSpacing.screen,
        itemCount: itemCount,
        clipBehavior: Clip.none,
        separatorBuilder: (context, _) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
