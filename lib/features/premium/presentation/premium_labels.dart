import 'package:flutter/material.dart';

import '../../../core/l10n/l10n.dart';
import '../domain/premium_benefit.dart';
import '../domain/premium_plan.dart';

extension PremiumBenefitLabel on PremiumBenefit {
  String label(AppLocalizations l10n) => switch (this) {
    PremiumBenefit.fullCourses => l10n.premiumBenefitFullCourses,
    PremiumBenefit.unlimitedAi => l10n.premiumBenefitUnlimitedAi,
    PremiumBenefit.priorityQa => l10n.premiumBenefitPriorityQa,
    PremiumBenefit.advancedInsights => l10n.premiumBenefitAdvancedInsights,
    PremiumBenefit.noAds => l10n.premiumBenefitNoAds,
  };

  String description(AppLocalizations l10n) => switch (this) {
    PremiumBenefit.fullCourses => l10n.premiumBenefitFullCoursesDesc,
    PremiumBenefit.unlimitedAi => l10n.premiumBenefitUnlimitedAiDesc,
    PremiumBenefit.priorityQa => l10n.premiumBenefitPriorityQaDesc,
    PremiumBenefit.advancedInsights => l10n.premiumBenefitAdvancedInsightsDesc,
    PremiumBenefit.noAds => l10n.premiumBenefitNoAdsDesc,
  };

  IconData get icon => switch (this) {
    PremiumBenefit.fullCourses => Icons.school_rounded,
    PremiumBenefit.unlimitedAi => Icons.auto_awesome_rounded,
    PremiumBenefit.priorityQa => Icons.verified_rounded,
    PremiumBenefit.advancedInsights => Icons.insights_rounded,
    PremiumBenefit.noAds => Icons.block_rounded,
  };
}

extension PremiumPlanLabel on PremiumPlan {
  String label(AppLocalizations l10n) => switch (this) {
    PremiumPlan.monthly => l10n.premiumPlanMonthly,
    PremiumPlan.yearly => l10n.premiumPlanYearly,
  };
}
