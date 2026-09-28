import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/utils/date_utils.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/tracker/domain/kick_session.dart';
import 'package:her_circle/features/tracker/presentation/contraction_timer_screen.dart';
import 'package:her_circle/features/tracker/presentation/kick_counter_screen.dart';
import 'package:her_circle/features/tracker/presentation/pregnancy_providers.dart';
import 'package:her_circle/features/tracker/presentation/weight_log_screen.dart';

import '../../helpers/pump_app.dart';

void main() {
  Future<void> openTracker(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.water_drop_outlined));
    await tester.pumpAndSettle();
  }

  Future<void> reveal(WidgetTester tester, Finder finder) async {
    for (var i = 0; i < 8 && finder.evaluate().isEmpty; i++) {
      await tester.drag(find.byType(Scrollable).first, const Offset(0, -240));
      await tester.pumpAndSettle();
    }
    if (finder.evaluate().isNotEmpty) {
      await tester.ensureVisible(finder.first);
      await tester.pumpAndSettle();
    }
  }

  Future<void> tapText(WidgetTester tester, String text) async {
    final finder = find.text(text);
    await reveal(tester, finder);
    await tester.tap(finder.first);
    await tester.pumpAndSettle();
  }

  testWidgets(
    'pregnancy mode shows the week, the baby size and the countdown',
    (tester) async {
      await pumpHerCircle(
        tester,
        prefs: {'settings.locale': 'en'},
        profile: testProfile.copyWith(
          lifeStage: LifeStage.pregnant,
          lastPeriodStart: today().addDays(-20 * 7),
        ),
      );
      await openTracker(tester);

      expect(find.text('Week 21'), findsOneWidget);
      expect(find.text('Trimester 2'), findsOneWidget);
      expect(find.textContaining('days to go'), findsOneWidget);
      expect(find.textContaining('Baby is the size of'), findsOneWidget);
      expect(find.textContaining('Due date:'), findsOneWidget);
    },
  );

  testWidgets('pregnancy mode asks for the last period when it has none', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      profile: testProfile.copyWith(lifeStage: LifeStage.pregnant),
    );
    await openTracker(tester);

    expect(find.text('Tell us your last period date'), findsOneWidget);
    expect(container.read(pregnancyStatusProvider), isNull);
    // The tools are behind the date, so nothing pretends to know her week.
    expect(find.text('Kick counter'), findsNothing);
  });

  testWidgets('the kick counter counts to ten and then stops', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      profile: testProfile.copyWith(
        lifeStage: LifeStage.pregnant,
        lastPeriodStart: today().addDays(-30 * 7),
      ),
    );
    await openTracker(tester);
    await tapText(tester, 'Kick counter');
    expect(find.byType(KickCounterScreen), findsOneWidget);
    expect(find.text('0 of 10'), findsOneWidget);

    final controller = container.read(kickCounterControllerProvider.notifier);
    final started = DateTime(2026, 9, 28, 9);
    for (var i = 1; i <= KickSession.targetKicks; i++) {
      await controller.kick(now: started.add(Duration(minutes: i)));
    }
    await tester.pumpAndSettle();

    expect(find.text('10 of 10'), findsOneWidget);
    expect(find.textContaining('Ten movements counted'), findsOneWidget);
    expect(controller.running, isNull, reason: 'the session closed itself');
    // And it is in the history, with the count and the time it took.
    expect(find.textContaining('10 movements in'), findsOneWidget);
  });

  testWidgets('a slow count tells her to call, without diagnosing', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      profile: testProfile.copyWith(
        lifeStage: LifeStage.pregnant,
        lastPeriodStart: today().addDays(-30 * 7),
      ),
    );
    await openTracker(tester);
    await tapText(tester, 'Kick counter');

    final controller = container.read(kickCounterControllerProvider.notifier);
    // One movement, more than two hours ago.
    await controller.kick(
      now: DateTime.now().subtract(const Duration(hours: 3)),
    );
    await tester.pumpAndSettle();

    expect(
      find.textContaining('Call your doctor or your maternity hospital'),
      findsOneWidget,
    );
  });

  testWidgets('the contraction timer records and prompts on 5-1-1', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      profile: testProfile.copyWith(
        lifeStage: LifeStage.pregnant,
        lastPeriodStart: today().addDays(-39 * 7),
      ),
    );
    await openTracker(tester);
    await tapText(tester, 'Contraction timer');
    expect(find.byType(ContractionTimerScreen), findsOneWidget);
    expect(find.text('Nothing recorded yet.'), findsOneWidget);

    final controller = container.read(contractionControllerProvider.notifier);
    // One contraction, timed with the single button.
    await controller.toggle();
    await tester.pumpAndSettle();
    expect(find.text('Contraction ended'), findsOneWidget);
    await controller.toggle();
    await tester.pumpAndSettle();
    expect(find.text('Contraction started'), findsOneWidget);
    expect(find.textContaining('in the last hour'), findsOneWidget);

    // Now an hour of five-minutes-apart, minute-long contractions.
    final base = DateTime.now().subtract(const Duration(minutes: 61));
    await controller.clear();
    for (var i = 0; i < 13; i++) {
      await controller.toggle(now: base.add(Duration(minutes: 5 * i)));
      await controller.toggle(
        now: base.add(Duration(minutes: 5 * i, seconds: 61)),
      );
    }
    await tester.pumpAndSettle();

    expect(
      find.textContaining('Time to call your doctor or go to the hospital'),
      findsOneWidget,
    );
  });

  testWidgets('the weight log records a weighing and shows the gain', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      profile: testProfile.copyWith(
        lifeStage: LifeStage.pregnant,
        lastPeriodStart: today().addDays(-20 * 7),
      ),
    );
    await openTracker(tester);
    await tapText(tester, 'Weight');
    expect(find.byType(WeightLogScreen), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, '61.4');
    await tapText(tester, 'Record your weight');

    expect(container.read(weightLogControllerProvider), hasLength(1));
    expect(find.text('Now 61.4 kg'), findsOneWidget);

    // An impossible number is refused rather than stored.
    await tester.enterText(find.byType(TextField).first, '4');
    await tapText(tester, 'Record your weight');
    expect(find.text('Enter a weight between 30 and 250 kg'), findsOneWidget);
    expect(container.read(weightLogControllerProvider), hasLength(1));

    // A second weighing gives her the gain.
    await container
        .read(weightLogControllerProvider.notifier)
        .record(60, on: today().addDays(-7));
    await tester.pumpAndSettle();
    expect(find.text('1.4 kg gained'), findsOneWidget);
  });

  testWidgets('menopause mode is the symptom log', (tester) async {
    await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      profile: testProfile.copyWith(lifeStage: LifeStage.menopause),
    );
    await openTracker(tester);

    expect(
      find.textContaining('Log hot flashes, sleep and mood'),
      findsOneWidget,
    );
    expect(find.text('The last 30 days'), findsWidgets);
    expect(find.text('Log today'), findsOneWidget);
    // No cycle calendar in her face, but it is still reachable.
    expect(find.text('Day 1'), findsNothing);
    expect(find.text('Cycle calendar'), findsOneWidget);
  });

  testWidgets('postpartum mode counts the weeks since the birth', (
    tester,
  ) async {
    await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      profile: testProfile.copyWith(
        lifeStage: LifeStage.postpartum,
        // Due 40 weeks after the last period, so six weeks ago.
        lastPeriodStart: today().addDays(-46 * 7),
      ),
    );
    await openTracker(tester);

    expect(find.text('6 weeks since birth'), findsOneWidget);
    expect(find.textContaining('Your cycle may take a while'), findsOneWidget);
  });
}
