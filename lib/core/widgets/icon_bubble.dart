import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import 'app_tone.dart';

/// An icon inside a soft tinted circle. Stands in for rounded
/// illustrations until custom artwork arrives.
class IconBubble extends StatelessWidget {
  const IconBubble({
    required this.icon,
    this.tone = AppTone.pink,
    this.size = AppSizes.illustration,
    super.key,
  });

  final IconData icon;
  final AppTone tone;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: tone.background(context),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: size * 0.45, color: tone.foreground(context)),
    );
  }
}
