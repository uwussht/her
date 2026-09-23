// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The user's chosen app language. Defaults to Russian and is persisted.

@ProviderFor(LocaleController)
final localeControllerProvider = LocaleControllerProvider._();

/// The user's chosen app language. Defaults to Russian and is persisted.
final class LocaleControllerProvider
    extends $NotifierProvider<LocaleController, AppLocale> {
  /// The user's chosen app language. Defaults to Russian and is persisted.
  LocaleControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeControllerHash();

  @$internal
  @override
  LocaleController create() => LocaleController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLocale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLocale>(value),
    );
  }
}

String _$localeControllerHash() => r'f3324b32ddd59a62d10309c13f06a32612ac6445';

/// The user's chosen app language. Defaults to Russian and is persisted.

abstract class _$LocaleController extends $Notifier<AppLocale> {
  AppLocale build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AppLocale, AppLocale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppLocale, AppLocale>,
              AppLocale,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
