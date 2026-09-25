import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../home/presentation/home_providers.dart';

/// "Reviewed by Dr …" line with the verified badge.
class ExpertByline extends ConsumerWidget {
  const ExpertByline({required this.expertId, super.key});

  final String? expertId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expert = ref.watch(expertByIdProvider(expertId));
    if (expert == null) return const SizedBox.shrink();
    final l10n = context.l10n;

    return AppCard(
      elevated: false,
      color: context.palette.successContainer,
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        children: [
          const IconBubble(
            icon: Icons.medical_services_rounded,
            tone: AppTone.green,
            size: 40,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        expert.name,
                        style: context.textTheme.titleSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (expert.verified) ...[
                      const SizedBox(width: AppSpacing.xxs),
                      Tooltip(
                        message: l10n.badgeVerifiedDoctor,
                        child: Icon(
                          Icons.verified_rounded,
                          size: AppSizes.iconSm,
                          color: context.colors.secondary,
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  expert.city == null
                      ? expert.specialty.of(context)
                      : l10n.qaExpertOf(
                          expert.specialty.of(context),
                          expert.city!,
                        ),
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
