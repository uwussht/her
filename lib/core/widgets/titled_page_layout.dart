import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../utils/context_extensions.dart';

/// Title, subtitle, scrollable body and a bottom action area that stays
/// above the keyboard. Used by onboarding, auth and quiz screens.
class TitledPageLayout extends StatelessWidget {
  const TitledPageLayout({
    required this.title,
    required this.children,
    this.subtitle,
    this.header,
    this.bottom,
    super.key,
  });

  final String title;
  final String? subtitle;

  /// Shown above the title, e.g. a progress bar or an illustration.
  final Widget? header;
  final List<Widget> children;

  /// Pinned actions, e.g. the primary button.
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.xs,
              AppSpacing.md,
              AppSpacing.lg,
            ),
            children: [
              if (header != null) ...[
                header!,
                const SizedBox(height: AppSpacing.lg),
              ],
              Semantics(
                header: true,
                child: Text(title, style: context.textTheme.headlineMedium),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  subtitle!,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.palette.textSecondary,
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.lg),
              ...children,
            ],
          ),
        ),
        if (bottom != null)
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.xs,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: bottom,
            ),
          ),
      ],
    );
  }
}
