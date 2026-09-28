// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregnancy_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pregnancyRepository)
final pregnancyRepositoryProvider = PregnancyRepositoryProvider._();

final class PregnancyRepositoryProvider
    extends
        $FunctionalProvider<
          PregnancyRepository,
          PregnancyRepository,
          PregnancyRepository
        >
    with $Provider<PregnancyRepository> {
  PregnancyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pregnancyRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pregnancyRepositoryHash();

  @$internal
  @override
  $ProviderElement<PregnancyRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PregnancyRepository create(Ref ref) {
    return pregnancyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PregnancyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PregnancyRepository>(value),
    );
  }
}

String _$pregnancyRepositoryHash() =>
    r'efc65b7d14c2cd1e7ba5111e4db9b2b593403c3a';

@ProviderFor(contractionAnalyser)
final contractionAnalyserProvider = ContractionAnalyserProvider._();

final class ContractionAnalyserProvider
    extends
        $FunctionalProvider<
          ContractionAnalyser,
          ContractionAnalyser,
          ContractionAnalyser
        >
    with $Provider<ContractionAnalyser> {
  ContractionAnalyserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractionAnalyserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractionAnalyserHash();

  @$internal
  @override
  $ProviderElement<ContractionAnalyser> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractionAnalyser create(Ref ref) {
    return contractionAnalyser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractionAnalyser value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractionAnalyser>(value),
    );
  }
}

String _$contractionAnalyserHash() =>
    r'4bf99da762d47556dc2cbfd2195cd2d66cd81bd7';

/// A clock the running timers rebuild on.
///
/// A provider rather than a widget timer, so tests can override it with an
/// empty stream and still drive the counters through the controllers.

@ProviderFor(ticker)
final tickerProvider = TickerProvider._();

/// A clock the running timers rebuild on.
///
/// A provider rather than a widget timer, so tests can override it with an
/// empty stream and still drive the counters through the controllers.

final class TickerProvider
    extends
        $FunctionalProvider<AsyncValue<DateTime>, DateTime, Stream<DateTime>>
    with $FutureModifier<DateTime>, $StreamProvider<DateTime> {
  /// A clock the running timers rebuild on.
  ///
  /// A provider rather than a widget timer, so tests can override it with an
  /// empty stream and still drive the counters through the controllers.
  TickerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tickerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tickerHash();

  @$internal
  @override
  $StreamProviderElement<DateTime> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<DateTime> create(Ref ref) {
    return ticker(ref);
  }
}

String _$tickerHash() => r'bb03d80d18d6388662e9a5d6270391150132a361';

/// Where she is in the pregnancy, from the last period in her profile.

@ProviderFor(pregnancyStatus)
final pregnancyStatusProvider = PregnancyStatusProvider._();

/// Where she is in the pregnancy, from the last period in her profile.

final class PregnancyStatusProvider
    extends
        $FunctionalProvider<
          PregnancyStatus?,
          PregnancyStatus?,
          PregnancyStatus?
        >
    with $Provider<PregnancyStatus?> {
  /// Where she is in the pregnancy, from the last period in her profile.
  PregnancyStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pregnancyStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pregnancyStatusHash();

  @$internal
  @override
  $ProviderElement<PregnancyStatus?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PregnancyStatus? create(Ref ref) {
    return pregnancyStatus(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PregnancyStatus? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PregnancyStatus?>(value),
    );
  }
}

String _$pregnancyStatusHash() => r'c464334e634081062662c93256402681ac990930';

/// This week's baby size, if the mock data covers the week.

@ProviderFor(babySizeThisWeek)
final babySizeThisWeekProvider = BabySizeThisWeekProvider._();

/// This week's baby size, if the mock data covers the week.

final class BabySizeThisWeekProvider
    extends $FunctionalProvider<BabySize?, BabySize?, BabySize?>
    with $Provider<BabySize?> {
  /// This week's baby size, if the mock data covers the week.
  BabySizeThisWeekProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'babySizeThisWeekProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$babySizeThisWeekHash();

  @$internal
  @override
  $ProviderElement<BabySize?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BabySize? create(Ref ref) {
    return babySizeThisWeek(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BabySize? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BabySize?>(value),
    );
  }
}

String _$babySizeThisWeekHash() => r'2220ecd4b16ce8884135e94d84b4492d91e2b883';

/// Kick counting (spec 5.4).

@ProviderFor(KickCounterController)
final kickCounterControllerProvider = KickCounterControllerProvider._();

/// Kick counting (spec 5.4).
final class KickCounterControllerProvider
    extends $NotifierProvider<KickCounterController, List<KickSession>> {
  /// Kick counting (spec 5.4).
  KickCounterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'kickCounterControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$kickCounterControllerHash();

  @$internal
  @override
  KickCounterController create() => KickCounterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<KickSession> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<KickSession>>(value),
    );
  }
}

String _$kickCounterControllerHash() =>
    r'437374c08125bd7987464c40bcdd285b7a149b0c';

/// Kick counting (spec 5.4).

