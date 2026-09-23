import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/presentation/auth_providers.dart';
import '../../../profile/domain/personalization.dart';
import '../../../profile/domain/user_profile.dart';
import '../../../profile/presentation/user_profile_controller.dart';
import 'quiz_draft.dart';

part 'quiz_controller.g.dart';

@riverpod
class QuizController extends _$QuizController {
  @override
  QuizDraft build() => const QuizDraft();

  void selectAgeGroup(AgeGroup ageGroup) {
    final stage = state.lifeStage;
    state = state.copyWith(
      ageGroup: ageGroup,
      // Drop answers that don't fit the new age band.
      lifeStage: stage != null && ageGroup.lifeStages.contains(stage)
          ? stage
          : null,
      interests: state.interests
          .where(Interest.availableFor(ageGroup).contains)
          .toSet(),
    );
  }

  void selectLifeStage(LifeStage stage) {
    state = state.copyWith(
      lifeStage: stage,
      interests: {
        ...state.interests,
        ...stage.suggestedInterests,
      }.where(Interest.availableFor(state.ageGroup).contains).toSet(),
    );
  }

  void setLastPeriodStart(DateTime date) =>
      state = state.copyWith(lastPeriodStart: date, cycleSkipped: false);

  void setCycleLength(int days) => state = state.copyWith(
    cycleLength: days.clamp(
      UserProfile.minCycleLength,
      UserProfile.maxCycleLength,
    ),
    cycleSkipped: false,
  );

  void toggleInterest(Interest interest) {
    final next = {...state.interests};
    if (!next.remove(interest)) next.add(interest);
    state = state.copyWith(interests: next);
  }

  void next() {
    if (!state.canContinue || state.isLastStep) return;
    state = state.copyWith(step: state.step + 1);
  }

  /// Returns false when already on the first step.
  bool back() {
    if (state.step == 0) return false;
    state = state.copyWith(step: state.step - 1);
    return true;
  }

  /// Step 3 is optional.
  void skipCycleStep() {
    state = state.copyWith(
      cycleSkipped: true,
      lastPeriodStart: null,
      step: QuizDraft.interestsStep,
    );
  }

  /// Saves the profile. The router then moves on automatically.
  Future<void> finish() async {
    final user = ref.read(currentUserProvider);
    final draft = state;
    if (user == null || draft.ageGroup == null || draft.lifeStage == null) {
      return;
    }
    final asksCycle = draft.lifeStage!.asksCycleLength && !draft.cycleSkipped;
    await ref
        .read(userProfileControllerProvider.notifier)
        .save(
          UserProfile(
            uid: user.uid,
            ageGroup: draft.ageGroup!,
            lifeStage: draft.lifeStage!,
            lastPeriodStart: draft.cycleSkipped ? null : draft.lastPeriodStart,
            cycleLength: asksCycle ? draft.cycleLength : null,
            interests: Interest.values.where(draft.interests.contains).toList(),
            createdAt: DateTime.now(),
          ),
        );
  }
}
