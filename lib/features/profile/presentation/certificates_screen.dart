import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../home/presentation/home_providers.dart';
import '../../learn/presentation/learn_providers.dart';

/// Courses she finished, each with its certificate.
class CertificatesScreen extends ConsumerWidget {
  const CertificatesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final progress = ref.watch(courseProgressControllerProvider);
    final courses = ref.watch(coursesProvider).value ?? const [];
    final completed = [
      for (final course in courses)
        if (progress[course.id]?.completedAt != null)
          (course, progress[course.id]!.completedAt!),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileCertificates)),
      body: completed.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: FeaturePlaceholder(
                icon: Icons.workspace_premium_outlined,
                title: l10n.profileCertificates,
                description: l10n.certificatesEmpty,
                tone: AppTone.green,
              ),
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.xs,
                AppSpacing.md,
                AppSpacing.lg,
              ),
              children: [
                for (final (course, completedAt) in completed)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                    child: AppCard(
                      onTap: () =>
                          context.push(AppRoutes.certificate(course.id)),
                      child: Row(
                        children: [
                          const IconBubble(
                            icon: Icons.workspace_premium_rounded,
                            tone: AppTone.green,
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course.title.of(context),
                                  style: context.textTheme.titleMedium,
                                ),
                                Text(
                                  DateFormat.yMMMMd(
                                    ref.watch(localeTagProvider),
                                  ).format(completedAt),
                                  style: context.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
