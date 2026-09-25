import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../home/presentation/home_providers.dart';
import '../data/certificate_service.dart';
import 'learn_providers.dart';

/// Names the recipient and exports the course certificate as a PDF.
class CertificateScreen extends ConsumerStatefulWidget {
  const CertificateScreen({required this.courseId, super.key});

  final String courseId;

  @override
  ConsumerState<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends ConsumerState<CertificateScreen> {
  late final TextEditingController _name;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    final user = ref.read(currentUserProvider);
    _name = TextEditingController(text: user?.displayName ?? '');
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _export() async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final localeTag = ref.read(localeTagProvider);
    final course = ref.read(courseByIdProvider(widget.courseId));
    final progress = ref.read(
      courseProgressControllerProvider,
    )[widget.courseId];
    if (course == null) return;

    setState(() => _busy = true);
    try {
      final bytes = await const CertificateService().build(
        l10n: l10n,
        localeTag: localeTag,
        course: course,
        recipientName: _name.text.trim(),
        completedAt: progress?.completedAt ?? DateTime.now(),
      );
      await Printing.sharePdf(
        bytes: bytes,
        filename: 'her-circle-certificate-${course.id}.pdf',
        subject: l10n.certificateTitle,
      );
    } on Exception {
      messenger.showSnackBar(SnackBar(content: Text(l10n.certificateFailed)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final course = ref.watch(courseByIdProvider(widget.courseId));
    final progress = ref.watch(
      courseProgressControllerProvider,
    )[widget.courseId];
    final localeTag = ref.watch(localeTagProvider);

    if (course == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.notFoundTitle)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.certificateTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.xl,
        ),
        children: [
          AppCard(
            color: context.colors.primaryContainer,
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                const IconBubble(icon: Icons.workspace_premium_rounded),
                const SizedBox(height: AppSpacing.md),
                Text(
                  l10n.certificateReady,
                  style: context.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  course.title.of(context),
                  style: context.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  l10n.certificateLessons(
                    course.lessonCount,
                    course.totalMinutes,
                  ),
                  style: context.textTheme.labelMedium,
                ),
                if (progress?.completedAt case final date?) ...[
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    DateFormat.yMMMMd(localeTag).format(date),
                    style: context.textTheme.labelSmall,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(l10n.certificateName, style: context.textTheme.titleSmall),
          const SizedBox(height: AppSpacing.xs),
          TextField(
            controller: _name,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(hintText: l10n.certificateNameHint),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: AppSpacing.lg),
          LoadingButton(
            label: l10n.certificateSave,
            icon: Icons.ios_share_rounded,
            isLoading: _busy,
            onPressed: _name.text.trim().isEmpty ? null : _export,
          ),
          const SizedBox(height: AppSpacing.md),
          DisclaimerCard(text: l10n.certificateNote),
        ],
      ),
    );
  }
}
