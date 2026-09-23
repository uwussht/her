import 'package:flutter/material.dart';

import '../utils/context_extensions.dart';

/// Colour role for accent widgets.
///
/// Pink is for brand and cycle elements. Green is for health, wellness and
/// success.
enum AppTone {
  pink,
  green,
  warning;

  Color foreground(BuildContext context) => switch (this) {
    AppTone.pink => context.colors.primary,
    AppTone.green => context.colors.secondary,
    AppTone.warning => context.palette.warning,
  };

  Color background(BuildContext context) => switch (this) {
    AppTone.pink => context.colors.primaryContainer,
    AppTone.green => context.colors.secondaryContainer,
    AppTone.warning => context.palette.warningContainer,
  };
}
