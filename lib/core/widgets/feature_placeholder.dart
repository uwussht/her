import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../utils/context_extensions.dart';
import 'app_card.dart';
import 'app_tone.dart';
import 'icon_bubble.dart';
import 'pill_badge.dart';

/// Card for a section that later steps will build.
class FeaturePlaceholder extends StatelessWidget {
  const FeaturePlaceholder({
    required this.icon,
    required this.title,
    required this.description,
    this.tone = AppTone.pink,
    super.key,
  });

  final IconData icon;
  final String title;
  final String description;
  final AppTone tone;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          IconBubble(icon: icon, tone: tone),
          const SizedBox(height: AppSpacing.md),
          PillBadge(
            label: context.l10n.comingSoon,
            tone: tone,
            icon: Icons.auto_awesome_rounded,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            title,
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            description,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.palette.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
