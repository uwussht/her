// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationService)
final notificationServiceProvider = NotificationServiceProvider._();

final class NotificationServiceProvider
    extends
        $FunctionalProvider<
          NotificationService,
          NotificationService,
          NotificationService
        >
    with $Provider<NotificationService> {
  NotificationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationServiceHash();

  @$internal
  @override
  $ProviderElement<NotificationService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationService create(Ref ref) {
    return notificationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationService>(value),
    );
  }
}

String _$notificationServiceHash() =>
    r'63768acd5235dfacc2143d739ff0df5990f5466a';

@ProviderFor(reminderScheduler)
final reminderSchedulerProvider = ReminderSchedulerProvider._();

final class ReminderSchedulerProvider
    extends
        $FunctionalProvider<
          ReminderScheduler,
          ReminderScheduler,
          ReminderScheduler
        >
    with $Provider<ReminderScheduler> {
  ReminderSchedulerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reminderSchedulerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reminderSchedulerHash();

  @$internal
  @override
  $ProviderElement<ReminderScheduler> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReminderScheduler create(Ref ref) {
    return reminderScheduler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReminderScheduler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReminderScheduler>(value),
    );
  }
}

String _$reminderSchedulerHash() => r'4a42bdfa1748de6231758705e1ea03282d19a9c0';

/// Her reminders. New users start with the defaults for their life stage.

@ProviderFor(RemindersController)
final remindersControllerProvider = RemindersControllerProvider._();

/// Her reminders. New users start with the defaults for their life stage.
final class RemindersControllerProvider
    extends $NotifierProvider<RemindersController, List<Reminder>> {
  /// Her reminders. New users start with the defaults for their life stage.
  RemindersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remindersControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remindersControllerHash();

  @$internal
  @override
  RemindersController create() => RemindersController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Reminder> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Reminder>>(value),
    );
  }
}

String _$remindersControllerHash() =>
    r'11eff23670c7b3b29032eefe4408c573d8526852';

/// Her reminders. New users start with the defaults for their life stage.

abstract class _$RemindersController extends $Notifier<List<Reminder>> {
  List<Reminder> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Reminder>, List<Reminder>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Reminder>, List<Reminder>>,
              List<Reminder>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Her vaccination plan, seeded from the age- and stage-based schedule.

@ProviderFor(VaccinationsController)
final vaccinationsControllerProvider = VaccinationsControllerProvider._();

/// Her vaccination plan, seeded from the age- and stage-based schedule.
final class VaccinationsControllerProvider
    extends $NotifierProvider<VaccinationsController, List<Vaccination>> {
  /// Her vaccination plan, seeded from the age- and stage-based schedule.
  VaccinationsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vaccinationsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vaccinationsControllerHash();

  @$internal
  @override
  VaccinationsController create() => VaccinationsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Vaccination> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Vaccination>>(value),
    );
  }
}

String _$vaccinationsControllerHash() =>
    r'a71ed4b421273bef23bb66fc6b776ba20a549b57';

/// Her vaccination plan, seeded from the age- and stage-based schedule.

abstract class _$VaccinationsController extends $Notifier<List<Vaccination>> {
  List<Vaccination> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Vaccination>, List<Vaccination>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Vaccination>, List<Vaccination>>,
              List<Vaccination>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
