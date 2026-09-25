import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../utils/context_extensions.dart';

/// A soft placeholder block for content that is still loading.
///
/// Deliberately static rather than shimmering: an endless animation keeps
/// the frame scheduler busy, which makes widget tests never settle and
/// drains the battery on a slow connection.
class SkeletonBox extends StatelessWidget {
  const SkeletonBox({
    this.width,
    this.height = 16,
    this.borderRadius = AppRadius.pillBorder,
    super.key,
  });

  final double? width;
  final double height;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      excludeSemantics: true,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.palette.surfaceMuted,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

/// Card-shaped skeleton: an image block and two lines of text.
class SkeletonCard extends StatelessWidget {
  const SkeletonCard({this.width, this.imageHeight = 96, super.key});

  final double? width;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonBox(height: imageHeight, borderRadius: AppRadius.cardBorder),
          const SizedBox(height: AppSpacing.xs),
          const SkeletonBox(height: 14),
          const SizedBox(height: AppSpacing.xxs),
          const SkeletonBox(height: 14, width: 120),
        ],
      ),
    );
  }
}
