import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_dimens.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/widgets.dart';
import 'onboarding_controller.dart';

/// Shown once to users under 16 after the quiz: offers Moms & Daughters
/// linking. The linking flow itself is built in step 8.
class FamilyOfferScreen extends ConsumerWidget {
  const FamilyOfferScreen({super.key});

  Future<void> _complete(
    BuildContext context,
    WidgetRef ref, {
    required bool accepted,
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    final message = context.l10n.familyOfferAccepted;
    await ref
        .read(onboardingControllerProvider.notifier)
        .completeFamilyOffer(linkRequested: accepted);
    // The router redirect moves on to Home.
    if (accepted) messenger.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: TitledPageLayout(
          header: const Center(
            child: IconBubble(icon: Icons.family_restroom_rounded, size: 140),
          ),
          title: l10n.familyOfferTitle,
          subtitle: l10n.familyOfferBody,
          bottom: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingButton(
                label: l10n.familyOfferAccept,
                icon: Icons.favorite_rounded,
                onPressed: () => _complete(context, ref, accepted: true),
              ),
              const SizedBox(height: AppSpacing.xs),
              TextButton(
                onPressed: () => _complete(context, ref, accepted: false),
                child: Text(l10n.familyOfferLater),
              ),
            ],
          ),
          children: const [],
        ),
      ),
    );
  }
}
