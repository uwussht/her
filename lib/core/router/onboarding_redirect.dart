import '../../features/onboarding/domain/onboarding_status.dart';
import 'app_routes.dart';

/// Sends the user to the onboarding step they still have to finish, and
/// keeps finished users out of onboarding. Pure, so it's unit-tested.
String? onboardingRedirect(String location, OnboardingStatus status) {
  // The splash screen navigates away by itself.
  if (location == AppRoutes.splash) return null;

  final target = switch (status) {
    OnboardingStatus.needsIntro => AppRoutes.intro,
    OnboardingStatus.needsLanguage => AppRoutes.language,
    OnboardingStatus.needsAuth => AppRoutes.auth,
    OnboardingStatus.needsQuiz => AppRoutes.quiz,
    OnboardingStatus.needsFamilyOffer => AppRoutes.familyOffer,
    OnboardingStatus.complete => null,
  };

  if (target == null) {
    return AppRoutes.onboarding.any((path) => _isWithin(location, path))
        ? AppRoutes.home
        : null;
  }
  return _isWithin(location, target) ? null : target;
}

bool _isWithin(String location, String path) =>
    location == path || location.startsWith('$path/');
