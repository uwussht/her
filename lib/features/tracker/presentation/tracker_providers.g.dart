// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(predictionService)
final predictionServiceProvider = PredictionServiceProvider._();

final class PredictionServiceProvider
    extends
        $FunctionalProvider<
          PredictionService,
          PredictionService,
          PredictionService
        >
    with $Provider<PredictionService> {
  PredictionServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'predictionServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$predictionServiceHash();

  @$internal
  @override
  $ProviderElement<PredictionService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PredictionService create(Ref ref) {
    return predictionService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PredictionService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PredictionService>(value),
    );
  }
}

String _$predictionServiceHash() => r'744b1ca4d8e584f77ecf7e14521201b568b6b021';

@ProviderFor(trackerRepository)
final trackerRepositoryProvider = TrackerRepositoryProvider._();

final class TrackerRepositoryProvider
    extends
        $FunctionalProvider<
          TrackerRepository,
          TrackerRepository,
          TrackerRepository
        >
    with $Provider<TrackerRepository> {
  TrackerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trackerRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trackerRepositoryHash();

  @$internal
  @override
  $ProviderElement<TrackerRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TrackerRepository create(Ref ref) {
    return trackerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackerRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackerRepository>(value),
    );
  }
}

String _$trackerRepositoryHash() => r'e530a6b63cbf1f55ab8dfb779b0f1d8a1d132530';

@ProviderFor(trackerSettingsRepository)
final trackerSettingsRepositoryProvider = TrackerSettingsRepositoryProvider._();

final class TrackerSettingsRepositoryProvider
    extends
        $FunctionalProvider<
          TrackerSettingsRepository,
          TrackerSettingsRepository,
          TrackerSettingsRepository
        >
    with $Provider<TrackerSettingsRepository> {
  TrackerSettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trackerSettingsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trackerSettingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<TrackerSettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TrackerSettingsRepository create(Ref ref) {
    return trackerSettingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackerSettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackerSettingsRepository>(value),
    );
  }
}

String _$trackerSettingsRepositoryHash() =>
    r'904011517796a4b99bb37658bb58755b843ffbde';

@ProviderFor(trackerMode)
final trackerModeProvider = TrackerModeProvider._();

final class TrackerModeProvider
    extends $FunctionalProvider<TrackerMode, TrackerMode, TrackerMode>
    with $Provider<TrackerMode> {
  TrackerModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trackerModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trackerModeHash();

  @$internal
  @override
  $ProviderElement<TrackerMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TrackerMode create(Ref ref) {
    return trackerMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackerMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackerMode>(value),
    );
  }
}

String _$trackerModeHash() => r'ca530f99b4d765d8164cd0998fbc3dffaf5412ec';

/// Cycles and daily logs for the signed-in user.

@ProviderFor(TrackerController)
final trackerControllerProvider = TrackerControllerProvider._();

/// Cycles and daily logs for the signed-in user.
final class TrackerControllerProvider
    extends $NotifierProvider<TrackerController, TrackerData> {
  /// Cycles and daily logs for the signed-in user.
  TrackerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trackerControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trackerControllerHash();

  @$internal
  @override
  TrackerController create() => TrackerController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackerData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackerData>(value),
    );
  }
}

String _$trackerControllerHash() => r'59fbf14f806d01a53c18180c04b47d9c2906eee5';

/// Cycles and daily logs for the signed-in user.

abstract class _$TrackerController extends $Notifier<TrackerData> {
  TrackerData build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TrackerData, TrackerData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TrackerData, TrackerData>,
              TrackerData,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(cyclePrediction)
final cyclePredictionProvider = CyclePredictionProvider._();

final class CyclePredictionProvider
    extends
        $FunctionalProvider<
          CyclePrediction?,
          CyclePrediction?,
          CyclePrediction?
        >
    with $Provider<CyclePrediction?> {
  CyclePredictionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cyclePredictionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cyclePredictionHash();

  @$internal
  @override
  $ProviderElement<CyclePrediction?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CyclePrediction? create(Ref ref) {
    return cyclePrediction(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CyclePrediction? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CyclePrediction?>(value),
    );
  }
}

String _$cyclePredictionHash() => r'c4277f7c707cad2f939d9a7f43330d6a2b431eb1';

/// What the tracker UI reads: cycles, logs, forecast and day phases.

@ProviderFor(cycleTimeline)
final cycleTimelineProvider = CycleTimelineProvider._();

/// What the tracker UI reads: cycles, logs, forecast and day phases.

final class CycleTimelineProvider
    extends $FunctionalProvider<CycleTimeline, CycleTimeline, CycleTimeline>
    with $Provider<CycleTimeline> {
  /// What the tracker UI reads: cycles, logs, forecast and day phases.
  CycleTimelineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cycleTimelineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cycleTimelineHash();

  @$internal
  @override
  $ProviderElement<CycleTimeline> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CycleTimeline create(Ref ref) {
    return cycleTimeline(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CycleTimeline value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CycleTimeline>(value),
    );
  }
}

String _$cycleTimelineHash() => r'a5a1a7bf26f11058de7a68b9ef8db558533ba694';
