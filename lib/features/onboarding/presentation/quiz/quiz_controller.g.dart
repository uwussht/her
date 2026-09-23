// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizController)
final quizControllerProvider = QuizControllerProvider._();

final class QuizControllerProvider
    extends $NotifierProvider<QuizController, QuizDraft> {
  QuizControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizControllerHash();

  @$internal
  @override
  QuizController create() => QuizController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizDraft value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizDraft>(value),
    );
  }
}

String _$quizControllerHash() => r'936a9d1c25b1c18adbb7afc0e82994a7799b8369';

abstract class _$QuizController extends $Notifier<QuizDraft> {
  QuizDraft build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<QuizDraft, QuizDraft>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<QuizDraft, QuizDraft>,
              QuizDraft,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
