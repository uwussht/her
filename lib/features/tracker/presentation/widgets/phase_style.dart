import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../domain/tracker_enums.dart';

/// How each cycle phase is drawn. Pink marks bleeding, green marks
/// fertility, and predictions are outlined rather than filled so a forecast
/// never looks like a fact.
@immutable
class PhaseStyle {
  const PhaseStyle({
    required this.background,
    required this.foreground,
    this.dashed = false,
  });

  /// Filled background, or null for no fill.
  final Color? background;
  final Color foreground;

  /// Drawn as an outline instead of a fill.
  final bool dashed;

  static PhaseStyle of(BuildContext context, CyclePhase phase) {
    final palette = context.palette;
    return switch (phase) {
      CyclePhase.period => PhaseStyle(
        background: palette.period,
        foreground: context.colors.onPrimary,
      ),
      CyclePhase.predictedPeriod => PhaseStyle(
        background: palette.periodContainer,
        foreground: palette.period,
        dashed: true,
      ),
      CyclePhase.ovulation => PhaseStyle(
        background: palette.ovulation,
        foreground: context.colors.onSecondary,
      ),
      CyclePhase.fertile => PhaseStyle(
        background: palette.fertileContainer,
        foreground: palette.success,
      ),
      CyclePhase.follicular || CyclePhase.luteal || CyclePhase.unknown =>
        PhaseStyle(background: null, foreground: context.colors.onSurface),
    };
  }

  static String? label(AppLocalizations l10n, CyclePhase phase) =>
      switch (phase) {
        CyclePhase.period => l10n.legendPeriod,
        CyclePhase.predictedPeriod => l10n.legendPredictedPeriod,
        CyclePhase.fertile => l10n.legendFertile,
        CyclePhase.ovulation => l10n.legendOvulation,
        CyclePhase.follicular => l10n.phaseFollicular,
        CyclePhase.luteal => l10n.phaseLuteal,
        CyclePhase.unknown => null,
      };
}
