// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(circleRepository)
final circleRepositoryProvider = CircleRepositoryProvider._();

final class CircleRepositoryProvider
    extends
        $FunctionalProvider<
          CircleRepository,
          CircleRepository,
          CircleRepository
        >
    with $Provider<CircleRepository> {
  CircleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'circleRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$circleRepositoryHash();

  @$internal
  @override
  $ProviderElement<CircleRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CircleRepository create(Ref ref) {
    return circleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CircleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CircleRepository>(value),
    );
  }
}

String _$circleRepositoryHash() => r'8acb62301fde7879b166b1b52fe0c0f9f2983b9b';

/// Pairs two devices.
///
/// Claiming an invite needs a server, so this is the mock until the Firestore
/// implementation lands with the rest of the backend.

@ProviderFor(linkService)
final linkServiceProvider = LinkServiceProvider._();

/// Pairs two devices.
///
/// Claiming an invite needs a server, so this is the mock until the Firestore
/// implementation lands with the rest of the backend.

final class LinkServiceProvider
    extends $FunctionalProvider<LinkService, LinkService, LinkService>
    with $Provider<LinkService> {
  /// Pairs two devices.
  ///
  /// Claiming an invite needs a server, so this is the mock until the Firestore
  /// implementation lands with the rest of the backend.
  LinkServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'linkServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$linkServiceHash();

  @$internal
  @override
  $ProviderElement<LinkService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LinkService create(Ref ref) {
    return linkService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LinkService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LinkService>(value),
    );
  }
}

String _$linkServiceHash() => r'7eb7ef0059de120e4e0fd152a9d9f3081649e3c9';

@ProviderFor(peerSnapshotService)
final peerSnapshotServiceProvider = PeerSnapshotServiceProvider._();

final class PeerSnapshotServiceProvider
    extends
        $FunctionalProvider<
          PeerSnapshotService,
          PeerSnapshotService,
          PeerSnapshotService
        >
    with $Provider<PeerSnapshotService> {
  PeerSnapshotServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'peerSnapshotServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$peerSnapshotServiceHash();

  @$internal
  @override
  $ProviderElement<PeerSnapshotService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PeerSnapshotService create(Ref ref) {
    return peerSnapshotService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PeerSnapshotService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PeerSnapshotService>(value),
    );
  }
}

String _$peerSnapshotServiceHash() =>
    r'6e807bc47c6a44cc2f6d94801b3f8a75787829dd';

@ProviderFor(partnerSummaryService)
final partnerSummaryServiceProvider = PartnerSummaryServiceProvider._();

final class PartnerSummaryServiceProvider
    extends
        $FunctionalProvider<
          PartnerSummaryService,
          PartnerSummaryService,
          PartnerSummaryService
        >
    with $Provider<PartnerSummaryService> {
  PartnerSummaryServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'partnerSummaryServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$partnerSummaryServiceHash();

  @$internal
  @override
  $ProviderElement<PartnerSummaryService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PartnerSummaryService create(Ref ref) {
    return partnerSummaryService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PartnerSummaryService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PartnerSummaryService>(value),
    );
  }
}

String _$partnerSummaryServiceHash() =>
    r'df0457e58af60faccea34d903b8c0a943050634d';

@ProviderFor(familyLessons)
final familyLessonsProvider = FamilyLessonsProvider._();

final class FamilyLessonsProvider
    extends $FunctionalProvider<FamilyLessons, FamilyLessons, FamilyLessons>
    with $Provider<FamilyLessons> {
  FamilyLessonsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'familyLessonsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$familyLessonsHash();

  @$internal
  @override
  $ProviderElement<FamilyLessons> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FamilyLessons create(Ref ref) {
    return familyLessons(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FamilyLessons value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FamilyLessons>(value),
    );
  }
}

String _$familyLessonsHash() => r'9f844a73f9b80c2d0b48e4b4e1c2961bdf19e1a4';

/// Her partner and family links.

@ProviderFor(CircleController)
final circleControllerProvider = CircleControllerProvider._();

/// Her partner and family links.
final class CircleControllerProvider
    extends $NotifierProvider<CircleController, List<CircleLink>> {
  /// Her partner and family links.
  CircleControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'circleControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$circleControllerHash();

  @$internal
  @override
  CircleController create() => CircleController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CircleLink> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CircleLink>>(value),
    );
  }
}

String _$circleControllerHash() => r'4d3296ac3a2c4061320093af64703dbaa4567029';

/// Her partner and family links.

