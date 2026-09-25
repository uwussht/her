import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/presentation/content_labels.dart';
import '../../learn/presentation/learn_providers.dart';
import '../../premium/presentation/premium_controller.dart';
import '../domain/qa_state.dart';
import 'qa_controller.dart';
import 'widgets/question_card.dart';

/// Expert Q&A: browse, filter and ask.
class QaScreen extends ConsumerWidget {
  const QaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final filter = ref.watch(qaFilterControllerProvider);
    final controller = ref.read(qaFilterControllerProvider.notifier);
    final results = ref.watch(qaResultsProvider);
    final categories = ref.watch(visibleCategoriesProvider);
    final hasPremium = ref.watch(hasPremiumProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.qaTitle),
        actions: [
          IconButton(
            tooltip: l10n.qaMyQuestions,
            onPressed: controller.toggleMineOnly,
            icon: Icon(
              filter.mineOnly
                  ? Icons.person_rounded
                  : Icons.person_outline_rounded,
              color: filter.mineOnly ? context.colors.primary : null,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'qa-ask',
        onPressed: () => context.push(AppRoutes.qaAsk),
        icon: const Icon(Icons.edit_rounded),
        label: Text(l10n.qaAsk),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: AppSizes.fabClearance),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.xs,
              AppSpacing.md,
              0,
            ),
            child: DisclaimerCard(text: l10n.qaDisclaimer),
          ),
          if (!hasPremium)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.sm,
                AppSpacing.md,
                0,
              ),
              child: AppCard(
                elevated: false,
                color: context.palette.warningContainer,
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Row(
                  children: [
                    Icon(
                      Icons.bolt_rounded,
                      size: AppSizes.iconSm,
                      color: context.palette.warning,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Text(
                        l10n.qaPriorityHint,
                        style: context.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              0,
            ),
            child: Row(
              children: [
                for (final sort in QaSort.values) ...[
                  ChoiceChip(
                    label: Text(_sortLabel(l10n, sort)),
                    selected: filter.sort == sort,
                    onSelected: (_) => controller.setSort(sort),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                ],
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.xs,
              AppSpacing.md,
              0,
            ),
            child: Row(
              children: [
                ChoiceChip(
                  label: Text(l10n.learnAll),
                  selected: filter.category == null,
                  onSelected: (_) => controller.setCategory(null),
                ),
                for (final category in categories) ...[
                  const SizedBox(width: AppSpacing.xs),
                  ChoiceChip(
                    avatar: Icon(category.icon, size: 18),
                    label: Text(category.label(l10n)),
                    selected: filter.category == category,
                    onSelected: (_) => controller.setCategory(category),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          if (results.isEmpty)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                l10n.qaEmpty,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.palette.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            for (final question in results)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  0,
                  AppSpacing.md,
                  AppSpacing.sm,
                ),
                child: QuestionCard(
                  question: question,
                  onTap: () => context.push(AppRoutes.qaQuestion(question.id)),
                ),
              ),
        ],
      ),
    );
  }

  static String _sortLabel(AppLocalizations l10n, QaSort sort) {
    return switch (sort) {
      QaSort.top => l10n.qaSortTop,
      QaSort.newest => l10n.qaSortNew,
      QaSort.unanswered => l10n.qaSortUnanswered,
    };
  }
}
