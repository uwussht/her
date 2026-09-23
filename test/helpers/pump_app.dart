import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:her_circle/app.dart';
import 'package:her_circle/core/services/storage/local_store.dart';
import 'package:her_circle/core/services/storage/preferences_service.dart';
import 'package:her_circle/features/auth/data/mock_auth_repository.dart';
import 'package:her_circle/features/auth/domain/app_user.dart';
import 'package:her_circle/features/auth/presentation/auth_providers.dart';
import 'package:her_circle/features/onboarding/presentation/splash_screen.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/profile/domain/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

const testUser = AppUser(
  uid: 'test-user',
  method: AuthMethod.phone,
  phoneNumber: '+77011234567',
);

final testProfile = UserProfile(
  uid: testUser.uid,
  ageGroup: AgeGroup.age25to34,
  lifeStage: LifeStage.trackingCycle,
  cycleLength: 28,
  interests: const [Interest.cycleHealth],
  createdAt: DateTime(2026),
);

/// Pumps the whole app with in-memory storage and instant mock auth.
///
/// With [onboarded] the user is signed in with a finished quiz, so the app
/// opens on Home. Otherwise it starts from the intro.
Future<ProviderContainer> pumpHerCircle(
  WidgetTester tester, {
  bool onboarded = true,
  UserProfile? profile,
  Map<String, Object> prefs = const {},
}) async {
  GoogleFonts.config.allowRuntimeFetching = false;
  SharedPreferences.setMockInitialValues({
    if (onboarded) ...{
      'onboarding.introSeen': true,
      'onboarding.languageChosen': true,
      'mockAuth.session': jsonEncode(testUser.toJson()),
    },
    ...prefs,
  });
  final sharedPrefs = await SharedPreferences.getInstance();
  final store = InMemoryLocalStore();
  if (onboarded) {
    final p = profile ?? testProfile;
    await store.writeJson('profile.${p.uid}', p.toJson());
  }

  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      localStoreProvider.overrideWithValue(store),
      authRepositoryProvider.overrideWith(
        (ref) => MockAuthRepository(
          ref.watch(preferencesServiceProvider),
          latency: Duration.zero,
        ),
      ),
    ],
  );
  addTearDown(container.dispose);
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: const HerCircleApp(),
    ),
  );
  // Let the splash screen hand over.
  await tester.pump(SplashScreen.displayDuration);
  await tester.pumpAndSettle();
  return container;
}
