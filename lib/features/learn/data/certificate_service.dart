import 'dart:typed_data';

import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter/widgets.dart' show Locale;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../domain/course.dart';

/// Builds the PDF certificate awarded for finishing a course.
class CertificateService {
  const CertificateService();

  static const String fontAsset = 'assets/google_fonts/Nunito-Regular.ttf';
  static const String boldFontAsset = 'assets/google_fonts/Nunito-Bold.ttf';

  Future<Uint8List> build({
    required AppLocalizations l10n,
    required String localeTag,
    required Course course,
    required String recipientName,
    required DateTime completedAt,
  }) async {
    final theme = pw.ThemeData.withFont(
      base: pw.Font.ttf(await _load(fontAsset)),
      bold: pw.Font.ttf(await _load(boldFontAsset)),
    );
    final pink = PdfColor.fromInt(AppColors.primary.toARGB32());
    final green = PdfColor.fromInt(AppColors.secondary.toARGB32());
    final ink = PdfColor.fromInt(AppColors.textPrimary.toARGB32());
    final muted = PdfColor.fromInt(AppColors.textSecondary.toARGB32());

    final document = pw.Document(
      title: l10n.certificateTitle,
      author: l10n.appTitle,
    );

    document.addPage(
      pw.Page(
        theme: theme,
        // Landscape, like a certificate should be.
        pageFormat: PdfPageFormat.a4.landscape,
        build: (context) => pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: pink, width: 3),
            borderRadius: pw.BorderRadius.circular(16),
          ),
          padding: const pw.EdgeInsets.all(36),
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                l10n.appTitle,
                style: pw.TextStyle(fontSize: 16, color: green),
              ),
              pw.SizedBox(height: 24),
              pw.Text(
                l10n.certificateTitle,
                style: pw.TextStyle(
                  fontSize: 30,
                  fontWeight: pw.FontWeight.bold,
                  color: pink,
                ),
              ),
              pw.SizedBox(height: 28),
              pw.Text(
                l10n.certificateAwardedTo,
                style: pw.TextStyle(fontSize: 12, color: muted),
              ),
              pw.SizedBox(height: 6),
              pw.Text(
                recipientName,
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                  color: ink,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                l10n.certificateForCompleting,
                style: pw.TextStyle(fontSize: 12, color: muted),
              ),
              pw.SizedBox(height: 6),
              pw.Text(
                course.title.resolve(_localeOf(localeTag)),
                style: pw.TextStyle(fontSize: 18, color: ink),
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                l10n.certificateLessons(
                  course.lessonCount,
                  course.totalMinutes,
                ),
                style: pw.TextStyle(fontSize: 11, color: muted),
              ),
              pw.Spacer(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    DateFormat.yMMMMd(localeTag).format(completedAt),
                    style: pw.TextStyle(fontSize: 11, color: muted),
                  ),
                  pw.Text(
                    l10n.certificateNote,
                    style: pw.TextStyle(fontSize: 9, color: muted),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return document.save();
  }

  static Future<ByteData> _load(String asset) => rootBundle.load(asset);

  /// `ru`, `kk-KZ` and similar tags reduce to the language code we store.
  static Locale _localeOf(String tag) => Locale(tag.split('-').first);
}
