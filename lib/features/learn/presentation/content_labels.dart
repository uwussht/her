import 'package:flutter/material.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/app_tone.dart';
import '../domain/content_item.dart';

extension ContentCategoryLabel on ContentCategory {
  String label(AppLocalizations l10n) => switch (this) {
    ContentCategory.myBody => l10n.categoryMyBody,
    ContentCategory.cycleHealth => l10n.categoryCycleHealth,
    ContentCategory.pregnancySchool => l10n.categoryPregnancySchool,
    ContentCategory.postpartum => l10n.categoryPostpartum,
    ContentCategory.menopause => l10n.categoryMenopause,
    ContentCategory.mentalHealth => l10n.categoryMentalHealth,
    ContentCategory.nutrition => l10n.categoryNutrition,
    ContentCategory.intimacy => l10n.categoryIntimacy,
  };

  IconData get icon => switch (this) {
    ContentCategory.myBody => Icons.spa_rounded,
    ContentCategory.cycleHealth => Icons.water_drop_rounded,
    ContentCategory.pregnancySchool => Icons.pregnant_woman_rounded,
    ContentCategory.postpartum => Icons.child_friendly_rounded,
    ContentCategory.menopause => Icons.wb_twilight_rounded,
    ContentCategory.mentalHealth => Icons.psychology_rounded,
    ContentCategory.nutrition => Icons.restaurant_rounded,
    ContentCategory.intimacy => Icons.favorite_rounded,
  };

  /// Green for wellness-leaning sections, pink for the cycle and the body.
  AppTone get tone => switch (this) {
    ContentCategory.nutrition ||
    ContentCategory.mentalHealth ||
    ContentCategory.menopause => AppTone.green,
    _ => AppTone.pink,
  };
}

extension ContentTypeLabel on ContentType {
  String label(AppLocalizations l10n) => switch (this) {
    ContentType.video => l10n.contentTypeVideo,
    ContentType.article => l10n.contentTypeArticle,
    ContentType.course => l10n.contentTypeCourse,
    ContentType.podcast => l10n.contentTypePodcast,
  };

  IconData get icon => switch (this) {
    ContentType.video => Icons.play_circle_rounded,
    ContentType.article => Icons.article_rounded,
    ContentType.course => Icons.school_rounded,
    ContentType.podcast => Icons.headphones_rounded,
  };
}

extension AccessTierLabel on AccessTier {
  String label(AppLocalizations l10n) => switch (this) {
    AccessTier.free => l10n.badgeFree,
    AccessTier.premium => l10n.badgePremium,
  };
}
