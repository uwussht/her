import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage/local_store.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../shop/domain/order.dart';
import '../../shop/domain/payment_service.dart';
import '../../shop/presentation/shop_providers.dart';
import '../data/local_premium_repository.dart';
import '../domain/premium_membership.dart';
import '../domain/premium_plan.dart';
import '../domain/premium_repository.dart';
import '../domain/premium_status.dart';
import '../domain/referral.dart';

part 'premium_controller.g.dart';

@Riverpod(keepAlive: true)
PremiumRepository premiumRepository(Ref ref) => LocalPremiumRepository(
  ref.watch(localStoreProvider),
  ref.watch(currentUserProvider)?.uid ?? 'guest',
);

@Riverpod(keepAlive: true)
ReferralRepository referralRepository(Ref ref) => LocalReferralRepository(
  ref.watch(localStoreProvider),
  ref.watch(currentUserProvider)?.uid ?? 'guest',
);

/// Her membership: the trial, the subscription and the referral months.
///
/// Payment goes through the same [PaymentService] as the shop, so premium
/// will switch to Kaspi when the shop does, and the mock declines the standard
/// test card here too.
@Riverpod(keepAlive: true)
class PremiumController extends _$PremiumController {
  @override
  PremiumMembership build() => ref.watch(premiumRepositoryProvider).read();

  /// Starts the seven-day trial. Returns false when she has had it already.
  Future<bool> startTrial() async {
    if (!state.canStartTrial) return false;
    await _write(state.startTrial(DateTime.now()));
    return true;
  }

  /// Charges [plan] and turns premium on.
  ///
  /// Returns the payment result so the paywall can explain a decline rather
  /// than silently doing nothing.
  Future<PaymentResult> subscribe({
    required PremiumPlan plan,
    required PaymentMethod method,
    CardDetails? card,
  }) async {
    final result = await ref
        .read(paymentServiceProvider)
        .pay(
          method: method,
          amount: plan.priceTenge,
          orderId:
              'premium-${plan.name}-${DateTime.now().millisecondsSinceEpoch}',
          card: card,
        );
    if (result is PaymentSucceeded) {
      await _write(state.subscribe(plan, DateTime.now()));
    }
    return result;
  }

  /// Stops the renewal. Access runs to the end of the period she paid for.
  Future<void> cancel() => _write(state.cancel(DateTime.now()));

  /// Credits referral months she has earned. Returns how many were added.
  Future<int> creditReferralMonths(int months) async {
    if (months <= 0) return 0;
    await _write(state.addBonusMonths(months, DateTime.now()));
    return months;
  }

  /// Demo switch, kept for previews and manual testing until billing is real.
  Future<void> toggleDemo() async {
    if (state.hasAccessOn(DateTime.now())) {
      await _write(PremiumMembership(trialUsed: state.trialUsed));
    } else {
      await _write(state.copyWith(status: PremiumStatus.active, plan: null));
    }
  }

  Future<void> _write(PremiumMembership membership) async {
    state = membership;
    await ref.read(premiumRepositoryProvider).save(membership);
  }
}

/// Convenience flag for gating content.
@Riverpod(keepAlive: true)
bool hasPremium(Ref ref) =>
    ref.watch(premiumControllerProvider).hasAccessOn(DateTime.now());

/// Her referrals: the code, how many friends joined, months earned.
@Riverpod(keepAlive: true)
class ReferralController extends _$ReferralController {
  @override
  ReferralState build() => ref.watch(referralRepositoryProvider).read();

  /// Records a friend who signed up with her code and credits the month to
  /// both of them — her side here, his on his own device.
  ///
  /// The backend will call this from the friend's sign-up; until then it is
  /// reachable from the referral screen as a clearly labelled demo action.
  Future<int> registerInvite() async {
    final next = state.withInvite();
    final months = next.pendingMonths;
    final credited = await ref
        .read(premiumControllerProvider.notifier)
        .creditReferralMonths(months);
    await _write(next.credited(credited));
    return credited;
  }

  Future<void> _write(ReferralState next) async {
    state = next;
    await ref.read(referralRepositoryProvider).save(next);
  }
}
