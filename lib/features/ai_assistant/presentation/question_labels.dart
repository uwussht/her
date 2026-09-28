import '../../../core/l10n/l10n.dart';
import '../domain/suggested_questions.dart';

extension SuggestedQuestionLabel on SuggestedQuestion {
  /// The question as she reads it, and exactly what gets sent.
  String label(AppLocalizations l10n) => switch (this) {
    SuggestedQuestion.cycleLength => l10n.aiQuestionCycleLength,
    SuggestedQuestion.periodPain => l10n.aiQuestionPeriodPain,
    SuggestedQuestion.moodSwings => l10n.aiQuestionMoodSwings,
    SuggestedQuestion.firstPeriod => l10n.aiQuestionFirstPeriod,
    SuggestedQuestion.padsOrTampons => l10n.aiQuestionPadsOrTampons,
    SuggestedQuestion.fertileDays => l10n.aiQuestionFertileDays,
    SuggestedQuestion.conceiveFaster => l10n.aiQuestionConceiveFaster,
    SuggestedQuestion.pregnancySafeFood => l10n.aiQuestionPregnancySafeFood,
    SuggestedQuestion.babyMovements => l10n.aiQuestionBabyMovements,
    SuggestedQuestion.postpartumRecovery => l10n.aiQuestionPostpartumRecovery,
    SuggestedQuestion.breastfeedingPain => l10n.aiQuestionBreastfeedingPain,
    SuggestedQuestion.hotFlashes => l10n.aiQuestionHotFlashes,
    SuggestedQuestion.menopauseSleep => l10n.aiQuestionMenopauseSleep,
    SuggestedQuestion.ironFoods => l10n.aiQuestionIronFoods,
  };
}
