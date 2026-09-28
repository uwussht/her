import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../learn/presentation/learn_providers.dart';
import '../domain/circle_link.dart';
import 'circle_providers.dart';
import 'widgets/partner_summary_card.dart';

/// "See what your partner sees", built from her real data through her real
/// switches — the only honest way to show her what she is sharing.
class PartnerPreviewScreen extends ConsumerWidget {
  const PartnerPreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final link = ref.watch(linkOfKindProvider(LinkKind.partner));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.circlePreviewTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: [
          if (link == null)
            Text(l10n.circlePreviewEmpty, style: context.textTheme.bodyMedium)
          else
            PartnerSummaryCard(
              summary: ref.watch(sharedSummaryProvider(link.id)),
              localeTag: ref.watch(localeTagProvider),
              emptyMessage: l10n.circlePreviewEmpty,
            ),
        ],
      ),
    );
  }
}
