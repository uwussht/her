import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../utils/context_extensions.dart';
import 'app_card.dart';
import 'app_tone.dart';
import 'icon_bubble.dart';
import 'loading_button.dart';
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
    return _PlaceholderShell(
      icon: icon,
      tone: tone,
      title: title,
      description: description,
      badge: PillBadge(
        label: context.l10n.comingSoon,
        tone: tone,
        icon: Icons.auto_awesome_rounded,
      ),
    );
  }
}

/// Empty state with a call to action, e.g. "Mark period start".
class FeaturePlaceholderAction extends StatelessWidget {
  const FeaturePlaceholderAction({
    required this.icon,
    required this.title,
    required this.description,
    required this.actionLabel,
    required this.onAction,
    this.tone = AppTone.pink,
    super.key,
  });

  final IconData icon;
  final String title;
  final String description;
  final String actionLabel;
  final VoidCallback onAction;
  final AppTone tone;

  @override
  Widget build(BuildContext context) {
    return _PlaceholderShell(
      icon: icon,
      tone: tone,
      title: title,
      description: description,
      action: LoadingButton(label: actionLabel, onPressed: onAction),
    );
  }
}

class _PlaceholderShell extends StatelessWidget {
  const _PlaceholderShell({
    required this.icon,
    required this.tone,
    required this.title,
    required this.description,
    this.badge,
    this.action,
  });

  final IconData icon;
  final AppTone tone;
  final String title;
  final String description;
  final Widget? badge;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          IconBubble(icon: icon, tone: tone),
          const SizedBox(height: AppSpacing.md),
          if (badge != null) ...[badge!, const SizedBox(height: AppSpacing.sm)],
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
          if (action != null) ...[
            const SizedBox(height: AppSpacing.lg),
            action!,
          ],
        ],
      ),
    );
  }
}
