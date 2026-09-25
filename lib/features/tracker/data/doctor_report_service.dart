import 'dart:typed_data';

import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_utils.dart';
import '../../profile/domain/user_profile.dart';
import '../domain/cycle.dart';
import '../domain/cycle_timeline.dart';
import '../domain/daily_log.dart';

/// Labels the report needs, supplied by the presentation layer so this file
/// holds no user-facing copy of its own.
typedef ReportLabels = ({
  String Function(Object value) flow,
  String Function(Object value) mood,
  String Function(Object value) energy,
  String Function(Object value) symptom,
  String Function(Object value) lifeStage,
  String Function(Object value) ageGroup,
});

/// Builds the "report for your doctor" PDF.
///
/// Everything is rendered from local data; nothing is uploaded. The caller
/// shares or saves the returned bytes.
class DoctorReportService {
  const DoctorReportService();

  /// How many recent daily logs to include, so the PDF stays a few pages.
  static const int maxLogRows = 90;

  static const String fontAsset = 'assets/google_fonts/Nunito-Regular.ttf';
  static const String boldFontAsset = 'assets/google_fonts/Nunito-Bold.ttf';

  Future<Uint8List> build({
    required AppLocalizations l10n,
    required String localeTag,
    required CycleTimeline timeline,
    required UserProfile? profile,
    required ReportLabels labels,
    DateTime? now,
  }) async {
    final generatedAt = now ?? DateTime.now();
    final dayFormat = DateFormat.yMMMd(localeTag);
    final theme = pw.ThemeData.withFont(
      base: pw.Font.ttf(await _load(fontAsset)),
      bold: pw.Font.ttf(await _load(boldFontAsset)),
    );

    final document = pw.Document(
      title: l10n.reportHeading,
      author: l10n.appTitle,
    );

    document.addPage(
      pw.MultiPage(
        theme: theme,
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        header: (context) => context.pageNumber == 1
            ? pw.SizedBox.shrink()
            : pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 12),
                child: pw.Text(
                  l10n.reportHeading,
                  style: pw.TextStyle(color: _muted, fontSize: 10),
                ),
              ),
        footer: (context) => pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '${context.pageNumber} / ${context.pagesCount}',
            style: pw.TextStyle(color: _muted, fontSize: 9),
          ),
        ),
        build: (context) => [
          _title(l10n, dayFormat.format(generatedAt)),
          pw.SizedBox(height: 20),
          if (profile != null) ...[
            _section(l10n.reportProfileSection),
            _rows([
              (l10n.profileAgeGroup, labels.ageGroup(profile.ageGroup)),
              (l10n.profileLifeStage, labels.lifeStage(profile.lifeStage)),
            ]),
            pw.SizedBox(height: 16),
          ],
          _section(l10n.reportSummary),
          _summary(l10n, timeline, dayFormat),
          pw.SizedBox(height: 16),
          if (timeline.cycles.isNotEmpty) ...[
            _section(l10n.reportCyclesSection),
            _cyclesTable(l10n, timeline.cycles, dayFormat),
            pw.SizedBox(height: 16),
          ],
          if (timeline.logs.isNotEmpty) ...[
            _section(l10n.reportLogsSection),
            _logsTable(l10n, timeline.logs, dayFormat, labels),
            pw.SizedBox(height: 16),
          ],
          _disclaimer(l10n),
        ],
      ),
    );

    return document.save();
  }

  static Future<ByteData> _load(String asset) => rootBundle.load(asset);

  // Brand colours, so the PDF looks like the app.
  static PdfColor get _pink => PdfColor.fromInt(AppColors.primary.toARGB32());
  static PdfColor get _ink =>
      PdfColor.fromInt(AppColors.textPrimary.toARGB32());
  static PdfColor get _muted =>
      PdfColor.fromInt(AppColors.textSecondary.toARGB32());
  static PdfColor get _tint =>
      PdfColor.fromInt(AppColors.primaryContainer.toARGB32());

  pw.Widget _title(AppLocalizations l10n, String date) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          l10n.reportHeading,
          style: pw.TextStyle(
            fontSize: 22,
            fontWeight: pw.FontWeight.bold,
            color: _pink,
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          l10n.reportGeneratedOn(date),
          style: pw.TextStyle(fontSize: 10, color: _muted),
        ),
      ],
    );
  }

  pw.Widget _section(String title) => pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 8),
    child: pw.Text(
      title,
      style: pw.TextStyle(
        fontSize: 13,
        fontWeight: pw.FontWeight.bold,
        color: _ink,
      ),
    ),
  );

  pw.Widget _rows(List<(String, String)> rows) {
    return pw.Column(
      children: [
        for (final (label, value) in rows)
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 4),
            child: pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Text(
                    label,
                    style: pw.TextStyle(fontSize: 10, color: _muted),
                  ),
                ),
                pw.Text(value, style: const pw.TextStyle(fontSize: 10)),
              ],
            ),
          ),
      ],
    );
  }

  pw.Widget _summary(
    AppLocalizations l10n,
    CycleTimeline timeline,
    DateFormat dayFormat,
  ) {
    final prediction = timeline.prediction;
    final dash = l10n.reportDash;
    return _rows([
      (
        l10n.reportAverageCycleLength,
        prediction == null
            ? dash
            : l10n.reportDays(prediction.averageCycleLength),
      ),
      (
        l10n.reportAveragePeriodLength,
        prediction == null
            ? dash
            : l10n.reportDays(prediction.averagePeriodLength),
      ),
      (
        l10n.reportLastPeriodStart,
        timeline.currentCycle == null
            ? dash
            : dayFormat.format(timeline.currentCycle!.startDate),
      ),
      (
        l10n.reportNextPredicted,
        prediction == null
            ? dash
            : dayFormat.format(prediction.nextPeriodStart),
      ),
      if (prediction != null)
        (
          l10n.confidenceEstimated,
          l10n.confidenceBasis(
            prediction.basedOnCycles,
            prediction.variationInDays,
          ),
        ),
    ]);
  }

  pw.Widget _cyclesTable(
    AppLocalizations l10n,
    List<Cycle> cycles,
    DateFormat dayFormat,
  ) {
    final rows = <List<String>>[];
    for (var i = cycles.length - 1; i >= 0; i--) {
      final cycle = cycles[i];
      final next = i + 1 < cycles.length ? cycles[i + 1] : null;
      final cycleLength = next == null
          ? null
          : cycle.startDate.daysUntil(next.startDate);
      rows.add([
        dayFormat.format(cycle.startDate),
        cycleLength == null ? l10n.reportDash : l10n.reportDays(cycleLength),
        cycle.periodLength == null
            ? l10n.reportDash
            : l10n.reportDays(cycle.periodLength!),
      ]);
    }
    return _table(
      headers: [
        l10n.reportColumnStart,
        l10n.reportColumnCycleLength,
        l10n.reportColumnPeriodLength,
      ],
      rows: rows,
    );
  }

  pw.Widget _logsTable(
    AppLocalizations l10n,
    Map<DateTime, DailyLog> logs,
    DateFormat dayFormat,
    ReportLabels labels,
  ) {
    final sorted = logs.values.toList()
      ..sort((a, b) => b.date.compareTo(a.date));
    final dash = l10n.reportDash;
    return _table(
      headers: [
        l10n.reportColumnDate,
        l10n.reportColumnFlow,
        l10n.reportColumnMood,
        l10n.reportColumnEnergy,
        l10n.reportColumnSleep,
        l10n.reportColumnSymptoms,
        l10n.reportColumnNotes,
      ],
      columnFlex: const [2, 2, 2, 2, 1, 4, 4],
      rows: [
        for (final log in sorted.take(maxLogRows))
          [
            dayFormat.format(log.date),
            log.flow == null ? dash : labels.flow(log.flow!),
            log.mood == null ? dash : labels.mood(log.mood!),
            log.energy == null ? dash : labels.energy(log.energy!),
            log.sleepHours == null
                ? dash
                : l10n.logSleepHours(_formatHours(log.sleepHours!)),
            log.symptoms.isEmpty
                ? dash
                : log.symptoms.map(labels.symptom).join(', '),
            log.notes?.trim().isNotEmpty ?? false ? log.notes!.trim() : dash,
          ],
      ],
    );
  }

  pw.Widget _table({
    required List<String> headers,
    required List<List<String>> rows,
    List<int>? columnFlex,
  }) {
    return pw.TableHelper.fromTextArray(
      headers: headers,
      data: rows,
      border: null,
      headerStyle: pw.TextStyle(
        fontSize: 9,
        fontWeight: pw.FontWeight.bold,
        color: _ink,
      ),
      headerDecoration: pw.BoxDecoration(color: _tint),
      cellStyle: const pw.TextStyle(fontSize: 9),
      cellHeight: 18,
      cellPadding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      cellAlignment: pw.Alignment.centerLeft,
      oddRowDecoration: pw.BoxDecoration(
        color: PdfColor.fromInt(AppColors.surfaceMuted.toARGB32()),
      ),
      columnWidths: columnFlex == null
          ? null
          : {
              for (var i = 0; i < columnFlex.length; i++)
                i: pw.FlexColumnWidth(columnFlex[i].toDouble()),
            },
    );
  }

  pw.Widget _disclaimer(AppLocalizations l10n) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(10),
      decoration: pw.BoxDecoration(
        color: PdfColor.fromInt(AppColors.warningContainer.toARGB32()),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Text(
        '${l10n.predictionDisclaimer}\n${l10n.medicalDisclaimer}',
        style: pw.TextStyle(fontSize: 9, color: _ink),
      ),
    );
  }

  /// "7.5" or "8", never "8.0".
  static String _formatHours(double hours) => hours == hours.roundToDouble()
      ? hours.toStringAsFixed(0)
      : hours.toStringAsFixed(1);
}
