import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/l10n/l10n.dart';
import '../domain/product.dart';

extension ProductCategoryLabel on ProductCategory {
  String label(AppLocalizations l10n) => switch (this) {
    ProductCategory.periodCare => l10n.shopCategoryPeriodCare,
    ProductCategory.pregnancy => l10n.shopCategoryPregnancy,
    ProductCategory.baby => l10n.shopCategoryBaby,
    ProductCategory.beauty => l10n.shopCategoryBeauty,
    ProductCategory.wellness => l10n.shopCategoryWellness,
    ProductCategory.intimateHealth => l10n.shopCategoryIntimateHealth,
    ProductCategory.subscriptionBox => l10n.shopCategorySubscriptionBox,
  };

  IconData get icon => switch (this) {
    ProductCategory.periodCare => Icons.water_drop_rounded,
    ProductCategory.pregnancy => Icons.pregnant_woman_rounded,
    ProductCategory.baby => Icons.child_friendly_rounded,
    ProductCategory.beauty => Icons.auto_awesome_rounded,
    ProductCategory.wellness => Icons.favorite_rounded,
    ProductCategory.intimateHealth => Icons.spa_rounded,
    ProductCategory.subscriptionBox => Icons.card_giftcard_rounded,
  };
}

/// Formats tenge with thin-space grouping: `15 900 ₸`.
String formatTenge(AppLocalizations l10n, Locale locale, int amount) {
  final formatted = NumberFormat.decimalPattern(locale.toLanguageTag())
      .format(amount)
      // Tenge amounts read better with spaces than with the locale's commas.
      .replaceAll(RegExp(r'[,. ]'), ' ');
  return l10n.priceTenge(formatted);
}
