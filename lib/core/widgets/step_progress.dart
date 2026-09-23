import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../utils/context_extensions.dart';

/// "Step 2 of 4" label with a rounded progress bar.
class StepProgress extends StatelessWidget {
  const StepProgress({required this.step, required this.total, super.key});

  /// 1-based.
  final int step;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.quizStepOf(step, total),
          style: context.textTheme.labelMedium,
        ),
        const SizedBox(height: AppSpacing.xs),
        ClipRRect(
          borderRadius: AppRadius.pillBorder,
          child: TweenAnimationBuilder<double>(
            tween: Tween(end: step / total),
            duration: const Duration(milliseconds: 300),
            builder: (context, value, _) =>
                LinearProgressIndicator(value: value, minHeight: AppSpacing.xs),
          ),
        ),
      ],
    );
  }
}
