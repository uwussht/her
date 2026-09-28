import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../domain/personalization.dart';
import 'personalization_labels.dart';
import 'user_profile_controller.dart';

/// Changing her life stage, which also switches the tracker mode and the feed.
class LifeStageSheet extends ConsumerWidget {
  const LifeStageSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => const LifeStageSheet(),
    );
  }

  Future<void> _select(
    BuildContext context,
    WidgetRef ref,
    LifeStage stage,
  ) async {
    final profile = ref.read(userProfileControllerProvider);
    if (profile == null) return;
    final messenger = ScaffoldMessenger.of(context);
    final saved = context.l10n.profileStageSaved;
    final navigator = Navigator.of(context);
    await ref
        .read(userProfileControllerProvider.notifier)
        .save(profile.copyWith(lifeStage: stage));
    navigator.pop();
    messenger.showSnackBar(SnackBar(content: Text(saved)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final profile = ref.watch(userProfileControllerProvider);
    // Teens are only offered the stages that make sense for them, as in the
    // onboarding quiz.
    final stages = profile?.ageGroup.lifeStages ?? LifeStage.values;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          0,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.profileChangeStage, style: context.textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            for (final stage in stages)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: OptionCard(
                  title: stage.label(l10n),
                  subtitle: stage.description(l10n),
                  icon: stage.icon,
                  selected: profile?.lifeStage == stage,
                  onTap: () => _select(context, ref, stage),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
