import 'package:flutter/material.dart';

import '../../../../core/l10n/localized_text.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';

/// Renders an article or lesson body, one paragraph per entry.
class ArticleBody extends StatelessWidget {
  const ArticleBody({required this.paragraphs, super.key});

  final List<LocalizedText> paragraphs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final paragraph in paragraphs)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: Text(
              paragraph.of(context),
              style: context.textTheme.bodyLarge?.copyWith(height: 1.6),
            ),
          ),
      ],
    );
  }
}
