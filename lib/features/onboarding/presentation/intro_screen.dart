import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import 'onboarding_controller.dart';

class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({super.key});

  @override
  ConsumerState<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen> {
  final _pageController = PageController();
  int _page = 0;

  static List<_Slide> _slides(AppLocalizations l10n) => [
    _Slide(
      icon: Icons.school_rounded,
      tone: AppTone.pink,
      title: l10n.intro1Title,
      body: l10n.intro1Body,
    ),
    _Slide(
      icon: Icons.calendar_month_rounded,
      tone: AppTone.green,
      title: l10n.intro2Title,
      body: l10n.intro2Body,
    ),
    _Slide(
      icon: Icons.diversity_1_rounded,
      tone: AppTone.pink,
      title: l10n.intro3Title,
      body: l10n.intro3Body,
      showDisclaimer: true,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await ref.read(onboardingControllerProvider.notifier).completeIntro();
    if (mounted) context.go(AppRoutes.language);
  }

  void _next(int count) {
    if (_page == count - 1) {
      _finish();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final slides = _slides(l10n);
    final isLast = _page == slides.length - 1;

    return Scaffold(
      appBar: AppBar(
        actions: [
          if (!isLast)
            TextButton(onPressed: _finish, child: Text(l10n.actionSkip)),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: slides.length,
                onPageChanged: (page) => setState(() => _page = page),
                itemBuilder: (context, i) => _SlideView(slide: slides[i]),
              ),
            ),
            PageDots(
              count: slides.length,
              index: _page,
              semanticsLabel: l10n.introPageLabel(_page + 1, slides.length),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: LoadingButton(
                label: isLast ? l10n.introStart : l10n.actionNext,
                onPressed: () => _next(slides.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Slide {
  const _Slide({
    required this.icon,
    required this.tone,
    required this.title,
    required this.body,
    this.showDisclaimer = false,
  });

  final IconData icon;
  final AppTone tone;
  final String title;
  final String body;
  final bool showDisclaimer;
}

class _SlideView extends StatelessWidget {
  const _SlideView({required this.slide});

  final _Slide slide;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.xl),
          IconBubble(icon: slide.icon, tone: slide.tone, size: 160),
          const SizedBox(height: AppSpacing.xl),
          Text(
            slide.title,
            style: context.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            slide.body,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.palette.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          if (slide.showDisclaimer) ...[
            const SizedBox(height: AppSpacing.lg),
            const DisclaimerCard(),
          ],
        ],
      ),
    );
  }
}