abstract class _$CircleController extends $Notifier<List<CircleLink>> {
  List<CircleLink> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<CircleLink>, List<CircleLink>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<CircleLink>, List<CircleLink>>,
              List<CircleLink>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Her link of one kind, or null when there is none.

@ProviderFor(linkOfKind)
final linkOfKindProvider = LinkOfKindFamily._();

/// Her link of one kind, or null when there is none.

final class LinkOfKindProvider
    extends $FunctionalProvider<CircleLink?, CircleLink?, CircleLink?>
    with $Provider<CircleLink?> {
  /// Her link of one kind, or null when there is none.
  LinkOfKindProvider._({
    required LinkOfKindFamily super.from,
    required LinkKind super.argument,
  }) : super(
         retry: null,
         name: r'linkOfKindProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$linkOfKindHash();

  @override
  String toString() {
    return r'linkOfKindProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<CircleLink?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CircleLink? create(Ref ref) {
    final argument = this.argument as LinkKind;
    return linkOfKind(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CircleLink? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CircleLink?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LinkOfKindProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$linkOfKindHash() => r'529128327ddb2025ca6bf40bfa2a7482e78464f6';

/// Her link of one kind, or null when there is none.

final class LinkOfKindFamily extends $Family
    with $FunctionalFamilyOverride<CircleLink?, LinkKind> {
  LinkOfKindFamily._()
    : super(
        retry: null,
        name: r'linkOfKindProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Her link of one kind, or null when there is none.

  LinkOfKindProvider call(LinkKind kind) =>
      LinkOfKindProvider._(argument: kind, from: this);

  @override
  String toString() => r'linkOfKindProvider';
}

/// What the other person sees, built from her own data.
///
/// Used for her "see what he sees" preview, and later for the payload the
/// backend stores for him. Keyed by link id rather than by the scope set, so
/// the provider is cached properly and follows her switches.

@ProviderFor(sharedSummary)
final sharedSummaryProvider = SharedSummaryFamily._();

/// What the other person sees, built from her own data.
///
/// Used for her "see what he sees" preview, and later for the payload the
/// backend stores for him. Keyed by link id rather than by the scope set, so
/// the provider is cached properly and follows her switches.

final class SharedSummaryProvider
    extends $FunctionalProvider<PartnerSummary, PartnerSummary, PartnerSummary>
    with $Provider<PartnerSummary> {
  /// What the other person sees, built from her own data.
  ///
  /// Used for her "see what he sees" preview, and later for the payload the
  /// backend stores for him. Keyed by link id rather than by the scope set, so
  /// the provider is cached properly and follows her switches.
  SharedSummaryProvider._({
    required SharedSummaryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sharedSummaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sharedSummaryHash();

  @override
  String toString() {
    return r'sharedSummaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<PartnerSummary> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PartnerSummary create(Ref ref) {
    final argument = this.argument as String;
    return sharedSummary(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PartnerSummary value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PartnerSummary>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SharedSummaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sharedSummaryHash() => r'cfa4a5a7134dbf9368a018cf3d7068d2d8c5e111';

/// What the other person sees, built from her own data.
///
/// Used for her "see what he sees" preview, and later for the payload the
/// backend stores for him. Keyed by link id rather than by the scope set, so
/// the provider is cached properly and follows her switches.

final class SharedSummaryFamily extends $Family
    with $FunctionalFamilyOverride<PartnerSummary, String> {
  SharedSummaryFamily._()
    : super(
        retry: null,
        name: r'sharedSummaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// What the other person sees, built from her own data.
  ///
  /// Used for her "see what he sees" preview, and later for the payload the
  /// backend stores for him. Keyed by link id rather than by the scope set, so
  /// the provider is cached properly and follows her switches.

  SharedSummaryProvider call(String linkId) =>
      SharedSummaryProvider._(argument: linkId, from: this);

  @override
  String toString() => r'sharedSummaryProvider';
}

/// What this device is told about the peer, on the viewer side.

@ProviderFor(peerSummary)
final peerSummaryProvider = PeerSummaryFamily._();

/// What this device is told about the peer, on the viewer side.

final class PeerSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<PartnerSummary>,
          PartnerSummary,
          FutureOr<PartnerSummary>
        >
    with $FutureModifier<PartnerSummary>, $FutureProvider<PartnerSummary> {
  /// What this device is told about the peer, on the viewer side.
  PeerSummaryProvider._({
    required PeerSummaryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'peerSummaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$peerSummaryHash();

  @override
  String toString() {
    return r'peerSummaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PartnerSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PartnerSummary> create(Ref ref) {
    final argument = this.argument as String;
    return peerSummary(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PeerSummaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$peerSummaryHash() => r'4c04c98b61810b045a1a7a57b03990bc2ea46261';

/// What this device is told about the peer, on the viewer side.

final class PeerSummaryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PartnerSummary>, String> {
  PeerSummaryFamily._()
    : super(
        retry: null,
        name: r'peerSummaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// What this device is told about the peer, on the viewer side.

  PeerSummaryProvider call(String linkId) =>
      PeerSummaryProvider._(argument: linkId, from: this);

  @override
  String toString() => r'peerSummaryProvider';
}

/// Lessons a mother and daughter get together.

@ProviderFor(sharedFamilyLessons)
final sharedFamilyLessonsProvider = SharedFamilyLessonsProvider._();

/// Lessons a mother and daughter get together.

final class SharedFamilyLessonsProvider
    extends
        $FunctionalProvider<
          List<ContentItem>,
          List<ContentItem>,
          List<ContentItem>
        >
    with $Provider<List<ContentItem>> {
  /// Lessons a mother and daughter get together.
  SharedFamilyLessonsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedFamilyLessonsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedFamilyLessonsHash();

  @$internal
  @override
  $ProviderElement<List<ContentItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ContentItem> create(Ref ref) {
    return sharedFamilyLessons(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ContentItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ContentItem>>(value),
    );
  }
}

String _$sharedFamilyLessonsHash() =>
    r'20ee420d54bd49a21b04b6ccddb7cff69272007b';
