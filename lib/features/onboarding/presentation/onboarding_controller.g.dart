// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OnboardingController)
final onboardingControllerProvider = OnboardingControllerProvider._();

final class OnboardingControllerProvider
    extends $NotifierProvider<OnboardingController, OnboardingFlags> {
  OnboardingControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingControllerHash();

  @$internal
  @override
  OnboardingController create() => OnboardingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingFlags value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingFlags>(value),
    );
  }
}

String _$onboardingControllerHash() =>
    r'bc6c253f90a49ae8d410029ee37834deb1333e82';

abstract class _$OnboardingController extends $Notifier<OnboardingFlags> {
  OnboardingFlags build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<OnboardingFlags, OnboardingFlags>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OnboardingFlags, OnboardingFlags>,
              OnboardingFlags,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(onboardingStatus)
final onboardingStatusProvider = OnboardingStatusProvider._();

final class OnboardingStatusProvider
    extends
        $FunctionalProvider<
          OnboardingStatus,
          OnboardingStatus,
          OnboardingStatus
        >
    with $Provider<OnboardingStatus> {
  OnboardingStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingStatusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingStatusHash();

  @$internal
  @override
  $ProviderElement<OnboardingStatus> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OnboardingStatus create(Ref ref) {
    return onboardingStatus(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingStatus>(value),
    );
  }
}

String _$onboardingStatusHash() => r'3cfc215b1e01e0d30ef652bd0840b3a93e47a669';
