import 'package:flutter/material.dart';

import '../../../core/l10n/l10n.dart';
import '../domain/share_scope.dart';
import '../domain/support_tips.dart';

extension ShareScopeLabel on ShareScope {
  String label(AppLocalizations l10n) => switch (this) {
    ShareScope.lifeStage => l10n.scopeLifeStage,
    ShareScope.cyclePhase => l10n.scopeCyclePhase,
    ShareScope.mood => l10n.scopeMood,
    ShareScope.pregnancy => l10n.scopePregnancy,
    ShareScope.symptoms => l10n.scopeSymptoms,
  };

  IconData get icon => switch (this) {
    ShareScope.lifeStage => Icons.person_outline_rounded,
    ShareScope.cyclePhase => Icons.calendar_month_outlined,
    ShareScope.mood => Icons.mood_outlined,
    ShareScope.pregnancy => Icons.pregnant_woman_rounded,
    ShareScope.symptoms => Icons.healing_outlined,
  };
}

extension SupportTipLabel on SupportTip {
  String label(AppLocalizations l10n) => switch (this) {
    SupportTip.periodComfort => l10n.supportTipPeriodComfort,
    SupportTip.periodPatience => l10n.supportTipPeriodPatience,
    SupportTip.follicularPlans => l10n.supportTipFollicularPlans,
    SupportTip.fertileHonesty => l10n.supportTipFertileHonesty,
    SupportTip.lutealCalm => l10n.supportTipLutealCalm,
    SupportTip.pregnancyChores => l10n.supportTipPregnancyChores,
    SupportTip.pregnancyAppointments => l10n.supportTipPregnancyAppointments,
    SupportTip.postpartumNight => l10n.supportTipPostpartumNight,
    SupportTip.postpartumAsk => l10n.supportTipPostpartumAsk,
    SupportTip.menopauseCool => l10n.supportTipMenopauseCool,
    SupportTip.lowMoodListen => l10n.supportTipLowMoodListen,
    SupportTip.greatMoodCelebrate => l10n.supportTipGreatMoodCelebrate,
    SupportTip.general => l10n.supportTipGeneral,
  };
}
