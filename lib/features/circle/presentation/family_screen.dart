import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/presentation/widgets/content_list_tile.dart';
import '../domain/circle_link.dart';
import 'circle_providers.dart';
import 'widgets/link_sections.dart';

/// Moms & Daughters (spec 5.8): the link, the shared lessons, and the promise
/// that the daughter's tracker stays hers.
class FamilyScreen extends ConsumerWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final link = ref.watch(linkOfKindProvider(LinkKind.family));
    final lessons = ref.watch(sharedFamilyLessonsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.familyTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: [
          if (link == null)
            LinkIntro(
              icon: Icons.family_restroom_rounded,
              body: l10n.familyIntroBody,
              kind: LinkKind.family,
              createLabel: l10n.circleCreateInvite,
            )
          else ...[
            LinkStatusCard(link: link),
            const SizedBox(height: AppSpacing.md),
            if (link.isSharer)
              SharingSection(link: link)
            else
              PeerSummarySection(link: link),
            const SizedBox(height: AppSpacing.md),
            UnlinkButton(link: link),
          ],
          const SizedBox(height: AppSpacing.md),
          DisclaimerCard(text: l10n.familyPrivacyNote),
          const SizedBox(height: AppSpacing.lg),
          SectionHeader(
            title: l10n.familyLessonsTitle,
            padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
          ),
          Text(l10n.familyLessonsBody, style: context.textTheme.bodySmall),
          const SizedBox(height: AppSpacing.xs),
          for (final lesson in lessons)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: ContentListTile(
                item: lesson,
                onTap: () => context.push(AppRoutes.learnItem(lesson.id)),
              ),
            ),
        ],
      ),
    );
  }
}
