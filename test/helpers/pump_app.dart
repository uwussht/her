import 'dart:convert';

import 'package:flutter/material.dart' show Size;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:her_circle/app.dart';
import 'package:her_circle/core/services/mock_asset_loader.dart';
import 'package:her_circle/core/services/storage/local_store.dart';
import 'package:her_circle/core/services/storage/preferences_service.dart';
import 'package:her_circle/features/auth/data/mock_auth_repository.dart';
import 'package:her_circle/features/auth/domain/app_user.dart';
import 'package:her_circle/features/ai_assistant/data/mock_ai_service.dart';
import 'package:her_circle/features/ai_assistant/domain/ai_service.dart';
import 'package:her_circle/features/ai_assistant/presentation/ai_providers.dart';
import 'package:her_circle/features/auth/presentation/auth_providers.dart';
import 'package:her_circle/features/circle/data/mock_link_service.dart';
import 'package:her_circle/features/circle/data/mock_peer_snapshot_service.dart';
import 'package:her_circle/features/circle/presentation/circle_providers.dart';
import 'package:her_circle/features/home/presentation/home_providers.dart';
import 'package:her_circle/features/learn/domain/course_progress.dart';
import 'package:her_circle/features/onboarding/presentation/splash_screen.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/profile/domain/user_profile.dart';
import 'package:her_circle/features/shop/domain/payment_service.dart';
import 'package:her_circle/features/shop/presentation/shop_providers.dart';
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
/// opens on Home. Otherwise it starts from the intro. [overrides] are applied
/// last, so a test can swap in its own providers, and [aiService] replaces
/// the mock assistant, e.g. with one that fails.
Future<ProviderContainer> pumpHerCircle(
  WidgetTester tester, {
  bool onboarded = true,
  UserProfile? profile,
  Map<String, Object> prefs = const {},
  Set<String> bookmarks = const {},
  Map<String, List<String>> progress = const {},
  List<Override> overrides = const [],
  AiService? aiService,
}) async {
  GoogleFonts.config.allowRuntimeFetching = false;
  // The default 800x600 test window is neither phone-shaped nor tall enough
  // for these screens, which makes layout-sensitive taps land on the wrong
  // widget. Use a common Android size instead.
  tester.view
    ..devicePixelRatio = phoneDevicePixelRatio
    ..physicalSize = phoneSize * phoneDevicePixelRatio;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final assets = await loadMockAssets(tester);
  SharedPreferences.setMockInitialValues({
    if (onboarded) ...{
      'onboarding.introSeen': true,
      'onboarding.languageChosen': true,
      // Under-16 profiles are otherwise held at the Moms & Daughters offer.
      'onboarding.familyOfferSeen': true,
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

  if (bookmarks.isNotEmpty) {
    await store.writeJson('learn.bookmarks.${testUser.uid}', {
      'ids': bookmarks.toList(),
    });
  }
  if (progress.isNotEmpty) {
    await store.writeJson('learn.progress.${testUser.uid}', {
      'items': [
        for (final entry in progress.entries)
          CourseProgress(
            courseId: entry.key,
            completedLessonIds: entry.value,
            lastLessonId: entry.value.isEmpty ? null : entry.value.last,
            updatedAt: DateTime(2026, 9, 20),
            completedAt: DateTime(2026, 9, 20),
          ).toJson(),
      ],
    });
  }

  final loader = MockAssetLoader.preloaded(assets);
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      localStoreProvider.overrideWithValue(store),
      mockAssetLoaderProvider.overrideWithValue(loader),
      // Instant links and snapshots, for the same reason as payments below.
      linkServiceProvider.overrideWithValue(
        const MockLinkService(latency: Duration.zero),
      ),
      peerSnapshotServiceProvider.overrideWithValue(
        const MockPeerSnapshotService(latency: Duration.zero),
      ),
      // Instant answers, for the same reason as payments below.
      aiServiceProvider.overrideWithValue(
        aiService ?? MockAiService(loader, latency: Duration.zero),
      ),
      // Instant payments: pumpAndSettle does not advance a pending timer.
      paymentServiceProvider.overrideWithValue(
        const MockPaymentService(latency: Duration.zero),
      ),
      authRepositoryProvider.overrideWith(
        (ref) => MockAuthRepository(
          ref.watch(preferencesServiceProvider),
          latency: Duration.zero,
        ),
      ),
      // Per-test overrides come last, so they win.
      ...overrides,
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

/// Reads and decodes the mock JSON up front.
///
/// Asset reads are real file I/O, which does not progress under the test
/// binding's fake clock, so they happen inside [WidgetTester.runAsync] and
/// the decoded data is injected into the app.
Future<Map<String, List<Map<String, dynamic>>>> loadMockAssets(
  WidgetTester tester,
) async {
  final data = <String, List<Map<String, dynamic>>>{};
  await tester.runAsync(() async {
    for (final name in mockAssetNames) {
      data[name] = MockAssetLoader.decodeList(
        await rootBundle.loadString(MockAssetLoader.path(name)),
      );
    }
  });
  return data;
}

/// Logical size of the test window: a mid-range Android phone.
const Size phoneSize = Size(412, 915);
const double phoneDevicePixelRatio = 2.625;

const mockAssetNames = [
  'content',
  'courses',
  'tips',
  'baby_sizes',
  'questions',
  'experts',
  'products',
  'sellers',
  'reviews',
  'ai_answers',
];
