import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../profile/domain/personalization.dart';
import '../../../profile/presentation/personalization_labels.dart';
import '../../../profile/presentation/user_profile_controller.dart';
import '../../data/doctor_report_service.dart';
import '../../domain/tracker_enums.dart';
import '../tracker_labels.dart';
import '../tracker_providers.dart';

/// Exports the tracker history as a PDF she can hand to her doctor.
class DoctorReportCard extends ConsumerStatefulWidget {
  const DoctorReportCard({super.key});

  @override
  ConsumerState<DoctorReportCard> createState() => _DoctorReportCardState();
}

class _DoctorReportCardState extends ConsumerState<DoctorReportCard> {
  bool _busy = false;

  Future<void> _export() async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final timeline = ref.read(cycleTimelineProvider);
    final profile = ref.read(userProfileControllerProvider);

    setState(() => _busy = true);
    try {
      final bytes = await const DoctorReportService().build(
        l10n: l10n,
        localeTag: locale,
        timeline: timeline,
        profile: profile,
        labels: (
          flow: (value) => (value as FlowLevel).label(l10n),
          mood: (value) => (value as Mood).label(l10n),
          energy: (value) => (value as EnergyLevel).label(l10n),
          symptom: (value) => (value as Symptom).label(l10n),
          lifeStage: (value) => (value as LifeStage).label(l10n),
          ageGroup: (value) => (value as AgeGroup).label(l10n),
        ),
      );
      await Printing.sharePdf(
        bytes: bytes,
        filename: _fileName(),
        subject: l10n.reportHeading,
      );
    } on Exception {
      messenger.showSnackBar(SnackBar(content: Text(l10n.reportFailed)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  static String _fileName() {
    final stamp = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return 'her-circle-report-$stamp.pdf';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final hasData = ref.watch(cycleTimelineProvider).hasData;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const IconBubble(
                icon: Icons.description_rounded,
                tone: AppTone.green,
                size: 44,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  l10n.reportCardTitle,
                  style: context.textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            hasData ? l10n.reportCardBody : l10n.reportEmpty,
            style: context.textTheme.bodySmall,
          ),
          if (hasData) ...[
            const SizedBox(height: AppSpacing.md),
            OutlinedButton.icon(
              onPressed: _busy ? null : _export,
              icon: _busy
                  ? const SizedBox.square(
                      dimension: AppSizes.iconSm,
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    )
                  : const Icon(Icons.ios_share_rounded),
              label: Text(l10n.reportShare),
            ),
          ],
        ],
      ),
    );
  }
}
