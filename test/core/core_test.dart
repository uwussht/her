import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/l10n.dart';
import 'package:her_circle/core/theme/app_colors.dart';
import 'package:her_circle/core/theme/app_theme.dart';
import 'package:her_circle/core/utils/greeting_period.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('GreetingPeriod.fromHour', () {
    test('maps hours to parts of the day', () {
      expect(GreetingPeriod.fromHour(4), GreetingPeriod.evening);
      expect(GreetingPeriod.fromHour(5), GreetingPeriod.morning);
      expect(GreetingPeriod.fromHour(11), GreetingPeriod.morning);
      expect(GreetingPeriod.fromHour(12), GreetingPeriod.afternoon);
      expect(GreetingPeriod.fromHour(18), GreetingPeriod.evening);
      expect(GreetingPeriod.fromHour(23), GreetingPeriod.evening);
    });
  });

  group('AppLocale', () {
    test('falls back to Russian for unknown or missing codes', () {
      expect(AppLocale.fromCode(null), AppLocale.ru);
      expect(AppLocale.fromCode('de'), AppLocale.ru);
      expect(AppLocale.fromCode('kk'), AppLocale.kk);
    });

    test('every app locale has generated translations', () {
      expect(
        AppLocalizations.supportedLocales.map((l) => l.languageCode),
        containsAll(AppLocale.values.map((l) => l.locale.languageCode)),
      );
    });
  });

  group('AppTheme', () {
    test('light theme uses the brand pink and green', () {
      final theme = AppTheme.light;
      expect(theme.colorScheme.primary, AppColors.primary);
      expect(theme.colorScheme.secondary, AppColors.secondary);
      expect(theme.scaffoldBackgroundColor, AppColors.background);
      expect(theme.extension<AppPalette>(), AppPalette.light);
    });

    test('dark theme uses the deep plum background', () {
      final theme = AppTheme.dark;
      expect(theme.brightness, Brightness.dark);
      expect(theme.scaffoldBackgroundColor, AppColors.darkBackground);
      expect(theme.colorScheme.primary, AppColors.primary);
    });
  });
}
