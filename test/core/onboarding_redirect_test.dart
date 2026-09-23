import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/router/app_routes.dart';
import 'package:her_circle/core/router/onboarding_redirect.dart';
import 'package:her_circle/features/onboarding/domain/onboarding_status.dart';

void main() {
  test('splash is never redirected', () {
    for (final status in OnboardingStatus.values) {
      expect(onboardingRedirect(AppRoutes.splash, status), isNull);
    }
  });

  test('unfinished users are sent to their current step', () {
    expect(
      onboardingRedirect(AppRoutes.home, OnboardingStatus.needsIntro),
      AppRoutes.intro,
    );
    expect(
      onboardingRedirect(AppRoutes.intro, OnboardingStatus.needsLanguage),
      AppRoutes.language,
    );
    expect(
      onboardingRedirect(AppRoutes.settings, OnboardingStatus.needsAuth),
      AppRoutes.auth,
    );
    expect(
      onboardingRedirect(AppRoutes.authOtp, OnboardingStatus.needsQuiz),
      AppRoutes.quiz,
    );
    expect(
      onboardingRedirect(AppRoutes.quiz, OnboardingStatus.needsFamilyOffer),
      AppRoutes.familyOffer,
    );
  });

  test('sub-routes of the current step are allowed', () {
    expect(
      onboardingRedirect(AppRoutes.authPhone, OnboardingStatus.needsAuth),
      isNull,
    );
    expect(
      onboardingRedirect(AppRoutes.authEmail, OnboardingStatus.needsAuth),
      isNull,
    );
  });

  test('finished users are kept out of onboarding only', () {
    const done = OnboardingStatus.complete;
    expect(onboardingRedirect(AppRoutes.auth, done), AppRoutes.home);
    expect(onboardingRedirect(AppRoutes.authPhone, done), AppRoutes.home);
    expect(onboardingRedirect(AppRoutes.quiz, done), AppRoutes.home);
    expect(onboardingRedirect(AppRoutes.shop, done), isNull);
    expect(onboardingRedirect(AppRoutes.settings, done), isNull);
    // Prefix match must respect path segments.
    expect(onboardingRedirect('/authors', done), isNull);
  });
}
