import 'package:flutter/material.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';

class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.navTracker)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSizes.fabClearance,
        ),
        children: [
          FeaturePlaceholder(
            icon: Icons.calendar_month_rounded,
            title: l10n.navTracker,
            description: l10n.trackerPlaceholder,
            tone: AppTone.pink,
          ),
        ],
      ),
    );
  }
}
