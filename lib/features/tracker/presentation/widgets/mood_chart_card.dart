import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/cycle_timeline.dart';
import '../../domain/tracker_enums.dart';

/// Weekly and monthly mood trend.
class MoodChartCard extends StatefulWidget {
  const MoodChartCard({required this.timeline, super.key});

  final CycleTimeline timeline;

  static const int weekDays = 7;
  static const int monthDays = 30;

  @override
  State<MoodChartCard> createState() => _MoodChartCardState();
}

class _MoodChartCardState extends State<MoodChartCard> {
  bool _monthly = false;

  int get _days => _monthly ? MoodChartCard.monthDays : MoodChartCard.weekDays;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final series = widget.timeline.moodSeries(days: _days);
    final end = today();
    final start = end.addDays(-(_days - 1));

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.moodChartTitle,
                  style: context.textTheme.titleMedium,
                ),
              ),
              SegmentedButton<bool>(
                segments: [
                  ButtonSegment(value: false, label: Text(l10n.moodChartWeek)),
                  ButtonSegment(value: true, label: Text(l10n.moodChartMonth)),
                ],
                selected: {_monthly},
                showSelectedIcon: false,
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onSelectionChanged: (selection) =>
                    setState(() => _monthly = selection.first),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          if (series.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              child: Text(
                l10n.moodChartEmpty,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.palette.textSecondary,
                ),
              ),
            )
          else ...[
            PillBadge(
              label: l10n.moodChartAverage(_average(series)),
              tone: AppTone.green,
              icon: Icons.trending_up_rounded,
            ),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              height: 180,
              child: _MoodChart(
                series: series,
                start: start,
                end: end,
                monthly: _monthly,
              ),
            ),
          ],
        ],
      ),
    );
  }

  static String _average(List<(DateTime, int)> series) {
    final total = series.fold<int>(0, (sum, item) => sum + item.$2);
    return (total / series.length).toStringAsFixed(1);
  }
}

class _MoodChart extends StatelessWidget {
  const _MoodChart({
    required this.series,
    required this.start,
    required this.end,
    required this.monthly,
  });

  final List<(DateTime, int)> series;
  final DateTime start;
  final DateTime end;
  final bool monthly;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final dayLabel = monthly ? DateFormat.Md(locale) : DateFormat.E(locale);
    final maxX = start.daysUntil(end).toDouble();

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: maxX,
        minY: 0.5,
        maxY: 5.5,
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => context.colors.onSurface,
            getTooltipItems: (spots) => [
              for (final spot in spots)
                LineTooltipItem(
                  '${_moodFor(spot.y).emoji} '
                  '${DateFormat.MMMd(locale).format(start.addDays(spot.x.round()))}',
                  context.textTheme.bodySmall!.copyWith(
                    color: context.colors.surface,
                  ),
                ),
            ],
          ),
        ),
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (_) =>
              FlLine(color: context.colors.outlineVariant, strokeWidth: 1),
        ),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 28,
              getTitlesWidget: (value, _) {
                if (value < 1 || value > 5 || value != value.roundToDouble()) {
                  return const SizedBox.shrink();
                }
                return Text(
                  _moodFor(value).emoji,
                  style: const TextStyle(fontSize: 12),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 24,
              interval: monthly ? 7 : 1,
              getTitlesWidget: (value, meta) {
                final date = start.addDays(value.round());
                return Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.xxs),
                  child: Text(
                    dayLabel.format(date),
                    style: context.textTheme.labelSmall,
                  ),
                );
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              for (final (date, score) in series)
                FlSpot(start.daysUntil(date).toDouble(), score.toDouble()),
            ],
            isCurved: true,
            curveSmoothness: 0.25,
            preventCurveOverShooting: true,
            color: context.colors.primary,
            barWidth: 3,
            dotData: FlDotData(
              getDotPainter: (spot, _, _, _) => FlDotCirclePainter(
                radius: 4,
                color: context.colors.surface,
                strokeWidth: 2.5,
                strokeColor: context.colors.primary,
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              color: context.colors.primaryContainer.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  static Mood _moodFor(double score) => Mood.values.firstWhere(
    (mood) => mood.score == score.round(),
    orElse: () => Mood.okay,
  );
}
