import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/services/storage/local_store.dart';
import 'package:her_circle/core/services/storage/preferences_service.dart';
import 'package:her_circle/core/utils/date_utils.dart';
import 'package:her_circle/features/auth/data/mock_auth_repository.dart';
import 'package:her_circle/features/auth/presentation/auth_providers.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/profile/presentation/user_profile_controller.dart';
import 'package:her_circle/features/tracker/domain/daily_log.dart';
import 'package:her_circle/features/tracker/domain/tracker_enums.dart';
import 'package:her_circle/features/tracker/domain/vaccination.dart';
import 'package:her_circle/features/tracker/presentation/reminders_controller.dart';
import 'package:her_circle/features/tracker/presentation/tracker_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/pump_app.dart';

void main() {
  late ProviderContainer container;
  late InMemoryLocalStore store;

  Future<ProviderContainer> makeContainer({DateTime? lastPeriodStart}) async {
    // A stored mock session means the repository starts signed in, so the
    // auth stream never emits a signed-out state mid-test.
    SharedPreferences.setMockInitialValues({
      'mockAuth.session': jsonEncode(testUser.toJson()),
    });
    final prefs = await SharedPreferences.getInstance();
    store = InMemoryLocalStore();
    final profile = testProfile.copyWith(lastPeriodStart: lastPeriodStart);
    await store.writeJson('profile.${profile.uid}', profile.toJson());

    final result = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        localStoreProvider.overrideWithValue(store),
        authRepositoryProvider.overrideWith(
          (ref) => MockAuthRepository(
            ref.watch(preferencesServiceProvider),
            latency: Duration.zero,
          ),
        ),
      ],
    );
    addTearDown(result.dispose);
    // Keep derived providers alive.
    result.listen(cycleTimelineProvider, (_, _) {});
    // Let the auth stream deliver the restored session.
    await pumpEventQueue();
    expect(result.read(currentUserProvider), testUser);
    return result;
  }

  TrackerController controller() =>
      container.read(trackerControllerProvider.notifier);

  test('the quiz date seeds the forecast before anything is logged', () async {
    container = await makeContainer(lastPeriodStart: today().addDays(-10));

    final timeline = container.read(cycleTimelineProvider);
    expect(timeline.hasData, isTrue);
    expect(timeline.currentCycleDay, 11);
    expect(timeline.prediction, isNotNull);
  });

  test('without a quiz date there is nothing to predict from', () async {
    container = await makeContainer();
    expect(container.read(cycleTimelineProvider).hasData, isFalse);
    expect(container.read(cyclePredictionProvider), isNull);
  });

  test('starting a period begins a new cycle and persists it', () async {
    container = await makeContainer(lastPeriodStart: today().addDays(-30));
    await controller().startPeriod(today());

    final timeline = container.read(cycleTimelineProvider);
    expect(timeline.cycles.length, 2);
    expect(timeline.currentCycleDay, 1);
    expect(timeline.isBleedingOn(today()), isTrue);
    // Written through to storage, not just held in memory.
    expect(store.readJson('tracker.cycles.${testUser.uid}'), isNotNull);
  });

  test('marking the same day twice does not duplicate the cycle', () async {
    container = await makeContainer();
    await controller().startPeriod(today());
    await controller().startPeriod(today());
    expect(container.read(cycleTimelineProvider).cycles.length, 1);
  });

  test('ending a period sets its last bleeding day', () async {
    container = await makeContainer();
    await controller().startPeriod(today().addDays(-4));
    await controller().endPeriod(today().addDays(-1));

    final timeline = container.read(cycleTimelineProvider);
    expect(timeline.currentCycle!.periodLength, 4);
    expect(timeline.isBleedingOn(today().addDays(-1)), isTrue);
    expect(timeline.isBleedingOn(today()), isFalse);
  });

  test('removing the start day deletes the cycle', () async {
    container = await makeContainer();
    await controller().startPeriod(today());
    await controller().removePeriodMark(today());
    expect(container.read(cycleTimelineProvider).cycles, isEmpty);
  });

  test('removing a later day shortens the period', () async {
    container = await makeContainer();
    await controller().startPeriod(today().addDays(-4));
    await controller().endPeriod(today());
    await controller().removePeriodMark(today().addDays(-1));

    final cycle = container.read(cycleTimelineProvider).currentCycle!;
    expect(cycle.periodLength, 3);
  });

  test('saving a log stores it; clearing every field removes it', () async {
    container = await makeContainer(lastPeriodStart: today().addDays(-5));
    final log = DailyLog(
      date: today(),
      flow: FlowLevel.medium,
      mood: Mood.good,
      symptoms: const [Symptom.cramps],
      sleepHours: 7.5,
      notes: '  ',
    );
    await controller().saveLog(log);

    var timeline = container.read(cycleTimelineProvider);
    expect(timeline.logFor(today())!.mood, Mood.good);
    expect(timeline.logFor(today())!.sleepHours, 7.5);

    await controller().saveLog(DailyLog(date: today()));
    timeline = container.read(cycleTimelineProvider);
    expect(timeline.logFor(today()), isNull);
  });

  test('logs survive a rebuild of the repository', () async {
    container = await makeContainer(lastPeriodStart: today().addDays(-5));
    await controller().saveLog(DailyLog(date: today(), mood: Mood.awful));

    container.invalidate(trackerControllerProvider);
    expect(
      container.read(cycleTimelineProvider).logFor(today())!.mood,
      Mood.awful,
    );
  });

  test('the tracker mode follows her life stage', () async {
    container = await makeContainer();
    expect(container.read(trackerModeProvider), TrackerMode.cycle);

    await container
        .read(userProfileControllerProvider.notifier)
        .save(testProfile.copyWith(lifeStage: LifeStage.pregnant));
    expect(container.read(trackerModeProvider), TrackerMode.pregnancy);

    await container
        .read(userProfileControllerProvider.notifier)
        .save(testProfile.copyWith(lifeStage: LifeStage.menopause));
    expect(container.read(trackerModeProvider), TrackerMode.menopause);
  });

  test('vaccinations are seeded from age and stage, then editable', () async {
    container = await makeContainer();
    final seeded = container.read(vaccinationsControllerProvider);
    expect(seeded, isNotEmpty);
    expect(seeded.every((item) => item.suggested), isTrue);

    final first = seeded.first;
    await container
        .read(vaccinationsControllerProvider.notifier)
        .setStatus(first, VaccinationStatus.done);

    final updated = container
        .read(vaccinationsControllerProvider)
        .firstWhere((item) => item.id == first.id);
    expect(updated.status, VaccinationStatus.done);
    // An edited entry is no longer a plain suggestion.
    expect(updated.suggested, isFalse);
  });

  test('reminders start from the stage defaults and persist changes', () async {
    container = await makeContainer();
    final reminders = container.read(remindersControllerProvider);
    expect(reminders, isNotEmpty);

    final period = reminders.first;
    await container
        .read(remindersControllerProvider.notifier)
        .update(period.copyWith(daysBefore: 5));

    container.invalidate(remindersControllerProvider);
    expect(container.read(remindersControllerProvider).first.daysBefore, 5);
  });
}
