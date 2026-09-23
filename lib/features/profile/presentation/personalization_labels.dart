import 'package:flutter/material.dart';

import '../../../core/l10n/l10n.dart';
import '../domain/personalization.dart';

extension AgeGroupLabel on AgeGroup {
  String label(AppLocalizations l10n) => switch (this) {
    AgeGroup.age10to15 => l10n.ageGroup10to15,
    AgeGroup.age16to24 => l10n.ageGroup16to24,
    AgeGroup.age25to34 => l10n.ageGroup25to34,
    AgeGroup.age35to44 => l10n.ageGroup35to44,
    AgeGroup.age45plus => l10n.ageGroup45plus,
  };
}

extension LifeStageLabel on LifeStage {
  String label(AppLocalizations l10n) => switch (this) {
    LifeStage.firstPeriod => l10n.stageFirstPeriod,
    LifeStage.trackingCycle => l10n.stageTrackingCycle,
    LifeStage.tryingToConceive => l10n.stageTryingToConceive,
    LifeStage.pregnant => l10n.stagePregnant,
    LifeStage.postpartum => l10n.stagePostpartum,
    LifeStage.perimenopause => l10n.stagePerimenopause,
    LifeStage.menopause => l10n.stageMenopause,
  };

  String description(AppLocalizations l10n) => switch (this) {
    LifeStage.firstPeriod => l10n.stageFirstPeriodDesc,
    LifeStage.trackingCycle => l10n.stageTrackingCycleDesc,
    LifeStage.tryingToConceive => l10n.stageTryingToConceiveDesc,
    LifeStage.pregnant => l10n.stagePregnantDesc,
    LifeStage.postpartum => l10n.stagePostpartumDesc,
    LifeStage.perimenopause => l10n.stagePerimenopauseDesc,
    LifeStage.menopause => l10n.stageMenopauseDesc,
  };

  IconData get icon => switch (this) {
    LifeStage.firstPeriod => Icons.spa_rounded,
    LifeStage.trackingCycle => Icons.water_drop_rounded,
    LifeStage.tryingToConceive => Icons.eco_rounded,
    LifeStage.pregnant => Icons.pregnant_woman_rounded,
    LifeStage.postpartum => Icons.child_friendly_rounded,
    LifeStage.perimenopause => Icons.wb_twilight_rounded,
    LifeStage.menopause => Icons.self_improvement_rounded,
  };
}

extension InterestLabel on Interest {
  String label(AppLocalizations l10n) => switch (this) {
    Interest.myBody => l10n.interestMyBody,
    Interest.cycleHealth => l10n.interestCycleHealth,
    Interest.fertility => l10n.interestFertility,
    Interest.pregnancy => l10n.interestPregnancy,
    Interest.babyAndMotherhood => l10n.interestBabyAndMotherhood,
    Interest.menopause => l10n.interestMenopause,
    Interest.mentalHealth => l10n.interestMentalHealth,
    Interest.nutrition => l10n.interestNutrition,
    Interest.fitness => l10n.interestFitness,
    Interest.beauty => l10n.interestBeauty,
    Interest.intimacy => l10n.interestIntimacy,
  };
}
