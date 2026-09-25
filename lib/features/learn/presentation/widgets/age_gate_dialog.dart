import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';

/// Confirmation before opening the 18+ section.
///
/// Users under 16 never see the section at all; this is the extra step for
/// everyone else, since the app does not verify age documents.
abstract final class AgeGateDialog {
  static Future<bool> confirm(BuildContext context) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const IconBubble(
          icon: Icons.lock_outline_rounded,
          size: 56,
          tone: AppTone.warning,
        ),
        title: Text(l10n.ageGateTitle),
        content: Text(l10n.ageGateBody),
        actionsOverflowButtonSpacing: AppSpacing.xs,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.ageGateConfirm),
          ),
        ],
      ),
    );
    return confirmed ?? false;
  }
}
