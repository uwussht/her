import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../utils/context_extensions.dart';
import 'app_tone.dart';

/// Small pill label, e.g. "Free", "Premium" or "Coming soon".
class PillBadge extends StatelessWidget {
  const PillBadge({
    required this.label,
    this.tone = AppTone.pink,
    this.icon,
    super.key,
  });

  final String label;
  final AppTone tone;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final fg = tone.foreground(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: tone.background(context),
        borderRadius: AppRadius.pillBorder,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xxs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 14, color: fg),
              const SizedBox(width: AppSpacing.xxs),
            ],
            Text(
              label,
              style: context.textTheme.labelSmall?.copyWith(
                color: fg,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
