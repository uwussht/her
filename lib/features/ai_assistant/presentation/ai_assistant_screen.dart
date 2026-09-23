import 'package:flutter/material.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';

/// Circle AI chat. Step 1 only has the entry point. The chat UI and the
/// `POST /ai/chat` client arrive in step 7.
class AiAssistantScreen extends StatelessWidget {
  const AiAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.aiAssistantName)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          FeaturePlaceholder(
            icon: Icons.auto_awesome_rounded,
            title: l10n.aiAssistantName,
            description: l10n.aiAssistantPlaceholder,
            tone: AppTone.green,
          ),
          const SizedBox(height: AppSpacing.md),
          const DisclaimerCard(),
        ],
      ),
    );
  }
}
