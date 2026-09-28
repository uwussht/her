import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/emergency_detector.dart';

/// Urgent-care card, shown instead of an answer.
///
/// Triggered by [EmergencyDetector] on the device, so it appears even with no
/// connection and nothing she wrote is sent anywhere.
class EmergencyCard extends StatelessWidget {
  const EmergencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      color: context.colors.errorContainer,
      elevated: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.emergency_rounded,
                color: context.colors.error,
                size: AppSizes.iconMd,
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  l10n.aiEmergencyTitle,
                  style: context.textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.aiEmergencyBody,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: context.colors.error,
              foregroundColor: context.colors.onError,
            ),
            onPressed: () => _call(context),
            icon: const Icon(Icons.call_rounded),
            label: Text(l10n.aiEmergencyCall),
          ),
        ],
      ),
    );
  }

  Future<void> _call(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final failed = context.l10n.aiEmergencyCallFailed;
    final uri = Uri(scheme: 'tel', path: EmergencyDetector.emergencyNumber);
    final launched = await launchUrl(uri).catchError((_) => false);
    if (!launched) {
      messenger.showSnackBar(SnackBar(content: Text(failed)));
    }
  }
}
