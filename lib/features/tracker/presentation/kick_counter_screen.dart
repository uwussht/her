import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/presentation/learn_providers.dart';
import '../domain/kick_session.dart';
import 'pregnancy_providers.dart';
import 'widgets/duration_text.dart';

/// Counting the baby's movements (spec 5.4).
class KickCounterScreen extends ConsumerWidget {
  const KickCounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final controller = ref.watch(kickCounterControllerProvider.notifier);
    ref.watch(kickCounterControllerProvider);
    // Rebuilds the elapsed time once a second while a session is open.
    ref.watch(tickerProvider);
    final now = DateTime.now();
    final history = controller.history;
    // The running session, or the last one, so the count she just finished
    // stays on screen instead of snapping back to zero.
    final session =
        controller.running ?? (history.isEmpty ? null : history.first);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.kickTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: [
          Text(l10n.kickBody, style: context.textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            child: Column(
              children: [
                Text(
                  l10n.kickProgress(
                    session?.count ?? 0,
                    KickSession.targetKicks,
                  ),
                  style: context.textTheme.displaySmall?.copyWith(
                    color: context.colors.primary,
                  ),
                ),
                if (session != null && session.isRunning)
                  Text(
                    l10n.kickElapsed(formatStopwatch(session.elapsed(now))),
                    style: context.textTheme.bodySmall,
                  ),
                const SizedBox(height: AppSpacing.md),
                LoadingButton(
                  label: l10n.kickTap,
                  icon: Icons.child_care_rounded,
                  onPressed: () => controller.kick(),
                ),
                if (session != null && session.isRunning) ...[
                  const SizedBox(height: AppSpacing.xs),
                  TextButton.icon(
                    onPressed: () => controller.stop(),
                    icon: const Icon(Icons.stop_rounded),
                    label: Text(l10n.kickStop),
                  ),
                ],
              ],
            ),
          ),
          if (session != null &&
              session.isRunning &&
              session.needsAttention(now)) ...[
            const SizedBox(height: AppSpacing.md),
            AppCard(
              color: context.colors.errorContainer,
              elevated: false,
              child: Row(
                children: [
                  Icon(Icons.emergency_rounded, color: context.colors.error),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      l10n.kickSlow,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (history.isNotEmpty && history.first.isComplete) ...[
            const SizedBox(height: AppSpacing.md),
            AppCard(
              color: context.palette.successContainer,
              elevated: false,
              child: Text(
                l10n.kickDone,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.lg),
          SectionHeader(
            title: l10n.kickHistoryTitle,
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          ),
          if (history.isEmpty)
            Text(l10n.kickEmpty, style: context.textTheme.bodySmall)
          else
            for (final past in history)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: AppCard(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.kickSessionSummary(
                                past.count,
                                formatStopwatch(past.elapsed(now)),
                              ),
                              style: context.textTheme.bodyLarge,
                            ),
                            Text(
                              DateFormat.MMMd(ref.watch(localeTagProvider))
                                  .add_Hm()
                                  .format(past.startedAt),
                              style: context.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: l10n.trackerRemoveDay,
                        onPressed: () => controller.remove(past.id),
                        icon: const Icon(Icons.delete_outline_rounded),
                      ),
                    ],
                  ),
                ),
              ),
          const SizedBox(height: AppSpacing.md),
          const DisclaimerCard(),
        ],
      ),
    );
  }
}
