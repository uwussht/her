import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography for Her Circle, built on Nunito.
///
/// Nunito's rounded terminals feel warm without looking childish, and the
/// bundled files (assets/google_fonts/) cover the full Kazakh Cyrillic set.
abstract final class AppTextStyles {
  /// Builds the app [TextTheme] in the given text colours.
  static TextTheme textTheme({
    required Color primary,
    required Color secondary,
  }) {
    final base = TextTheme(
      displayLarge: _style(40, FontWeight.w800, primary, height: 1.15),
      displayMedium: _style(34, FontWeight.w800, primary, height: 1.15),
      displaySmall: _style(28, FontWeight.w800, primary, height: 1.2),
      headlineLarge: _style(26, FontWeight.w800, primary, height: 1.25),
      headlineMedium: _style(22, FontWeight.w700, primary, height: 1.25),
      headlineSmall: _style(20, FontWeight.w700, primary, height: 1.3),
      titleLarge: _style(18, FontWeight.w700, primary, height: 1.3),
      titleMedium: _style(16, FontWeight.w700, primary, height: 1.35),
      titleSmall: _style(14, FontWeight.w700, primary, height: 1.35),
      bodyLarge: _style(16, FontWeight.w500, primary, height: 1.5),
      bodyMedium: _style(14, FontWeight.w500, primary, height: 1.5),
      bodySmall: _style(12, FontWeight.w500, secondary, height: 1.45),
      labelLarge: _style(15, FontWeight.w700, primary, letterSpacing: 0.2),
      labelMedium: _style(13, FontWeight.w600, secondary, letterSpacing: 0.2),
      labelSmall: _style(11, FontWeight.w600, secondary, letterSpacing: 0.3),
    );
    return GoogleFonts.nunitoTextTheme(base);
  }

  static TextStyle _style(
    double size,
    FontWeight weight,
    Color color, {
    double? height,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
