import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../profile/domain/personalization.dart';
import '../../../profile/domain/user_profile.dart';

part 'quiz_draft.freezed.dart';

/// In-progress quiz answers.
@freezed
abstract class QuizDraft with _$QuizDraft {
  const factory QuizDraft({
    @Default(0) int step,
    AgeGroup? ageGroup,
    LifeStage? lifeStage,
    DateTime? lastPeriodStart,
    @Default(UserProfile.defaultCycleLength) int cycleLength,
    @Default(false) bool cycleSkipped,
    @Default(<Interest>{}) Set<Interest> interests,
  }) = _QuizDraft;

  const QuizDraft._();

  static const int stepCount = 4;
  static const int ageStep = 0;
  static const int stageStep = 1;
  static const int cycleStep = 2;
  static const int interestsStep = 3;

  bool get isLastStep => step == stepCount - 1;

  bool get canContinue => switch (step) {
    ageStep => ageGroup != null,
    stageStep => lifeStage != null,
    _ => true,
  };
}
