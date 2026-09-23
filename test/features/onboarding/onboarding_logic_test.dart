import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/services/storage/local_store.dart';
import 'package:her_circle/core/services/storage/preferences_service.dart';
import 'package:her_circle/features/auth/data/mock_auth_repository.dart';
import 'package:her_circle/features/auth/presentation/auth_providers.dart';
import 'package:her_circle/features/onboarding/domain/onboarding_status.dart';
import 'package:her_circle/features/onboarding/presentation/onboarding_controller.dart';
import 'package:her_circle/features/onboarding/presentation/quiz/quiz_controller.dart';
import 'package:her_circle/features/onboarding/presentation/quiz/quiz_draft.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/profile/domain/user_profile.dart';
import 'package:her_circle/features/profile/presentation/user_profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('OnboardingStatus.resolve', () {
    const flagsDone = OnboardingFlags(introSeen: true, languageChosen: true);

    test('walks intro → language → auth for signed-out users', () {
      expect(
        OnboardingStatus.resolve(
          flags: const OnboardingFlags(),
          user: null,
          profile: null,
        ),
        OnboardingStatus.needsIntro,
      );
      expect(
        OnboardingStatus.resolve(
          flags: const OnboardingFlags(introSeen: true),
          user: null,
          profile: null,
        ),
        OnboardingStatus.needsLanguage,
      );
      expect(
        OnboardingStatus.resolve(flags: flagsDone, user: null, profile: null),
        OnboardingStatus.needsAuth,
      );
    });

    test('signed-in users need the quiz, then are done', () {
      expect(
        OnboardingStatus.resolve(
          flags: flagsDone,
          user: testUser,
          profile: null,
        ),
        OnboardingStatus.needsQuiz,
      );
      expect(
        OnboardingStatus.resolve(
          flags: flagsDone,
          user: testUser,
          profile: testProfile,
        ),
        OnboardingStatus.complete,
      );
    });

    test('under-16s see the Moms & Daughters offer once', () {
      final teen = testProfile.copyWith(ageGroup: AgeGroup.age10to15);
      expect(
        OnboardingStatus.resolve(
          flags: flagsDone,
          user: testUser,
          profile: teen,
        ),
        OnboardingStatus.needsFamilyOffer,
      );
      expect(
        OnboardingStatus.resolve(
          flags: const OnboardingFlags(
            introSeen: true,
            languageChosen: true,
            familyOfferSeen: true,
          ),
          user: testUser,
          profile: teen,
        ),
        OnboardingStatus.complete,
      );
    });
  });

  group('personalization rules', () {
    test('teens only get age-appropriate stages and no 18+ interests', () {
      expect(AgeGroup.age10to15.lifeStages, [
        LifeStage.firstPeriod,
        LifeStage.trackingCycle,
      ]);
      expect(
        Interest.availableFor(AgeGroup.age10to15),
        isNot(contains(Interest.intimacy)),
      );
      expect(
        Interest.availableFor(AgeGroup.age25to34),
        contains(Interest.intimacy),
      );
    });

    test('every age band offers at least two stages', () {
      for (final group in AgeGroup.values) {
        expect(group.lifeStages.length, greaterThanOrEqualTo(2));
      }
    });

    test('UserProfile survives a JSON round trip', () {
      final profile = testProfile.copyWith(
        lastPeriodStart: DateTime(2026, 9, 1),
        interests: [Interest.nutrition, Interest.intimacy],
      );
      expect(UserProfile.fromJson(profile.toJson()), profile);
    });
  });

  group('QuizController', () {
    late ProviderContainer container;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          localStoreProvider.overrideWithValue(InMemoryLocalStore()),
          authRepositoryProvider.overrideWith(
            (ref) => MockAuthRepository(
              ref.watch(preferencesServiceProvider),
              latency: Duration.zero,
            ),
          ),
        ],
      );
      addTearDown(container.dispose);
      // Keep the auto-dispose controller alive between reads.
      container.listen(quizControllerProvider, (_, _) {});
    });

    QuizController quiz() => container.read(quizControllerProvider.notifier);
    QuizDraft draft() => container.read(quizControllerProvider);

    test('cannot continue without the required answers', () {
      quiz().next();
      expect(draft().step, QuizDraft.ageStep);
      quiz()
        ..selectAgeGroup(AgeGroup.age25to34)
        ..next();
      expect(draft().step, QuizDraft.stageStep);
      quiz().next();
      expect(draft().step, QuizDraft.stageStep);
    });

    test('changing age drops answers that no longer fit', () {
      quiz()
        ..selectAgeGroup(AgeGroup.age25to34)
        ..selectLifeStage(LifeStage.pregnant)
        ..toggleInterest(Interest.intimacy)
        ..selectAgeGroup(AgeGroup.age10to15);
      expect(draft().lifeStage, isNull);
      expect(draft().interests, isNot(contains(Interest.intimacy)));
    });

    test('stage pre-selects interests; cycle length is clamped', () {
      quiz()
        ..selectAgeGroup(AgeGroup.age25to34)
        ..selectLifeStage(LifeStage.tryingToConceive)
        ..setCycleLength(99);
      expect(draft().interests, contains(Interest.fertility));
      expect(draft().cycleLength, UserProfile.maxCycleLength);
    });

    test('finish saves the profile and completes onboarding', () async {
      await container
          .read(authRepositoryProvider)
          .signInWithEmail(email: 'a@b.kz', password: 'password1');
      final period = DateTime(2026, 9, 10);
      quiz()
        ..selectAgeGroup(AgeGroup.age35to44)
        ..selectLifeStage(LifeStage.trackingCycle)
        ..setLastPeriodStart(period)
        ..setCycleLength(30);
      await quiz().finish();

      final saved = container.read(userProfileControllerProvider)!;
      expect(saved.lifeStage, LifeStage.trackingCycle);
      expect(saved.lastPeriodStart, period);
      expect(saved.cycleLength, 30);
      expect(saved.interests, [Interest.cycleHealth]);
    });

    test('skipping the cycle step saves no cycle data', () async {
      await container
          .read(authRepositoryProvider)
          .signInWithEmail(email: 'a@b.kz', password: 'password1');
      quiz()
        ..selectAgeGroup(AgeGroup.age25to34)
        ..selectLifeStage(LifeStage.trackingCycle)
        ..setLastPeriodStart(DateTime(2026, 9))
        ..skipCycleStep();
      expect(draft().step, QuizDraft.interestsStep);
      await quiz().finish();

      final saved = container.read(userProfileControllerProvider)!;
      expect(saved.lastPeriodStart, isNull);
      expect(saved.cycleLength, isNull);
    });

    test('pregnancy keeps the date but asks no cycle length', () async {
      await container
          .read(authRepositoryProvider)
          .signInWithEmail(email: 'a@b.kz', password: 'password1');
      quiz()
        ..selectAgeGroup(AgeGroup.age25to34)
        ..selectLifeStage(LifeStage.pregnant)
        ..setLastPeriodStart(DateTime(2026, 5, 1));
      await quiz().finish();

      final saved = container.read(userProfileControllerProvider)!;
      expect(saved.lastPeriodStart, DateTime(2026, 5, 1));
      expect(saved.cycleLength, isNull);
      expect(
        container.read(onboardingStatusProvider),
        OnboardingStatus.complete,
      );
    });
  });
}
