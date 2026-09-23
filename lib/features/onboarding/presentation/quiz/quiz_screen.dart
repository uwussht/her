import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../profile/domain/personalization.dart';
import 'quiz_controller.dart';
import 'quiz_draft.dart';
import 'quiz_steps.dart';

/// Four-step personalization quiz: age, life stage, cycle (optional) and
/// interests.
class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  bool _saving = false;

  QuizController get _controller => ref.read(quizControllerProvider.notifier);

  Future<void> _onPrimary(QuizDraft draft) async {
    if (!draft.isLastStep) {
      _controller.next();
      return;
    }
    setState(() => _saving = true);
    try {
      await _controller.finish();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final draft = ref.watch(quizControllerProvider);
    final stage = draft.lifeStage;

    final (String title, String subtitle, Widget body) = switch (draft.step) {
      QuizDraft.ageStep => (
        l10n.quizAgeTitle,
        l10n.quizAgeSubtitle,
        AgeStep(
          selected: draft.ageGroup,
          onSelected: _controller.selectAgeGroup,
        ),
      ),
      QuizDraft.stageStep => (
        l10n.quizStageTitle,
        l10n.quizStageSubtitle,
        LifeStageStep(
          options: draft.ageGroup?.lifeStages ?? LifeStage.values,
          selected: stage,
          onSelected: _controller.selectLifeStage,
        ),
      ),
      QuizDraft.cycleStep => (
        l10n.quizCycleTitle,
        stage?.isPregnancy ?? false
            ? l10n.quizPregnancySubtitle
            : l10n.quizCycleSubtitle,
        CycleStep(
          lastPeriodStart: draft.lastPeriodStart,
          cycleLength: draft.cycleLength,
          showCycleLength: stage?.asksCycleLength ?? true,
          lookback: (stage ?? LifeStage.trackingCycle).lastPeriodLookback,
          onDateSelected: _controller.setLastPeriodStart,
          onCycleLengthChanged: _controller.setCycleLength,
        ),
      ),
      _ => (
        l10n.quizInterestsTitle,
        l10n.quizInterestsSubtitle,
        InterestsStep(
          options: Interest.availableFor(draft.ageGroup),
          selected: draft.interests,
          onToggle: _controller.toggleInterest,
        ),
      ),
    };

    return PopScope(
      canPop: draft.step == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _controller.back();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: draft.step > 0
              ? BackButton(onPressed: _controller.back)
              : null,
          actions: [
            if (draft.step == QuizDraft.cycleStep)
              TextButton(
                onPressed: _controller.skipCycleStep,
                child: Text(l10n.actionSkip),
              ),
            const SizedBox(width: AppSpacing.xs),
          ],
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: TitledPageLayout(
            key: ValueKey(draft.step),
            header: StepProgress(
              step: draft.step + 1,
              total: QuizDraft.stepCount,
            ),
            title: title,
            subtitle: subtitle,
            bottom: LoadingButton(
              label: draft.isLastStep ? l10n.actionDone : l10n.actionContinue,
              isLoading: _saving,
              onPressed: draft.canContinue ? () => _onPrimary(draft) : null,
            ),
            children: [body],
          ),
        ),
      ),
    );
  }
}
