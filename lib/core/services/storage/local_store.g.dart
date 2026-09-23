// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Encrypted, on-device JSON store for personal and health data.
///
/// Opened in `bootstrap()` and injected with `overrideWithValue`, so reads
/// are synchronous.

@ProviderFor(localStore)
final localStoreProvider = LocalStoreProvider._();

/// Encrypted, on-device JSON store for personal and health data.
///
/// Opened in `bootstrap()` and injected with `overrideWithValue`, so reads
/// are synchronous.

final class LocalStoreProvider
    extends $FunctionalProvider<LocalStore, LocalStore, LocalStore>
    with $Provider<LocalStore> {
  /// Encrypted, on-device JSON store for personal and health data.
  ///
  /// Opened in `bootstrap()` and injected with `overrideWithValue`, so reads
  /// are synchronous.
  LocalStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localStoreHash();

  @$internal
  @override
  $ProviderElement<LocalStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalStore create(Ref ref) {
    return localStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalStore>(value),
    );
  }
}

String _$localStoreHash() => r'90816e513fc9cad06731b475f5902a48b65f59e2';
