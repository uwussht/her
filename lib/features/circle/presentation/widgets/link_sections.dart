import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../learn/presentation/learn_providers.dart';
import '../../domain/circle_link.dart';
import '../../domain/invite_code.dart';
import '../circle_providers.dart';
import 'invite_card.dart';
import 'partner_summary_card.dart';
import 'sharing_switches.dart';

/// The empty state: what the link is for, and the two ways into it.
class LinkIntro extends ConsumerWidget {
  const LinkIntro({
    required this.icon,
    required this.body,
    required this.kind,
    required this.createLabel,
    super.key,
  });

  final IconData icon;
  final String body;
  final LinkKind kind;
  final String createLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Column(
      children: [
        IconBubble(icon: icon, size: AppSizes.illustration),
        const SizedBox(height: AppSpacing.md),
        Text(
          body,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.lg),
        LoadingButton(
          label: createLabel,
          icon: Icons.qr_code_2_rounded,
          onPressed: () =>
              ref.read(circleControllerProvider.notifier).createInvite(kind),
        ),
        const SizedBox(height: AppSpacing.xs),
        TextButton.icon(
          onPressed: () => context.push(AppRoutes.circleJoin(kind.name)),
          icon: const Icon(Icons.keyboard_rounded),
          label: Text(l10n.circleJoinCta),
        ),
      ],
    );
  }
}

/// Where the link has got to: still waiting, or connected and to whom.
class LinkStatusCard extends ConsumerWidget {
  const LinkStatusCard({required this.link, super.key});

  final CircleLink link;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    if (link.isPending) {
      return Column(
        children: [
          InviteCard(code: InviteCode(link.code)),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            color: context.palette.warningContainer,
            elevated: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.circleWaitingTitle,
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  l10n.circleWaitingBody,
                  style: context.textTheme.bodySmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: OutlinedButton.icon(
                    onPressed: () => ref
                        .read(circleControllerProvider.notifier)
                        .markAcceptedForDemo(link.id),
                    icon: const Icon(Icons.science_outlined),
                    label: Text(l10n.circleDemoAccept),
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(l10n.circleDemoNote, style: context.textTheme.labelSmall),
              ],
            ),
          ),
        ],
      );
    }

    final linkedAt = link.linkedAt;
    return AppCard(
      child: Row(
        children: [
          IconBubble(
            icon: link.kind == LinkKind.partner
                ? Icons.favorite_rounded
                : Icons.family_restroom_rounded,
            tone: AppTone.green,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  link.peerName ??
                      (link.kind == LinkKind.partner
                          ? l10n.partnerTitle
                          : l10n.familyTitle),
                  style: context.textTheme.titleMedium,
                ),
                if (linkedAt != null)
                  Text(
                    l10n.circleLinkedOn(
                      DateFormat.yMMMMd(ref.watch(localeTagProvider))
                          .format(linkedAt),
                    ),
                    style: context.textTheme.bodySmall,
                  ),
              ],
            ),
          ),
          IconButton(
            tooltip: l10n.circlePeerNameLabel,
            onPressed: () => _rename(context, ref),
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
    );
  }

  Future<void> _rename(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final controller = TextEditingController(text: link.peerName ?? '');
    final name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.circlePeerNameLabel),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(hintText: l10n.circlePeerNameHint),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: Text(l10n.actionSave),
          ),
        ],
      ),
    );
    controller.dispose();
    if (name == null) return;
    await ref
        .read(circleControllerProvider.notifier)
        .setPeerName(link.id, name);
  }
}

/// Her switches, wired to the controller.
class SharingSection extends ConsumerWidget {
  const SharingSection({required this.link, super.key});

  final CircleLink link;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(circleControllerProvider.notifier);
    return SharingSwitches(
      link: link,
      onChanged: (scope, on) => controller.setScope(link.id, scope, on: on),
      onStopAll: () => controller.stopSharing(link.id),
    );
  }
}

/// The viewer's side: what she has shared with this device.
class PeerSummarySection extends ConsumerWidget {
  const PeerSummarySection({required this.link, super.key});

  final CircleLink link;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final summary = ref.watch(peerSummaryProvider(link.id));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.circlePeerTitle, style: context.textTheme.titleMedium),
        const SizedBox(height: AppSpacing.xs),
        switch (summary) {
          AsyncValue(:final value?) => PartnerSummaryCard(
            summary: value,
            localeTag: ref.watch(localeTagProvider),
          ),
          AsyncValue(hasError: true) => AppCard(
            child: Text(
              l10n.circleJoinNetwork,
              style: context.textTheme.bodyMedium,
            ),
          ),
          _ => const SkeletonCard(),
        },
        const SizedBox(height: AppSpacing.xs),
        Text(l10n.circlePeerDemoNote, style: context.textTheme.labelSmall),
      ],
    );
  }
}

/// Unlinking, with a confirmation that says what changes.
class UnlinkButton extends ConsumerWidget {
  const UnlinkButton({required this.link, super.key});

  final CircleLink link;

  Future<void> _confirm(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.circleUnlinkTitle),
        content: Text(
          link.isSharer
              ? l10n.circleUnlinkBodySharer
              : l10n.circleUnlinkBodyViewer,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.circleUnlink),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(circleControllerProvider.notifier).unlink(link.id);
    messenger.showSnackBar(SnackBar(content: Text(l10n.circleUnlinked)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: context.colors.error),
        onPressed: () => _confirm(context, ref),
        icon: const Icon(Icons.link_off_rounded),
        label: Text(context.l10n.circleUnlink),
      ),
    );
  }
}
