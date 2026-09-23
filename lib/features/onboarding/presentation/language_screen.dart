import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import 'onboarding_controller.dart';

/// Picks the app language. The UI switches as soon as an option is tapped.
class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final current = ref.watch(localeControllerProvider);

    return Scaffold(
      appBar: AppBar(),
      body: TitledPageLayout(
        header: const Align(
          alignment: Alignment.centerLeft,
          child: IconBubble(icon: Icons.translate_rounded, size: 72),
        ),
        title: l10n.languageTitle,
        subtitle: l10n.languageSubtitle,
        bottom: LoadingButton(
          label: l10n.actionContinue,
          onPressed: () async {
            await ref
                .read(onboardingControllerProvider.notifier)
                .completeLanguage();
            if (context.mounted) context.go(AppRoutes.auth);
          },
        ),
        children: [
          for (final option in AppLocale.values) ...[
            OptionCard(
              title: option.displayName(l10n),
              selected: option == current,
              onTap: () =>
                  ref.read(localeControllerProvider.notifier).setLocale(option),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
