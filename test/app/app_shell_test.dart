import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/l10n.dart';
import 'package:her_circle/core/theme/theme_mode_controller.dart';
import 'package:her_circle/features/ai_assistant/presentation/ai_assistant_screen.dart';
import 'package:her_circle/features/profile/presentation/settings_screen.dart';

import '../helpers/pump_app.dart';

void main() {
  testWidgets('starts on Home in Russian with five tabs and the AI button', (
    tester,
  ) async {
    await pumpHerCircle(tester);

    expect(find.byType(NavigationBar), findsOneWidget);
    for (final label in ['Главная', 'Обучение', 'Трекер', 'Магазин']) {
      expect(find.text(label), findsWidgets);
    }
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('switches tabs from the bottom bar', (tester) async {
    await pumpHerCircle(tester);

    await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
    await tester.pumpAndSettle();
    expect(
      find.text('Товары для здоровья, боксы по подписке и готовые наборы.'),
      findsOneWidget,
    );
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('AI button opens Circle AI with the medical disclaimer', (
    tester,
  ) async {
    await pumpHerCircle(tester);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(AiAssistantScreen), findsOneWidget);
    expect(
      find.textContaining('не заменяет консультацию врача'),
      findsOneWidget,
    );
  });

  testWidgets('language and theme can be changed in Settings', (tester) async {
    final container = await pumpHerCircle(tester);

    await tester.tap(find.byIcon(Icons.person_outline_rounded));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Настройки'));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsScreen), findsOneWidget);

    await tester.tap(find.text('Қазақша'));
    await tester.pumpAndSettle();
    expect(find.text('Баптаулар'), findsOneWidget);
    expect(container.read(localeControllerProvider), AppLocale.kk);

    await tester.tap(find.text('Қараңғы'));
    await tester.pumpAndSettle();
    expect(container.read(themeModeControllerProvider), ThemeMode.dark);
  });

  testWidgets('restores the saved language on start', (tester) async {
    await pumpHerCircle(tester, prefs: {'settings.locale': 'en'});

    expect(find.text('Home'), findsWidgets);
    expect(find.text('Shop'), findsOneWidget);
  });
}
