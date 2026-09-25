// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bookmarkRepository)
final bookmarkRepositoryProvider = BookmarkRepositoryProvider._();

final class BookmarkRepositoryProvider
    extends
        $FunctionalProvider<
          BookmarkRepository,
          BookmarkRepository,
          BookmarkRepository
        >
    with $Provider<BookmarkRepository> {
  BookmarkRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkRepositoryHash();

  @$internal
  @override
  $ProviderElement<BookmarkRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BookmarkRepository create(Ref ref) {
    return bookmarkRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookmarkRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookmarkRepository>(value),
    );
  }
}

String _$bookmarkRepositoryHash() =>
    r'1d87294d165f453c45ad925191f69ee6b3f00b7c';

@ProviderFor(learnCatalogue)
final learnCatalogueProvider = LearnCatalogueProvider._();

final class LearnCatalogueProvider
    extends $FunctionalProvider<LearnCatalogue, LearnCatalogue, LearnCatalogue>
    with $Provider<LearnCatalogue> {
  LearnCatalogueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learnCatalogueProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$learnCatalogueHash();

  @$internal
  @override
  $ProviderElement<LearnCatalogue> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LearnCatalogue create(Ref ref) {
    return learnCatalogue(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LearnCatalogue value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LearnCatalogue>(value),
    );
  }
}

String _$learnCatalogueHash() => r'04722286e9876653f5197b8f95a1ed3d28a9e658';

/// Saved items.

@ProviderFor(BookmarksController)
final bookmarksControllerProvider = BookmarksControllerProvider._();

/// Saved items.
final class BookmarksControllerProvider
    extends $NotifierProvider<BookmarksController, Set<String>> {
  /// Saved items.
  BookmarksControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarksControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarksControllerHash();

  @$internal
  @override
  BookmarksController create() => BookmarksController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$bookmarksControllerHash() =>
    r'03eefc29f32d7dce21fb90c95d3434a44ebdd51f';

/// Saved items.

abstract class _$BookmarksController extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The Learn library filters.

@ProviderFor(LearnFilterController)
final learnFilterControllerProvider = LearnFilterControllerProvider._();

/// The Learn library filters.
final class LearnFilterControllerProvider
    extends $NotifierProvider<LearnFilterController, LearnFilter> {
  /// The Learn library filters.
  LearnFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learnFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$learnFilterControllerHash();

  @$internal
  @override
  LearnFilterController create() => LearnFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LearnFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LearnFilter>(value),
    );
  }
}

String _$learnFilterControllerHash() =>
    r'31307b44bc4fb5c61057359e0d499f7486f5c9a4';

/// The Learn library filters.

abstract class _$LearnFilterController extends $Notifier<LearnFilter> {
  LearnFilter build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LearnFilter, LearnFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LearnFilter, LearnFilter>,
              LearnFilter,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The filtered, sorted Learn list.

@ProviderFor(learnResults)
final learnResultsProvider = LearnResultsProvider._();

/// The filtered, sorted Learn list.

final class LearnResultsProvider
    extends
        $FunctionalProvider<
          List<ContentItem>,
          List<ContentItem>,
          List<ContentItem>
        >
    with $Provider<List<ContentItem>> {
  /// The filtered, sorted Learn list.
  LearnResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learnResultsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$learnResultsHash();

  @$internal
  @override
  $ProviderElement<List<ContentItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ContentItem> create(Ref ref) {
    return learnResults(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ContentItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ContentItem>>(value),
    );
  }
}

String _$learnResultsHash() => r'b9aa532fca52529a303671c24cb266ea25b8a0ad';

/// Categories she may browse, with the 18+ section hidden from minors.

@ProviderFor(visibleCategories)
final visibleCategoriesProvider = VisibleCategoriesProvider._();

/// Categories she may browse, with the 18+ section hidden from minors.

final class VisibleCategoriesProvider
    extends
        $FunctionalProvider<
          List<ContentCategory>,
          List<ContentCategory>,
          List<ContentCategory>
        >
    with $Provider<List<ContentCategory>> {
  /// Categories she may browse, with the 18+ section hidden from minors.
  VisibleCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'visibleCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$visibleCategoriesHash();

  @$internal
  @override
  $ProviderElement<List<ContentCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ContentCategory> create(Ref ref) {
    return visibleCategories(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ContentCategory> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ContentCategory>>(value),
    );
  }
}

String _$visibleCategoriesHash() => r'a0df0e92c3d6edf0c582170a375012cb2b1c9a22';

/// One library item by id.

@ProviderFor(contentById)
final contentByIdProvider = ContentByIdFamily._();

/// One library item by id.

final class ContentByIdProvider
    extends $FunctionalProvider<ContentItem?, ContentItem?, ContentItem?>
    with $Provider<ContentItem?> {
  /// One library item by id.
  ContentByIdProvider._({
    required ContentByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'contentByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$contentByIdHash();

  @override
  String toString() {
    return r'contentByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ContentItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ContentItem? create(Ref ref) {
    final argument = this.argument as String;
    return contentById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContentItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContentItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ContentByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$contentByIdHash() => r'9b2699e3e83b50360625edceb28ff04f7c4854bb';

/// One library item by id.

final class ContentByIdFamily extends $Family
    with $FunctionalFamilyOverride<ContentItem?, String> {
  ContentByIdFamily._()
    : super(
        retry: null,
        name: r'contentByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// One library item by id.

  ContentByIdProvider call(String id) =>
      ContentByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'contentByIdProvider';
}

@ProviderFor(courseById)
final courseByIdProvider = CourseByIdFamily._();

final class CourseByIdProvider
    extends $FunctionalProvider<Course?, Course?, Course?>
    with $Provider<Course?> {
  CourseByIdProvider._({
    required CourseByIdFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'courseByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$courseByIdHash();

  @override
  String toString() {
    return r'courseByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Course?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Course? create(Ref ref) {
    final argument = this.argument as String?;
    return courseById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Course? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Course?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CourseByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$courseByIdHash() => r'b71647672b90605ccab815cc04b1aedf90aeed41';

final class CourseByIdFamily extends $Family
    with $FunctionalFamilyOverride<Course?, String?> {
  CourseByIdFamily._()
    : super(
        retry: null,
        name: r'courseByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CourseByIdProvider call(String? id) =>
      CourseByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'courseByIdProvider';
}

/// Pregnancy School, ordered around her current week.

@ProviderFor(pregnancySchool)
final pregnancySchoolProvider = PregnancySchoolProvider._();

/// Pregnancy School, ordered around her current week.

final class PregnancySchoolProvider
    extends
        $FunctionalProvider<
          List<ContentItem>,
          List<ContentItem>,
          List<ContentItem>
        >
    with $Provider<List<ContentItem>> {
  /// Pregnancy School, ordered around her current week.
  PregnancySchoolProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pregnancySchoolProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pregnancySchoolHash();

  @$internal
  @override
  $ProviderElement<List<ContentItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ContentItem> create(Ref ref) {
    return pregnancySchool(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ContentItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ContentItem>>(value),
    );
  }
}

String _$pregnancySchoolHash() => r'629c3703d7f6655650f78731f3d7fea0219ba566';

/// Locale tag for date and PDF formatting.

@ProviderFor(localeTag)
final localeTagProvider = LocaleTagProvider._();

/// Locale tag for date and PDF formatting.

final class LocaleTagProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// Locale tag for date and PDF formatting.
  LocaleTagProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeTagProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeTagHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return localeTag(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$localeTagHash() => r'629d239ce73436375d3ffc855a922b138cf06283';
