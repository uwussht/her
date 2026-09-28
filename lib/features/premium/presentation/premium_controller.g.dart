// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(premiumRepository)
final premiumRepositoryProvider = PremiumRepositoryProvider._();

final class PremiumRepositoryProvider
    extends
        $FunctionalProvider<
          PremiumRepository,
          PremiumRepository,
          PremiumRepository
        >
    with $Provider<PremiumRepository> {
  PremiumRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'premiumRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$premiumRepositoryHash();

  @$internal
  @override
  $ProviderElement<PremiumRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PremiumRepository create(Ref ref) {
    return premiumRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PremiumRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PremiumRepository>(value),
    );
  }
}

String _$premiumRepositoryHash() => r'5d88021ea31c986667e29c57e1b166e5cdca33dd';

@ProviderFor(referralRepository)
final referralRepositoryProvider = ReferralRepositoryProvider._();

final class ReferralRepositoryProvider
    extends
        $FunctionalProvider<
          ReferralRepository,
          ReferralRepository,
          ReferralRepository
        >
    with $Provider<ReferralRepository> {
  ReferralRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'referralRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$referralRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReferralRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReferralRepository create(Ref ref) {
    return referralRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReferralRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReferralRepository>(value),
    );
  }
}

String _$referralRepositoryHash() =>
    r'e19ae9bc6c75ed18d4cc96b53887fc87163f5b9e';

/// Her membership: the trial, the subscription and the referral months.
///
/// Payment goes through the same [PaymentService] as the shop, so premium
/// will switch to Kaspi when the shop does, and the mock declines the standard
/// test card here too.

@ProviderFor(PremiumController)
final premiumControllerProvider = PremiumControllerProvider._();

/// Her membership: the trial, the subscription and the referral months.
///
/// Payment goes through the same [PaymentService] as the shop, so premium
/// will switch to Kaspi when the shop does, and the mock declines the standard
/// test card here too.
final class PremiumControllerProvider
    extends $NotifierProvider<PremiumController, PremiumMembership> {
  /// Her membership: the trial, the subscription and the referral months.
  ///
  /// Payment goes through the same [PaymentService] as the shop, so premium
  /// will switch to Kaspi when the shop does, and the mock declines the standard
  /// test card here too.
  PremiumControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'premiumControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$premiumControllerHash();

  @$internal
  @override
  PremiumController create() => PremiumController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PremiumMembership value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PremiumMembership>(value),
    );
  }
}

String _$premiumControllerHash() => r'f6664498058b8d1184802984dc0412588e3ca36e';

/// Her membership: the trial, the subscription and the referral months.
///
/// Payment goes through the same [PaymentService] as the shop, so premium
/// will switch to Kaspi when the shop does, and the mock declines the standard
/// test card here too.

abstract class _$PremiumController extends $Notifier<PremiumMembership> {
  PremiumMembership build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PremiumMembership, PremiumMembership>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PremiumMembership, PremiumMembership>,
              PremiumMembership,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Convenience flag for gating content.

@ProviderFor(hasPremium)
final hasPremiumProvider = HasPremiumProvider._();

/// Convenience flag for gating content.

final class HasPremiumProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Convenience flag for gating content.
  HasPremiumProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasPremiumProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasPremiumHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasPremium(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasPremiumHash() => r'69bbace3e19a9a95d081f323baf28a855ce3a41b';

/// Her referrals: the code, how many friends joined, months earned.

@ProviderFor(ReferralController)
final referralControllerProvider = ReferralControllerProvider._();

/// Her referrals: the code, how many friends joined, months earned.
final class ReferralControllerProvider
    extends $NotifierProvider<ReferralController, ReferralState> {
  /// Her referrals: the code, how many friends joined, months earned.
  ReferralControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'referralControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$referralControllerHash();

  @$internal
  @override
  ReferralController create() => ReferralController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReferralState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReferralState>(value),
    );
  }
}

String _$referralControllerHash() =>
    r'797d21bb561c626c19c5706bafb8f6ff7335c1dc';

/// Her referrals: the code, how many friends joined, months earned.

abstract class _$ReferralController extends $Notifier<ReferralState> {
  ReferralState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ReferralState, ReferralState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReferralState, ReferralState>,
              ReferralState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
