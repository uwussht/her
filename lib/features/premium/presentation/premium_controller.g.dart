// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Her premium state.
///
/// Step 9 replaces this with real plans, a trial and payment; until then it
/// is a local flag so premium gating can be built and tested for real.

@ProviderFor(PremiumController)
final premiumControllerProvider = PremiumControllerProvider._();

/// Her premium state.
///
/// Step 9 replaces this with real plans, a trial and payment; until then it
/// is a local flag so premium gating can be built and tested for real.
final class PremiumControllerProvider
    extends $NotifierProvider<PremiumController, PremiumStatus> {
  /// Her premium state.
  ///
  /// Step 9 replaces this with real plans, a trial and payment; until then it
  /// is a local flag so premium gating can be built and tested for real.
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
  Override overrideWithValue(PremiumStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PremiumStatus>(value),
    );
  }
}

String _$premiumControllerHash() => r'c6c4a490e7c6f6d8326a3bbff4908974ebe00686';

/// Her premium state.
///
/// Step 9 replaces this with real plans, a trial and payment; until then it
/// is a local flag so premium gating can be built and tested for real.

abstract class _$PremiumController extends $Notifier<PremiumStatus> {
  PremiumStatus build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PremiumStatus, PremiumStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PremiumStatus, PremiumStatus>,
              PremiumStatus,
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

String _$hasPremiumHash() => r'5b339303c06034fa0f8c3c053bf32af0c6b5db5f';
