// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(profileRepository)
final profileRepositoryProvider = ProfileRepositoryProvider._();

final class ProfileRepositoryProvider
    extends
        $FunctionalProvider<
          ProfileRepository,
          ProfileRepository,
          ProfileRepository
        >
    with $Provider<ProfileRepository> {
  ProfileRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProfileRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProfileRepository create(Ref ref) {
    return profileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileRepository>(value),
    );
  }
}

String _$profileRepositoryHash() => r'1734d9d842a9933a77058ba581a867a284b24f9d';

/// The signed-in user's personalization, or null before the quiz.

@ProviderFor(UserProfileController)
final userProfileControllerProvider = UserProfileControllerProvider._();

/// The signed-in user's personalization, or null before the quiz.
final class UserProfileControllerProvider
    extends $NotifierProvider<UserProfileController, UserProfile?> {
  /// The signed-in user's personalization, or null before the quiz.
  UserProfileControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProfileControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userProfileControllerHash();

  @$internal
  @override
  UserProfileController create() => UserProfileController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserProfile? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserProfile?>(value),
    );
  }
}

String _$userProfileControllerHash() =>
    r'f81eeb4843a7813ebfaa7af71702dd476ed478cc';

/// The signed-in user's personalization, or null before the quiz.

abstract class _$UserProfileController extends $Notifier<UserProfile?> {
  UserProfile? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<UserProfile?, UserProfile?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserProfile?, UserProfile?>,
              UserProfile?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
