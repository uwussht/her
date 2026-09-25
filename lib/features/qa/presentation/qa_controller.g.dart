// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qa_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(qaLocalStore)
final qaLocalStoreProvider = QaLocalStoreProvider._();

final class QaLocalStoreProvider
    extends $FunctionalProvider<QaLocalStore, QaLocalStore, QaLocalStore>
    with $Provider<QaLocalStore> {
  QaLocalStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'qaLocalStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$qaLocalStoreHash();

  @$internal
  @override
  $ProviderElement<QaLocalStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QaLocalStore create(Ref ref) {
    return qaLocalStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QaLocalStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QaLocalStore>(value),
    );
  }
}

String _$qaLocalStoreHash() => r'b6d21b919882e24d7813e06c05464dd1b8ef2883';

@ProviderFor(qaCatalogue)
final qaCatalogueProvider = QaCatalogueProvider._();

final class QaCatalogueProvider
    extends $FunctionalProvider<QaCatalogue, QaCatalogue, QaCatalogue>
    with $Provider<QaCatalogue> {
  QaCatalogueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'qaCatalogueProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$qaCatalogueHash();

  @$internal
  @override
  $ProviderElement<QaCatalogue> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QaCatalogue create(Ref ref) {
    return qaCatalogue(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QaCatalogue value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QaCatalogue>(value),
    );
  }
}

String _$qaCatalogueHash() => r'cae4260c0e6c4fb8e6f252aeb643519467b42b37';

/// Her questions and upvotes.

@ProviderFor(QaController)
final qaControllerProvider = QaControllerProvider._();

/// Her questions and upvotes.
final class QaControllerProvider
    extends $NotifierProvider<QaController, QaLocalState> {
  /// Her questions and upvotes.
  QaControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'qaControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$qaControllerHash();

  @$internal
  @override
  QaController create() => QaController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QaLocalState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QaLocalState>(value),
    );
  }
}

String _$qaControllerHash() => r'eb3f5c690227947051d98cba38d7fb3f0d97e93c';

/// Her questions and upvotes.

abstract class _$QaController extends $Notifier<QaLocalState> {
  QaLocalState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<QaLocalState, QaLocalState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<QaLocalState, QaLocalState>,
              QaLocalState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Q&A list filters.

@ProviderFor(QaFilterController)
final qaFilterControllerProvider = QaFilterControllerProvider._();

/// Q&A list filters.
final class QaFilterControllerProvider
    extends
        $NotifierProvider<
          QaFilterController,
          ({ContentCategory? category, bool mineOnly, QaSort sort})
        > {
  /// Q&A list filters.
  QaFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'qaFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$qaFilterControllerHash();

  @$internal
  @override
  QaFilterController create() => QaFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({ContentCategory? category, bool mineOnly, QaSort sort}) value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            ({ContentCategory? category, bool mineOnly, QaSort sort})
          >(value),
    );
  }
}

String _$qaFilterControllerHash() =>
    r'2943416023c0a3a4814ced797be809c95d3ca173';

/// Q&A list filters.

abstract class _$QaFilterController
    extends
        $Notifier<({ContentCategory? category, bool mineOnly, QaSort sort})> {
  ({ContentCategory? category, bool mineOnly, QaSort sort}) build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              ({ContentCategory? category, bool mineOnly, QaSort sort}),
              ({ContentCategory? category, bool mineOnly, QaSort sort})
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({ContentCategory? category, bool mineOnly, QaSort sort}),
                ({ContentCategory? category, bool mineOnly, QaSort sort})
              >,
              ({ContentCategory? category, bool mineOnly, QaSort sort}),
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The Q&A list: the mock threads plus her own questions.

@ProviderFor(qaResults)
final qaResultsProvider = QaResultsProvider._();

/// The Q&A list: the mock threads plus her own questions.

final class QaResultsProvider
    extends $FunctionalProvider<List<Question>, List<Question>, List<Question>>
    with $Provider<List<Question>> {
  /// The Q&A list: the mock threads plus her own questions.
  QaResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'qaResultsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$qaResultsHash();

  @$internal
  @override
  $ProviderElement<List<Question>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Question> create(Ref ref) {
    return qaResults(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Question> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Question>>(value),
    );
  }
}

String _$qaResultsHash() => r'0a0c92b8fcf5a36bdbc3f29464d0e134a28a92fd';

@ProviderFor(questionById)
final questionByIdProvider = QuestionByIdFamily._();

final class QuestionByIdProvider
    extends $FunctionalProvider<Question?, Question?, Question?>
    with $Provider<Question?> {
  QuestionByIdProvider._({
    required QuestionByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'questionByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$questionByIdHash();

  @override
  String toString() {
    return r'questionByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Question?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Question? create(Ref ref) {
    final argument = this.argument as String;
    return questionById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Question? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Question?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$questionByIdHash() => r'92d23ca2cb070f8fd0e14710516f7d6a9c501d37';

final class QuestionByIdFamily extends $Family
    with $FunctionalFamilyOverride<Question?, String> {
  QuestionByIdFamily._()
    : super(
        retry: null,
        name: r'questionByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QuestionByIdProvider call(String id) =>
      QuestionByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'questionByIdProvider';
}
