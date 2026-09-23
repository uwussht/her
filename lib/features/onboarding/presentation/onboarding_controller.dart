import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage/preferences_service.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../domain/onboarding_status.dart';

part 'onboarding_controller.g.dart';

@Riverpod(keepAlive: true)
class OnboardingController extends _$OnboardingController {
  PreferencesService get _prefs => ref.read(preferencesServiceProvider);

  @override
  OnboardingFlags build() {
    final prefs = ref.watch(preferencesServiceProvider);
    return OnboardingFlags(
      introSeen: prefs.introSeen,
      languageChosen: prefs.languageChosen,
      familyOfferSeen: prefs.familyOfferSeen,
    );
  }

  Future<void> completeIntro() async {
    await _prefs.setIntroSeen();
    state = state.copyWith(introSeen: true);
  }

  Future<void> completeLanguage() async {
    await _prefs.setLanguageChosen();
    state = state.copyWith(languageChosen: true);
  }

  Future<void> completeFamilyOffer({required bool linkRequested}) async {
    if (linkRequested) await _prefs.setFamilyLinkRequested();
    await _prefs.setFamilyOfferSeen();
    state = state.copyWith(familyOfferSeen: true);
  }
}

@Riverpod(keepAlive: true)
OnboardingStatus onboardingStatus(Ref ref) {
  return OnboardingStatus.resolve(
    flags: ref.watch(onboardingControllerProvider),
    user: ref.watch(currentUserProvider),
    profile: ref.watch(userProfileControllerProvider),
  );
}
