// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The assistant backend.
///
/// Mock answers until the FastAPI proxy is deployed; the app never carries a
/// model provider's key either way.

@ProviderFor(aiService)
final aiServiceProvider = AiServiceProvider._();

/// The assistant backend.
///
/// Mock answers until the FastAPI proxy is deployed; the app never carries a
/// model provider's key either way.

final class AiServiceProvider
    extends $FunctionalProvider<AiService, AiService, AiService>
    with $Provider<AiService> {
  /// The assistant backend.
  ///
  /// Mock answers until the FastAPI proxy is deployed; the app never carries a
  /// model provider's key either way.
  AiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiServiceHash();

  @$internal
  @override
  $ProviderElement<AiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AiService create(Ref ref) {
    return aiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiService>(value),
    );
  }
}

String _$aiServiceHash() => r'ba8adac26bdbe4a22d91525a2ee8af7097fdb2d9';

@ProviderFor(emergencyDetector)
final emergencyDetectorProvider = EmergencyDetectorProvider._();

final class EmergencyDetectorProvider
    extends
        $FunctionalProvider<
          EmergencyDetector,
          EmergencyDetector,
          EmergencyDetector
        >
    with $Provider<EmergencyDetector> {
  EmergencyDetectorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'emergencyDetectorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$emergencyDetectorHash();

  @$internal
  @override
  $ProviderElement<EmergencyDetector> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EmergencyDetector create(Ref ref) {
    return emergencyDetector(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmergencyDetector value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmergencyDetector>(value),
    );
  }
}

String _$emergencyDetectorHash() => r'ffaae7c346b9313fb435cfb1e32e9074a8088a4f';

@ProviderFor(aiQuota)
final aiQuotaProvider = AiQuotaProvider._();

final class AiQuotaProvider
    extends $FunctionalProvider<AiQuota, AiQuota, AiQuota>
    with $Provider<AiQuota> {
  AiQuotaProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiQuotaProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiQuotaHash();

  @$internal
  @override
  $ProviderElement<AiQuota> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AiQuota create(Ref ref) {
    return aiQuota(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiQuota value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiQuota>(value),
    );
  }
}

String _$aiQuotaHash() => r'c6aa63c513a2ca79eae9668dd4505ca8e0ca01e2';

@ProviderFor(chatRepository)
final chatRepositoryProvider = ChatRepositoryProvider._();

final class ChatRepositoryProvider
    extends $FunctionalProvider<ChatRepository, ChatRepository, ChatRepository>
    with $Provider<ChatRepository> {
  ChatRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRepositoryHash();

  @$internal
  @override
  $ProviderElement<ChatRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChatRepository create(Ref ref) {
    return chatRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatRepository>(value),
    );
  }
}

String _$chatRepositoryHash() => r'bcd7b2764dc45573ef2b5028a0c88c305ed586c4';

@ProviderFor(aiUsageRepository)
final aiUsageRepositoryProvider = AiUsageRepositoryProvider._();

final class AiUsageRepositoryProvider
    extends
        $FunctionalProvider<
          AiUsageRepository,
          AiUsageRepository,
          AiUsageRepository
        >
    with $Provider<AiUsageRepository> {
  AiUsageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiUsageRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiUsageRepositoryHash();

  @$internal
  @override
  $ProviderElement<AiUsageRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AiUsageRepository create(Ref ref) {
    return aiUsageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiUsageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiUsageRepository>(value),
    );
  }
}

String _$aiUsageRepositoryHash() => r'd6869fd652dfd738016c5c25e271ed5fdc8c84a4';

/// How many messages she has sent today.

@ProviderFor(AiUsageController)
final aiUsageControllerProvider = AiUsageControllerProvider._();

/// How many messages she has sent today.
final class AiUsageControllerProvider
    extends $NotifierProvider<AiUsageController, AiUsage> {
  /// How many messages she has sent today.
  AiUsageControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiUsageControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiUsageControllerHash();

  @$internal
  @override
  AiUsageController create() => AiUsageController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiUsage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiUsage>(value),
    );
  }
}

String _$aiUsageControllerHash() => r'e1b6fa922414108cd82ebd9d8ce07a3bb036623e';

/// How many messages she has sent today.

abstract class _$AiUsageController extends $Notifier<AiUsage> {
  AiUsage build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AiUsage, AiUsage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AiUsage, AiUsage>,
              AiUsage,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Messages left today, or null with premium.

@ProviderFor(aiMessagesLeft)
final aiMessagesLeftProvider = AiMessagesLeftProvider._();

/// Messages left today, or null with premium.

final class AiMessagesLeftProvider extends $FunctionalProvider<int?, int?, int?>
    with $Provider<int?> {
  /// Messages left today, or null with premium.
  AiMessagesLeftProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiMessagesLeftProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiMessagesLeftHash();

  @$internal
  @override
  $ProviderElement<int?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int? create(Ref ref) {
    return aiMessagesLeft(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$aiMessagesLeftHash() => r'12c69d16356210d076c8ce727efba8e116ef3b9d';

/// Whether the next message would go through.

@ProviderFor(canSendAiMessage)
final canSendAiMessageProvider = CanSendAiMessageProvider._();

/// Whether the next message would go through.

final class CanSendAiMessageProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the next message would go through.
  CanSendAiMessageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'canSendAiMessageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$canSendAiMessageHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return canSendAiMessage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$canSendAiMessageHash() => r'4a586be3bf2231db43aab636b10754442a25e7cc';

/// What the assistant is told about her: an age band, a stage, a cycle day.

@ProviderFor(aiUserContext)
final aiUserContextProvider = AiUserContextProvider._();

/// What the assistant is told about her: an age band, a stage, a cycle day.

final class AiUserContextProvider
    extends $FunctionalProvider<AiUserContext, AiUserContext, AiUserContext>
    with $Provider<AiUserContext> {
  /// What the assistant is told about her: an age band, a stage, a cycle day.
  AiUserContextProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiUserContextProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiUserContextHash();

  @$internal
  @override
  $ProviderElement<AiUserContext> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AiUserContext create(Ref ref) {
    return aiUserContext(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiUserContext value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiUserContext>(value),
    );
  }
}

String _$aiUserContextHash() => r'88fabbdae73233c518946e20e1ffb47fc4dda652';

/// Starter questions for her stage, with the adult ones hidden from minors.

@ProviderFor(aiSuggestedQuestions)
final aiSuggestedQuestionsProvider = AiSuggestedQuestionsProvider._();

/// Starter questions for her stage, with the adult ones hidden from minors.

final class AiSuggestedQuestionsProvider
    extends
        $FunctionalProvider<
          List<SuggestedQuestion>,
          List<SuggestedQuestion>,
          List<SuggestedQuestion>
        >
    with $Provider<List<SuggestedQuestion>> {
  /// Starter questions for her stage, with the adult ones hidden from minors.
  AiSuggestedQuestionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiSuggestedQuestionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiSuggestedQuestionsHash();

  @$internal
  @override
  $ProviderElement<List<SuggestedQuestion>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<SuggestedQuestion> create(Ref ref) {
    return aiSuggestedQuestions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SuggestedQuestion> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SuggestedQuestion>>(value),
    );
  }
}

String _$aiSuggestedQuestionsHash() =>
    r'b235b386963f57ae849351080457780e59d8e712';
