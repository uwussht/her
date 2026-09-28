import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../domain/circle_link.dart';
import 'circle_providers.dart';
import 'widgets/link_sections.dart';

/// Partner account (spec 5.7): the invite, her sharing switches, the preview
/// of what he sees, and unlinking.
class PartnerScreen extends ConsumerWidget {
  const PartnerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final link = ref.watch(linkOfKindProvider(LinkKind.partner));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.partnerTitle)),
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
              icon: Icons.favorite_rounded,
              body: l10n.partnerIntroBody,
              kind: LinkKind.partner,
              createLabel: l10n.circleCreateInvite,
            )
          else ...[
            LinkStatusCard(link: link),
            const SizedBox(height: AppSpacing.md),
            if (link.isSharer) ...[
              SharingSection(link: link),
              const SizedBox(height: AppSpacing.md),
              OutlinedButton.icon(
                onPressed: () => context.push(AppRoutes.circlePartnerPreview),
                icon: const Icon(Icons.visibility_outlined),
                label: Text(l10n.circlePreviewCta),
              ),
            ] else
              PeerSummarySection(link: link),
            const SizedBox(height: AppSpacing.md),
            UnlinkButton(link: link),
          ],
        ],
      ),
    );
  }
}
