import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:her_circle/app.dart';
import 'package:her_circle/core/services/storage/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Pumps the whole app with in-memory preferences.
Future<ProviderContainer> pumpHerCircle(
  WidgetTester tester, {
  Map<String, Object> prefs = const {},
}) async {
  GoogleFonts.config.allowRuntimeFetching = false;
  SharedPreferences.setMockInitialValues(prefs);
  final sharedPrefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [sharedPreferencesProvider.overrideWithValue(sharedPrefs)],
  );
  addTearDown(container.dispose);
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: const HerCircleApp(),
    ),
  );
  await tester.pumpAndSettle();
  return container;
}
