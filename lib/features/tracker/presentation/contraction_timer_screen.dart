import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/presentation/learn_providers.dart';
import 'pregnancy_providers.dart';
import 'widgets/duration_text.dart';

/// Timing contractions (spec 5.4), with the 5-1-1 prompt.
class ContractionTimerScreen extends ConsumerWidget {
  const ContractionTimerScreen({super.key});

  Future<void> _clear(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    await ref.read(contractionControllerProvider.notifier).clear();
    messenger.showSnackBar(SnackBar(content: Text(l10n.contractionCleared)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final controller = ref.watch(contractionControllerProvider.notifier);
    ref.watch(contractionControllerProvider);
    // Rebuilds the running duration once a second.
    ref.watch(tickerProvider);
    final now = DateTime.now();
    final running = controller.running;
    final stats = ref.watch(contractionStatsProvider(now));
    final history = controller.history;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.contractionTitle),
        actions: [
          if (history.isNotEmpty)
            IconButton(
              tooltip: l10n.contractionClear,
              onPressed: () => _clear(context, ref),
              icon: const Icon(Icons.delete_sweep_outlined),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: [
          Text(l10n.contractionBody, style: context.textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            child: Column(
              children: [
                Text(
                  running == null
                      ? formatStopwatch(Duration.zero)
                      : formatStopwatch(running.duration(now)),
                  style: context.textTheme.displayMedium?.copyWith(
                    color: running == null
                        ? context.colors.onSurface
                        : context.colors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                LoadingButton(
                  label: running == null
                      ? l10n.contractionStart
                      : l10n.contractionStop,
                  icon: running == null
                      ? Icons.play_arrow_rounded
                      : Icons.stop_rounded,
                  onPressed: () => controller.toggle(),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.contractionCountHour(stats.count),
                  style: context.textTheme.titleMedium,
                ),
                if (stats.averageDuration != null)
                  Text(
                    l10n.contractionAverageDuration(
                      formatStopwatch(stats.averageDuration!),
                    ),
                    style: context.textTheme.bodyMedium,
                  ),
                if (stats.averageInterval != null)
                  Text(
                    l10n.contractionAverageInterval(
                      formatStopwatch(stats.averageInterval!),
                    ),
                    style: context.textTheme.bodyMedium,
                  ),
                if (stats.count == 0)
                  Text(
                    l10n.contractionEmpty,
                    style: context.textTheme.bodySmall,
                  ),
              ],
            ),
          ),
          if (stats.matchesFiveOneOne) ...[
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
                      l10n.contractionCallNow,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (history.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            SectionHeader(
              title: l10n.contractionHistoryTitle,
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            ),
            for (final contraction in history)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
                child: AppCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.xs,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          DateFormat.Hms(ref.watch(localeTagProvider))
                              .format(contraction.startedAt),
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                      Text(
                        formatStopwatch(contraction.duration(now)),
                        style: context.textTheme.bodyLarge,
                      ),
                      IconButton(
                        tooltip: l10n.trackerRemoveDay,
                        onPressed: () => controller.remove(contraction.id),
                        icon: const Icon(Icons.delete_outline_rounded),
                      ),
                    ],
                  ),
                ),
              ),
          ],
          const SizedBox(height: AppSpacing.md),
          const DisclaimerCard(),
        ],
      ),
    );
  }
}
