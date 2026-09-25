import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage/preferences_service.dart';
import '../domain/premium_status.dart';

part 'premium_controller.g.dart';

/// Her premium state.
///
/// Step 9 replaces this with real plans, a trial and payment; until then it
/// is a local flag so premium gating can be built and tested for real.
@Riverpod(keepAlive: true)
class PremiumController extends _$PremiumController {
  @override
  PremiumStatus build() => ref.watch(preferencesServiceProvider).premiumStatus;

  Future<void> setStatus(PremiumStatus status) async {
    state = status;
    await ref.read(preferencesServiceProvider).setPremiumStatus(status);
  }

  /// Demo switch behind the paywall placeholder.
  Future<void> toggleDemo() =>
      setStatus(state.hasAccess ? PremiumStatus.free : PremiumStatus.trial);
}

/// Convenience flag for gating content.
@Riverpod(keepAlive: true)
bool hasPremium(Ref ref) => ref.watch(premiumControllerProvider).hasAccess;
