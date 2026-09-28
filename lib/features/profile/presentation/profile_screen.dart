import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/services/storage/preferences_service.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../auth/domain/app_user.dart';
import '../../auth/domain/kz_phone.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../circle/domain/circle_link.dart';
import '../../circle/presentation/circle_providers.dart';
import '../../home/presentation/home_providers.dart';
import '../../learn/presentation/learn_providers.dart';
import '../../premium/domain/premium_status.dart';
import '../../premium/presentation/premium_controller.dart';
import 'life_stage_sheet.dart';
import 'personalization_labels.dart';
import 'user_profile_controller.dart';

/// Her account: who she is, premium, her circle, her learning, settings.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static String? _identity(AppUser? user) {
    if (user == null) return null;
    final phone = user.phoneNumber;
    return user.displayName ??
        (phone != null ? KzPhone.formatE164(phone) : user.email);
  }

  Future<void> _confirmSignOut(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(l10n.profileSignOutConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.profileSignOut),
          ),
        ],
      ),
    );
    if (confirmed ?? false) {
      await ref.read(authRepositoryProvider).signOut();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final user = ref.watch(currentUserProvider);
    final profile = ref.watch(userProfileControllerProvider);
    final identity = _identity(user);
    final membership = ref.watch(premiumControllerProvider);
    final hasPremium = ref.watch(hasPremiumProvider);
    // She asked for Moms & Daughters during onboarding but has not linked yet.
    final familyPending =
        ref.watch(preferencesServiceProvider).familyLinkRequested &&
        ref.watch(linkOfKindProvider(LinkKind.family)) == null;
    final certificates = ref
        .watch(courseProgressControllerProvider)
        .values
        .where((progress) => progress.completedAt != null)
        .length;
    final savedCount = ref.watch(bookmarksControllerProvider).length;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navProfile)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSizes.fabClearance,
        ),
        children: [
          AppCard(
            child: Row(
              children: [
                const IconBubble(
                  icon: Icons.person_rounded,
                  size: AppSizes.avatar,
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        identity ?? l10n.profileGuest,
                        style: context.textTheme.titleLarge,
                      ),
                      if (profile != null) ...[
                        const SizedBox(height: AppSpacing.xs),
                        Wrap(
                          spacing: AppSpacing.xs,
                          runSpacing: AppSpacing.xxs,
                          children: [
                            PillBadge(
                              label: profile.lifeStage.label(l10n),
                              icon: profile.lifeStage.icon,
                            ),
                            PillBadge(
                              label: profile.ageGroup.label(l10n),
                              tone: AppTone.green,
                            ),
                            if (hasPremium)
                              PillBadge(
                                label: l10n.badgePremium,
                                icon: Icons.workspace_premium_rounded,
                                tone: AppTone.warning,
                              ),
                          ],
                        ),
                      ] else ...[
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          l10n.profileGuestSubtitle,
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (profile != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton.icon(
                onPressed: () => LifeStageSheet.show(context),
                icon: const Icon(Icons.swap_horiz_rounded),
                label: Text(l10n.profileChangeStage),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          AppCard(
            padding: EdgeInsets.zero,
            child: ListTile(
              leading: Icon(
                Icons.workspace_premium_rounded,
                color: context.palette.warning,
              ),
              title: Text(l10n.premiumTitle),
              subtitle: Text(switch (membership.status) {
                PremiumStatus.free => l10n.premiumPitch,
                PremiumStatus.trial => l10n.premiumTrialLeft(
                  membership.trialDaysLeft(DateTime.now()),
                ),
                PremiumStatus.active => l10n.premiumActive,
              }),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(AppRoutes.premium),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SectionHeader(
            title: l10n.circleTitle,
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          ),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.favorite_outline_rounded),
                  title: Text(l10n.partnerTitle),
                  subtitle: Text(l10n.circleSubtitle),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push(AppRoutes.circlePartner),
                ),
                const Divider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                ListTile(
                  leading: const Icon(Icons.family_restroom_outlined),
                  title: Text(l10n.familyTitle),
                  subtitle: familyPending ? Text(l10n.familyLinkWaiting) : null,
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push(AppRoutes.circleFamily),
                ),
                const Divider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                ListTile(
                  leading: const Icon(Icons.card_giftcard_outlined),
                  title: Text(l10n.referralTitle),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push(AppRoutes.referrals),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SectionHeader(
            title: l10n.profileMyLearning,
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          ),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.bookmark_border_rounded),
                  title: Text(l10n.profileSaved),
                  subtitle: savedCount == 0 ? null : Text('$savedCount'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push(AppRoutes.saved),
                ),
                const Divider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                ListTile(
                  leading: const Icon(Icons.workspace_premium_outlined),
                  title: Text(l10n.profileCertificates),
                  subtitle: certificates == 0
                      ? null
                      : Text(l10n.certificatesCount(certificates)),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push(AppRoutes.certificates),
                ),
                const Divider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                ListTile(
                  leading: const Icon(Icons.receipt_long_outlined),
                  title: Text(l10n.ordersTitle),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push(AppRoutes.orders),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications_outlined),
                  title: Text(l10n.remindersTitle),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push(AppRoutes.reminders),
                ),
                const Divider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: Text(l10n.settingsTitle),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push(AppRoutes.settings),
                ),
                if (user != null) ...[
                  const Divider(
                    indent: AppSpacing.md,
                    endIndent: AppSpacing.md,
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout_rounded),
                    title: Text(l10n.profileSignOut),
                    onTap: () => _confirmSignOut(context, ref),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
