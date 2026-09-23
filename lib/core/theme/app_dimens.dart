import 'package:flutter/material.dart';

/// Spacing scale. Use these instead of raw numbers for padding and gaps.
abstract final class AppSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  /// Default horizontal padding for screens.
  static const EdgeInsets screen = EdgeInsets.symmetric(horizontal: md);

  /// Default inner padding for cards.
  static const EdgeInsets card = EdgeInsets.all(md);
}

/// Corner radii.
abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;

  /// Cards.
  static const double card = 16;

  /// Bottom sheets and dialogs.
  static const double sheet = 24;

  /// Pill-shaped buttons and chips.
  static const double pill = 999;

  static const BorderRadius cardBorder = BorderRadius.all(
    Radius.circular(card),
  );
  static const BorderRadius sheetTop = BorderRadius.vertical(
    top: Radius.circular(sheet),
  );
  static const BorderRadius pillBorder = BorderRadius.all(
    Radius.circular(pill),
  );
}

/// Component sizes.
abstract final class AppSizes {
  static const double buttonHeight = 52;
  static const double iconSm = 20;
  static const double iconMd = 24;
  static const double iconLg = 32;
  static const double illustration = 96;
  static const double avatar = 56;
  static const double navBarHeight = 72;

  /// Bottom scroll padding so the last item clears the floating AI button.
  static const double fabClearance = 96;
}