abstract class _$KickCounterController extends $Notifier<List<KickSession>> {
  List<KickSession> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<KickSession>, List<KickSession>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<KickSession>, List<KickSession>>,
              List<KickSession>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The contraction timer (spec 5.4).

@ProviderFor(ContractionController)
final contractionControllerProvider = ContractionControllerProvider._();

/// The contraction timer (spec 5.4).
final class ContractionControllerProvider
    extends $NotifierProvider<ContractionController, List<Contraction>> {
  /// The contraction timer (spec 5.4).
  ContractionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractionControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractionControllerHash();

  @$internal
  @override
  ContractionController create() => ContractionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Contraction> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Contraction>>(value),
    );
  }
}

String _$contractionControllerHash() =>
    r'a3bc5767c71ceab339cfa380717287a1424ab728';

/// The contraction timer (spec 5.4).

abstract class _$ContractionController extends $Notifier<List<Contraction>> {
  List<Contraction> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Contraction>, List<Contraction>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Contraction>, List<Contraction>>,
              List<Contraction>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Stats over the last hour, including the 5-1-1 pattern.

@ProviderFor(contractionStats)
final contractionStatsProvider = ContractionStatsFamily._();

/// Stats over the last hour, including the 5-1-1 pattern.

final class ContractionStatsProvider
    extends
        $FunctionalProvider<
          ContractionStats,
          ContractionStats,
          ContractionStats
        >
    with $Provider<ContractionStats> {
  /// Stats over the last hour, including the 5-1-1 pattern.
  ContractionStatsProvider._({
    required ContractionStatsFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'contractionStatsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$contractionStatsHash();

  @override
  String toString() {
    return r'contractionStatsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ContractionStats> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ContractionStats create(Ref ref) {
    final argument = this.argument as DateTime;
    return contractionStats(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractionStats value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractionStats>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ContractionStatsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$contractionStatsHash() => r'ba66ffa7f509e0923d1175572d5599c9dd3c91dd';

/// Stats over the last hour, including the 5-1-1 pattern.

final class ContractionStatsFamily extends $Family
    with $FunctionalFamilyOverride<ContractionStats, DateTime> {
  ContractionStatsFamily._()
    : super(
        retry: null,
        name: r'contractionStatsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Stats over the last hour, including the 5-1-1 pattern.

  ContractionStatsProvider call(DateTime now) =>
      ContractionStatsProvider._(argument: now, from: this);

  @override
  String toString() => r'contractionStatsProvider';
}

/// The weight log (spec 5.4).

@ProviderFor(WeightLogController)
final weightLogControllerProvider = WeightLogControllerProvider._();

/// The weight log (spec 5.4).
final class WeightLogControllerProvider
    extends $NotifierProvider<WeightLogController, List<WeightEntry>> {
  /// The weight log (spec 5.4).
  WeightLogControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weightLogControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weightLogControllerHash();

  @$internal
  @override
  WeightLogController create() => WeightLogController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WeightEntry> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WeightEntry>>(value),
    );
  }
}

String _$weightLogControllerHash() =>
    r'03f7b52fe20f8afba6e673f9d786259084fa3760';

/// The weight log (spec 5.4).

abstract class _$WeightLogController extends $Notifier<List<WeightEntry>> {
  List<WeightEntry> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<WeightEntry>, List<WeightEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<WeightEntry>, List<WeightEntry>>,
              List<WeightEntry>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Symptoms over the last 30 days, for the menopause and postpartum views.

@ProviderFor(symptomSummary)
final symptomSummaryProvider = SymptomSummaryFamily._();

/// Symptoms over the last 30 days, for the menopause and postpartum views.

final class SymptomSummaryProvider
    extends $FunctionalProvider<SymptomSummary, SymptomSummary, SymptomSummary>
    with $Provider<SymptomSummary> {
  /// Symptoms over the last 30 days, for the menopause and postpartum views.
  SymptomSummaryProvider._({
    required SymptomSummaryFamily super.from,
    required SymptomGroup? super.argument,
  }) : super(
         retry: null,
         name: r'symptomSummaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$symptomSummaryHash();

  @override
  String toString() {
    return r'symptomSummaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SymptomSummary> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SymptomSummary create(Ref ref) {
    final argument = this.argument as SymptomGroup?;
    return symptomSummary(ref, group: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SymptomSummary value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SymptomSummary>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SymptomSummaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$symptomSummaryHash() => r'097cbf6cd1c113cc8aa28cece22c29e3a8bed6d4';

/// Symptoms over the last 30 days, for the menopause and postpartum views.

final class SymptomSummaryFamily extends $Family
    with $FunctionalFamilyOverride<SymptomSummary, SymptomGroup?> {
  SymptomSummaryFamily._()
    : super(
        retry: null,
        name: r'symptomSummaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Symptoms over the last 30 days, for the menopause and postpartum views.

  SymptomSummaryProvider call({SymptomGroup? group}) =>
      SymptomSummaryProvider._(argument: group, from: this);

  @override
  String toString() => r'symptomSummaryProvider';
}
