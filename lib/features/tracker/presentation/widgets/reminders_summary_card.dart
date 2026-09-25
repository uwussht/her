import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../reminders_controller.dart';
import '../tracker_labels.dart';
import '../tracker_providers.dart';

/// Shows the next reminder and opens the reminders screen.
class RemindersSummaryCard extends ConsumerWidget {
  const RemindersSummaryCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final next = ref
        .watch(reminderSchedulerProvider)
        .build(
          reminders: ref.watch(remindersControllerProvider),
          texts: L10nReminderTexts(l10n),
          prediction: ref.watch(cyclePredictionProvider),
          vaccinations: ref.watch(vaccinationsControllerProvider),
        );
    final soonest = next.isEmpty
        ? null
        : next.reduce((a, b) => a.when.isBefore(b.when) ? a : b);

    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          const IconBubble(icon: Icons.notifications_active_rounded, size: 44),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.remindersTitle, style: context.textTheme.titleMedium),
                const SizedBox(height: 2),
                Text(
                  soonest == null
                      ? l10n.reminderNone
                      : l10n.reminderNext(
                          '${soonest.title} · '
                          '${DateFormat.MMMd(locale).add_Hm().format(soonest.when)}',
                        ),
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }
}
