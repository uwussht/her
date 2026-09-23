import 'package:flutter/material.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.navLearn)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSizes.fabClearance,
        ),
        children: [
          FeaturePlaceholder(
            icon: Icons.school_rounded,
            title: l10n.navLearn,
            description: l10n.learnPlaceholder,
            tone: AppTone.pink,
          ),
        ],
      ),
    );
  }
}
