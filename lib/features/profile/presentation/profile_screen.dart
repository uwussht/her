import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../auth/domain/app_user.dart';
import '../../auth/domain/kz_phone.dart';
import '../../auth/presentation/auth_providers.dart';
import 'personalization_labels.dart';
import 'user_profile_controller.dart';

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
          const SizedBox(height: AppSpacing.md),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
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
