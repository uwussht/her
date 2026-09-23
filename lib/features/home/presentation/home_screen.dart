import 'package:flutter/material.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/utils/greeting_period.dart';
import '../../../core/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.lg,
            AppSpacing.md,
            AppSizes.fabClearance,
          ),
          children: [
            Text(
              _greeting(l10n, GreetingPeriod.fromHour(DateTime.now().hour)),
              style: context.textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              l10n.homeSubtitle,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.palette.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            FeaturePlaceholder(
              icon: Icons.favorite_rounded,
              title: l10n.navHome,
              description: l10n.homePlaceholder,
            ),
          ],
        ),
      ),
    );
  }

  static String _greeting(AppLocalizations l10n, GreetingPeriod period) {
    return switch (period) {
      GreetingPeriod.morning => l10n.greetingMorning,
      GreetingPeriod.afternoon => l10n.greetingAfternoon,
      GreetingPeriod.evening => l10n.greetingEvening,
    };
  }
}
