import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../utils/context_extensions.dart';
import 'app_tone.dart';

/// Large selectable row used in the quiz and the language picker.
class OptionCard extends StatelessWidget {
  const OptionCard({
    required this.title,
    required this.selected,
    required this.onTap,
    this.subtitle,
    this.icon,
    this.tone = AppTone.pink,
    super.key,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final bool selected;
  final VoidCallback onTap;
  final AppTone tone;

  @override
  Widget build(BuildContext context) {
    final accent = tone.foreground(context);
    return Semantics(
      selected: selected,
      button: true,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: selected ? tone.background(context) : context.colors.surface,
          borderRadius: AppRadius.cardBorder,
          border: Border.all(
            color: selected ? accent : context.colors.outlineVariant,
            width: selected ? 2 : 1,
          ),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: AppRadius.cardBorder,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm + AppSpacing.xxs,
              ),
              child: Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: accent),
                    const SizedBox(width: AppSpacing.sm),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: context.textTheme.titleMedium),
                        if (subtitle != null) ...[
                          const SizedBox(height: 2),
                          Text(subtitle!, style: context.textTheme.bodySmall),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 180),
                    opacity: selected ? 1 : 0,
                    child: Icon(Icons.check_circle_rounded, color: accent),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
