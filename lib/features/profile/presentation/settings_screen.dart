import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/theme/theme_mode_controller.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = ref.watch(localeControllerProvider);
    final themeMode = ref.watch(themeModeControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        padding: const EdgeInsets.only(bottom: AppSpacing.lg),
        children: [
          SectionHeader(title: l10n.settingsLanguage),
          _SettingsGroup(
            child: RadioGroup<AppLocale>(
              groupValue: locale,
              onChanged: (value) {
                if (value != null) {
                  ref.read(localeControllerProvider.notifier).setLocale(value);
                }
              },
              child: Column(
                children: [
                  for (final option in AppLocale.values)
                    RadioListTile<AppLocale>(
                      value: option,
                      title: Text(option.displayName(l10n)),
                    ),
                ],
              ),
            ),
          ),
          SectionHeader(title: l10n.settingsAppearance),
          _SettingsGroup(
            child: RadioGroup<ThemeMode>(
              groupValue: themeMode,
              onChanged: (value) {
                if (value != null) {
                  ref
                      .read(themeModeControllerProvider.notifier)
                      .setThemeMode(value);
                }
              },
              child: Column(
                children: [
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.light,
                    title: Text(l10n.themeLight),
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.dark,
                    title: Text(l10n.themeDark),
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.system,
                    title: Text(l10n.themeSystem),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screen,
      child: AppCard(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
        child: child,
      ),
    );
  }
}
