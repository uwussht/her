import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../domain/suggested_questions.dart';
import '../question_labels.dart';

/// Starter questions for her life stage.
class SuggestionChips extends StatelessWidget {
  const SuggestionChips({
    required this.questions,
    required this.onSelected,
    super.key,
  });

  final List<SuggestedQuestion> questions;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.aiSuggestionsTitle,
          style: context.textTheme.titleSmall,
        ),
        const SizedBox(height: AppSpacing.xs),
        for (final question in questions)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: ActionChip(
                avatar: Icon(
                  Icons.help_outline_rounded,
                  size: AppSizes.iconSm,
                  color: context.colors.primary,
                ),
                label: Text(question.label(context.l10n)),
                onPressed: () => onSelected(question.label(context.l10n)),
              ),
            ),
          ),
      ],
    );
  }
}
