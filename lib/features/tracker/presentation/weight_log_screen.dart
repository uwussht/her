import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../learn/presentation/learn_providers.dart';
import '../../profile/presentation/user_profile_controller.dart';
import '../domain/weight_entry.dart';
import 'pregnancy_providers.dart';

/// The pregnancy weight log (spec 5.4): the numbers and the trend, no advice.
class WeightLogScreen extends ConsumerStatefulWidget {
  const WeightLogScreen({super.key});

  @override
  ConsumerState<WeightLogScreen> createState() => _WeightLogScreenState();
}

class _WeightLogScreenState extends ConsumerState<WeightLogScreen> {
  final _controller = TextEditingController();
  bool _invalid = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final kg = double.tryParse(_controller.text.replaceAll(',', '.'));
    if (kg == null || kg < WeightEntry.minKg || kg > WeightEntry.maxKg) {
      setState(() => _invalid = true);
      return;
    }
    final messenger = ScaffoldMessenger.of(context);
    final saved = context.l10n.weightSaved;
    setState(() => _invalid = false);
    _controller.clear();
    await ref.read(weightLogControllerProvider.notifier).record(kg);
    if (!mounted) return;
    messenger.showSnackBar(SnackBar(content: Text(saved)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    ref.watch(weightLogControllerProvider);
    final log = ref.watch(weightLogControllerProvider.notifier).log;
    final localeTag = ref.watch(localeTagProvider);
    final numberFormat = NumberFormat('0.#', localeTag);
    final lastPeriod = ref
        .watch(userProfileControllerProvider)
        ?.lastPeriodStart;
    final series = lastPeriod == null
        ? const <(int, double)>[]
        : log.byPregnancyWeek(lastPeriod);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.weightTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: [
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _controller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                  ],
                  decoration: InputDecoration(
                    labelText: l10n.weightLabel,
                    errorText: _invalid ? l10n.weightInvalid : null,
                  ),
                  onSubmitted: (_) => _save(),
                ),
                const SizedBox(height: AppSpacing.sm),
                LoadingButton(
                  label: l10n.weightAdd,
                  icon: Icons.monitor_weight_outlined,
                  onPressed: _save,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          if (log.isEmpty)
            AppCard(
              child: Text(
                l10n.weightEmpty,
                style: context.textTheme.bodyMedium,
              ),
            )
          else ...[
            AppCard(
              color: context.palette.successContainer,
              elevated: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.weightCurrent(numberFormat.format(log.latest!.kg)),
                    style: context.textTheme.titleMedium,
                  ),
                  if (log.totalGainKg != null)
                    Text(
                      l10n.weightGain(numberFormat.format(log.totalGainKg)),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onSurface,
                      ),
                    ),
                  if (log.lastChangeKg != null)
                    Text(
                      l10n.weightChange(numberFormat.format(log.lastChangeKg)),
                      style: context.textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            if (series.length >= 2) ...[
              const SizedBox(height: AppSpacing.md),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.weightChartTitle,
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    SizedBox(
                      height: 180,
                      child: LineChart(
                        LineChartData(
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          titlesData: const FlTitlesData(
                            topTitles: AxisTitles(),
                            rightTitles: AxisTitles(),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 24,
                              ),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                for (final (week, kg) in series)
                                  FlSpot(week.toDouble(), kg),
                              ],
                              isCurved: true,
                              barWidth: 3,
                              color: context.colors.primary,
                              dotData: const FlDotData(show: true),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.md),
            for (final entry in log.entries.reversed)
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
                          DateFormat.yMMMd(localeTag).format(entry.date),
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                      Text(
                        l10n.weightKgValue(numberFormat.format(entry.kg)),
                        style: context.textTheme.bodyLarge,
                      ),
                      IconButton(
                        tooltip: l10n.trackerRemoveDay,
                        onPressed: () => ref
                            .read(weightLogControllerProvider.notifier)
                            .removeOn(entry.date),
                        icon: const Icon(Icons.delete_outline_rounded),
                      ),
                    ],
                  ),
                ),
              ),
          ],
          const SizedBox(height: AppSpacing.md),
          DisclaimerCard(text: l10n.weightDisclaimer),
        ],
      ),
    );
  }
}
