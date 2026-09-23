import '../../auth/domain/app_user.dart';
import '../../profile/domain/user_profile.dart';

/// Device-level onboarding progress.
class OnboardingFlags {
  const OnboardingFlags({
    this.introSeen = false,
    this.languageChosen = false,
    this.familyOfferSeen = false,
  });

  final bool introSeen;
  final bool languageChosen;
  final bool familyOfferSeen;

  OnboardingFlags copyWith({
    bool? introSeen,
    bool? languageChosen,
    bool? familyOfferSeen,
  }) {
    return OnboardingFlags(
      introSeen: introSeen ?? this.introSeen,
      languageChosen: languageChosen ?? this.languageChosen,
      familyOfferSeen: familyOfferSeen ?? this.familyOfferSeen,
    );
  }
}

/// The next onboarding step the user has to complete.
enum OnboardingStatus {
  needsIntro,
  needsLanguage,
  needsAuth,
  needsQuiz,
  needsFamilyOffer,
  complete;

  static OnboardingStatus resolve({
    required OnboardingFlags flags,
    required AppUser? user,
    required UserProfile? profile,
  }) {
    if (user == null) {
      if (!flags.introSeen) return needsIntro;
      if (!flags.languageChosen) return needsLanguage;
      return needsAuth;
    }
    if (profile == null) return needsQuiz;
    if (profile.ageGroup.isUnder16 && !flags.familyOfferSeen) {
      return needsFamilyOffer;
    }
    return complete;
  }
}
