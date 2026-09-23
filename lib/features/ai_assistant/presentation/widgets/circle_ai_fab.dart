import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/context_extensions.dart';

/// Floating button that opens Circle AI. Shown on every main tab.
class CircleAiFab extends StatelessWidget {
  const CircleAiFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'circle-ai-fab',
      tooltip: context.l10n.aiAssistantOpen,
      onPressed: () => context.push(AppRoutes.aiAssistant),
      child: const Icon(Icons.auto_awesome_rounded),
    );
  }
}
