import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../domain/content_item.dart';
import '../content_labels.dart';

/// Cover image for a content item.
///
/// Mock content ships without images, so a soft tinted panel with the
/// category icon stands in. Real cover images load through
/// [CachedNetworkImage] and fall back to the same panel on failure.
class ContentThumbnail extends StatelessWidget {
  const ContentThumbnail({
    required this.category,
    required this.type,
    this.imageUrl,
    this.height = 120,
    this.borderRadius = AppRadius.cardBorder,
    super.key,
  });

  final ContentCategory category;
  final ContentType type;
  final String? imageUrl;
  final double height;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: url == null
            ? _Fallback(category: category, type: type)
            : CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                placeholder: (context, _) =>
                    _Fallback(category: category, type: type),
                errorWidget: (context, _, _) =>
                    _Fallback(category: category, type: type),
              ),
      ),
    );
  }
}

class _Fallback extends StatelessWidget {
  const _Fallback({required this.category, required this.type});

  final ContentCategory category;
  final ContentType type;

  @override
  Widget build(BuildContext context) {
    final tone = category.tone;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            tone.background(context),
            tone.foreground(context).withValues(alpha: 0.25),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          category.icon,
          size: AppSizes.iconLg,
          color: tone.foreground(context),
        ),
      ),
    );
  }
}
