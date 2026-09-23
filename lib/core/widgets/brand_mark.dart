import 'package:flutter/material.dart';

import '../utils/context_extensions.dart';

/// The Her Circle mark: a pink ring holding a heart, with a green leaf
/// accent. Drawn in code until the final logo asset is ready.
class BrandMark extends StatelessWidget {
  const BrandMark({this.size = 112, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: context.l10n.appTitle,
      image: true,
      child: SizedBox.square(
        dimension: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.primaryContainer,
                border: Border.all(
                  color: context.colors.primary,
                  width: size * 0.06,
                ),
              ),
            ),
            Icon(
              Icons.favorite_rounded,
              size: size * 0.42,
              color: context.colors.primary,
            ),
            Positioned(
              top: size * 0.08,
              right: size * 0.08,
              child: Icon(
                Icons.eco_rounded,
                size: size * 0.26,
                color: context.colors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
