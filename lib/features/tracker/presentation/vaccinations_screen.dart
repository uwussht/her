import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/widgets/widgets.dart';
import '../domain/vaccination.dart';
import 'reminders_controller.dart';
import 'tracker_labels.dart';

/// Her vaccination plan: suggested by age and stage, fully editable.
class VaccinationsScreen extends ConsumerWidget {
  const VaccinationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final vaccinations = ref.watch(vaccinationsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.vaccinationsTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: [
          Text(
            l10n.vaccinationsSubtitle,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.palette.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          DisclaimerCard(text: l10n.vaccinationsDisclaimer),
          const SizedBox(height: AppSpacing.md),
          for (final vaccination in vaccinations) ...[
            _VaccinationTile(vaccination: vaccination),
            const SizedBox(height: AppSpacing.sm),
          ],
          const SizedBox(height: AppSpacing.xs),
          OutlinedButton.icon(
            onPressed: () => _addVaccination(context, ref),
            icon: const Icon(Icons.add_rounded),
            label: Text(l10n.actionAdd),
          ),
        ],
      ),
    );
  }

  Future<void> _addVaccination(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final code = await showModalBottomSheet<VaccineCode>(
      context: context,
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                l10n.vaccinationsTitle,
                style: context.textTheme.titleMedium,
              ),
            ),
            for (final code in VaccineCode.values)
              ListTile(
                leading: const Icon(Icons.vaccines_outlined),
                title: Text(code.label(l10n)),
                onTap: () => Navigator.of(context).pop(code),
              ),
          ],
        ),
      ),
    );
    if (code == null || !context.mounted) return;
    final now = today();
    final date = await showDatePicker(
      context: context,
      initialDate: now.addDays(30),
      firstDate: now,
      lastDate: DateTime(now.year + 5, now.month, now.day),
      helpText: l10n.vaccinationDue(''),
    );
    if (date == null) return;
    await ref
        .read(vaccinationsControllerProvider.notifier)
        .add(code: code, dueDate: date);
  }
}

class _VaccinationTile extends ConsumerWidget {
  const _VaccinationTile({required this.vaccination});

  final Vaccination vaccination;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final controller = ref.read(vaccinationsControllerProvider.notifier);
    final isOverdue =
        vaccination.isOpen && vaccination.dueDate.isBefore(today());

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconBubble(
                icon: Icons.vaccines_rounded,
                size: 40,
                tone: vaccination.isOpen ? AppTone.pink : AppTone.green,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vaccination.code.label(l10n),
                      style: context.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.vaccinationDue(
                        DateFormat.yMMMd(locale).format(vaccination.dueDate),
                      ),
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              PillBadge(
                label: isOverdue
                    ? l10n.vaccinationOverdue
                    : vaccination.status.label(l10n),
                tone: switch (vaccination.status) {
                  VaccinationStatus.done => AppTone.green,
                  VaccinationStatus.skipped => AppTone.pink,
                  VaccinationStatus.planned =>
                    isOverdue ? AppTone.warning : AppTone.pink,
                },
              ),
            ],
          ),
          const Divider(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.xs,
            children: [
              if (vaccination.isOpen) ...[
                TextButton.icon(
                  onPressed: () =>
                      controller.setStatus(vaccination, VaccinationStatus.done),
                  icon: const Icon(Icons.check_circle_outline_rounded),
                  label: Text(l10n.vaccinationMarkDone),
                ),
                TextButton(
                  onPressed: () => _changeDate(context, ref),
                  child: Text(l10n.vaccinationChangeDate),
                ),
                TextButton(
                  onPressed: () => _remind(context, ref),
                  child: Text(l10n.vaccinationRemind),
                ),
              ] else
                TextButton.icon(
                  onPressed: () => controller.setStatus(
                    vaccination,
                    VaccinationStatus.planned,
                  ),
                  icon: const Icon(Icons.undo_rounded),
                  label: Text(l10n.vaccinationRestore),
                ),
              if (vaccination.isOpen)
                TextButton(
                  onPressed: () => controller.setStatus(
                    vaccination,
                    VaccinationStatus.skipped,
                  ),
                  child: Text(l10n.vaccinationSkip),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _changeDate(BuildContext context, WidgetRef ref) async {
    final now = today();
    final date = await showDatePicker(
      context: context,
      initialDate: vaccination.dueDate.isBefore(now)
          ? now
          : vaccination.dueDate,
      firstDate: now.addDays(-365),
      lastDate: DateTime(now.year + 5, now.month, now.day),
      helpText: context.l10n.vaccinationChangeDate,
    );
    if (date == null) return;
    await ref
        .read(vaccinationsControllerProvider.notifier)
        .setDueDate(vaccination, date);
  }

  Future<void> _remind(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    final message = context.l10n.vaccinationReminderAdded;
    await ref
        .read(remindersControllerProvider.notifier)
        .addVaccinationReminder(vaccination);
    messenger.showSnackBar(SnackBar(content: Text(message)));
  }
}
