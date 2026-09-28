import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/invite_code.dart';

/// The invite: the code to read out, and a QR with the same code behind it.
class InviteCard extends StatelessWidget {
  const InviteCard({required this.code, super.key});

  final InviteCode code;

  static const double qrSize = 168;

  Future<void> _copy(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final copied = context.l10n.circleCodeCopied;
    await Clipboard.setData(ClipboardData(text: code.value));
    messenger.showSnackBar(SnackBar(content: Text(copied)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.circleInviteTitle, style: context.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.xxs),
          Text(l10n.circleInviteBody, style: context.textTheme.bodySmall),
          const SizedBox(height: AppSpacing.md),
          Center(
            child: Text(
              code.formatted,
              style: context.textTheme.displaySmall?.copyWith(
                color: context.colors.primary,
                letterSpacing: 4,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: AppRadius.cardBorder,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: QrImageView(
                  data: code.linkFor('hercircle').toString(),
                  size: qrSize,
                  backgroundColor: context.colors.surface,
                  eyeStyle: QrEyeStyle(
                    eyeShape: QrEyeShape.circle,
                    color: context.colors.primary,
                  ),
                  dataModuleStyle: QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.circle,
                    color: context.colors.onSurface,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Center(
            child: Text(l10n.circleQrHint, style: context.textTheme.labelSmall),
          ),
          const SizedBox(height: AppSpacing.xs),
          Center(
            child: OutlinedButton.icon(
              onPressed: () => _copy(context),
              icon: const Icon(Icons.copy_rounded),
              label: Text(l10n.circleCopyCode),
            ),
          ),
        ],
      ),
    );
  }
}
