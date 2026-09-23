import 'package:flutter/material.dart';

/// Raw colour tokens for Her Circle.
///
/// This is the only file in the app allowed to contain colour literals.
/// Widgets must read colours through `Theme.of(context).colorScheme` or the
/// [AppPalette] theme extension, never from literals.
abstract final class AppColors {
  // Brand — pink
  static const Color primary = Color(0xFFE75A8C);
  static const Color primaryLight = Color(0xFFF8BBD0);
  static const Color primaryContainer = Color(0xFFFDE4EC);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFF5C1230);

  // Health & wellness — green
  static const Color secondary = Color(0xFF3FA37A);
  static const Color secondaryLight = Color(0xFFA8DCC4);
  static const Color secondaryContainer = Color(0xFFE3F4EC);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFF0F3D2A);

  // Neutrals
  static const Color background = Color(0xFFFFF8FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFFBF1F5);
  static const Color outline = Color(0xFFE8D5DD);
  static const Color textPrimary = Color(0xFF2B1B24);
  static const Color textSecondary = Color(0xFF7A6570);

  // Status
  static const Color error = Color(0xFFD64545);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFBE3E3);
  static const Color warning = Color(0xFFF2A541);
  static const Color warningContainer = Color(0xFFFDF0DC);

  // Shadows
  static const Color shadow = Color(0x142B1B24);

  // Dark theme (optional): deep plum with the same pink & green accents.
  static const Color darkBackground = Color(0xFF1E1418);
  static const Color darkSurface = Color(0xFF2A1D23);
  static const Color darkSurfaceMuted = Color(0xFF34252C);
  static const Color darkOutline = Color(0xFF4A3740);
  static const Color darkTextPrimary = Color(0xFFF7EAF0);
  static const Color darkTextSecondary = Color(0xFFC4AEB8);
  static const Color darkPrimaryContainer = Color(0xFF5C1F38);
  static const Color darkOnPrimaryContainer = Color(0xFFFDE4EC);
  static const Color darkSecondaryContainer = Color(0xFF1C4434);
  static const Color darkOnSecondaryContainer = Color(0xFFE3F4EC);
  static const Color darkErrorContainer = Color(0xFF5A1E1E);
  static const Color darkWarningContainer = Color(0xFF4A3414);
  static const Color darkShadow = Color(0x40000000);
}

/// Semantic colours that Material's [ColorScheme] has no slot for.
///
/// Read with `context.palette` (see `core/utils/context_extensions.dart`).
@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.textSecondary,
    required this.success,
    required this.successContainer,
    required this.warning,
    required this.warningContainer,
    required this.period,
    required this.periodContainer,
    required this.fertile,
    required this.fertileContainer,
    required this.ovulation,
    required this.surfaceMuted,
    required this.shadow,
  });

  static const AppPalette light = AppPalette(
    textSecondary: AppColors.textSecondary,
    success: AppColors.secondary,
    successContainer: AppColors.secondaryContainer,
    warning: AppColors.warning,
    warningContainer: AppColors.warningContainer,
    period: AppColors.primary,
    periodContainer: AppColors.primaryContainer,
    fertile: AppColors.secondaryLight,
    fertileContainer: AppColors.secondaryContainer,
    ovulation: AppColors.secondary,
    surfaceMuted: AppColors.surfaceMuted,
    shadow: AppColors.shadow,
  );

  static const AppPalette dark = AppPalette(
    textSecondary: AppColors.darkTextSecondary,
    success: AppColors.secondary,
    successContainer: AppColors.darkSecondaryContainer,
    warning: AppColors.warning,
    warningContainer: AppColors.darkWarningContainer,
    period: AppColors.primary,
    periodContainer: AppColors.darkPrimaryContainer,
    fertile: AppColors.secondaryLight,
    fertileContainer: AppColors.darkSecondaryContainer,
    ovulation: AppColors.secondary,
    surfaceMuted: AppColors.darkSurfaceMuted,
    shadow: AppColors.darkShadow,
  );

  /// Secondary / supporting text.
  final Color textSecondary;

  /// Healthy indicators and success states.
  final Color success;
  final Color successContainer;

  final Color warning;
  final Color warningContainer;

  /// Period days in the cycle calendar and tracker.
  final Color period;
  final Color periodContainer;

  /// Fertile window.
  final Color fertile;
  final Color fertileContainer;

  /// Predicted ovulation day.
  final Color ovulation;

  /// Subtle filled backgrounds (chips, input fields, skeletons).
  final Color surfaceMuted;

  /// Soft card shadow.
  final Color shadow;

  @override
  AppPalette copyWith({
    Color? textSecondary,
    Color? success,
    Color? successContainer,
    Color? warning,
    Color? warningContainer,
    Color? period,
    Color? periodContainer,
    Color? fertile,
    Color? fertileContainer,
    Color? ovulation,
    Color? surfaceMuted,
    Color? shadow,
  }) {
    return AppPalette(
      textSecondary: textSecondary ?? this.textSecondary,
      success: success ?? this.success,
      successContainer: successContainer ?? this.successContainer,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      period: period ?? this.period,
      periodContainer: periodContainer ?? this.periodContainer,
      fertile: fertile ?? this.fertile,
      fertileContainer: fertileContainer ?? this.fertileContainer,
      ovulation: ovulation ?? this.ovulation,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      successContainer: Color.lerp(
        successContainer,
        other.successContainer,
        t,
      )!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(
        warningContainer,
        other.warningContainer,
        t,
      )!,
      period: Color.lerp(period, other.period, t)!,
      periodContainer: Color.lerp(periodContainer, other.periodContainer, t)!,
      fertile: Color.lerp(fertile, other.fertile, t)!,
      fertileContainer: Color.lerp(
        fertileContainer,
        other.fertileContainer,
        t,
      )!,
      ovulation: Color.lerp(ovulation, other.ovulation, t)!,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }
}
