import '../../profile/domain/personalization.dart';

/// Which starter questions to offer, by life stage.
///
/// The enum keeps the wording in the ARB files; this only decides what to
/// show and in what order.
enum SuggestedQuestion {
  cycleLength,
  periodPain,
  moodSwings,
  firstPeriod,
  padsOrTampons,
  fertileDays,
  conceiveFaster,
  pregnancySafeFood,
  babyMovements,
  postpartumRecovery,
  breastfeedingPain,
  hotFlashes,
  menopauseSleep,
  ironFoods;

  /// Questions worth offering for [stage], most relevant first.
  static List<SuggestedQuestion> forStage(LifeStage? stage) {
    final list = switch (stage) {
      LifeStage.firstPeriod => [
        SuggestedQuestion.firstPeriod,
        SuggestedQuestion.padsOrTampons,
        SuggestedQuestion.periodPain,
        SuggestedQuestion.cycleLength,
      ],
      LifeStage.trackingCycle => [
        SuggestedQuestion.cycleLength,
        SuggestedQuestion.periodPain,
        SuggestedQuestion.moodSwings,
        SuggestedQuestion.ironFoods,
      ],
      LifeStage.tryingToConceive => [
        SuggestedQuestion.fertileDays,
        SuggestedQuestion.conceiveFaster,
        SuggestedQuestion.cycleLength,
      ],
      LifeStage.pregnant => [
        SuggestedQuestion.pregnancySafeFood,
        SuggestedQuestion.babyMovements,
        SuggestedQuestion.ironFoods,
      ],
      LifeStage.postpartum => [
        SuggestedQuestion.postpartumRecovery,
        SuggestedQuestion.breastfeedingPain,
        SuggestedQuestion.moodSwings,
      ],
      LifeStage.perimenopause || LifeStage.menopause => [
        SuggestedQuestion.hotFlashes,
        SuggestedQuestion.menopauseSleep,
        SuggestedQuestion.moodSwings,
      ],
      null => [
        SuggestedQuestion.cycleLength,
        SuggestedQuestion.periodPain,
        SuggestedQuestion.moodSwings,
      ],
    };
    return list;
  }

  /// Under-16s are never offered the adult-leaning starters.
  static List<SuggestedQuestion> forProfile({
    AgeGroup? ageGroup,
    LifeStage? stage,
  }) {
    final questions = forStage(stage);
    if (!(ageGroup?.isUnder16 ?? false)) return questions;
    return [
      for (final question in questions)
        if (question != SuggestedQuestion.conceiveFaster &&
            question != SuggestedQuestion.fertileDays)
          question,
    ];
  }
}
