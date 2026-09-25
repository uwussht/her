import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/utils/date_utils.dart';
import 'package:her_circle/features/tracker/domain/tracker_enums.dart';
import 'package:her_circle/features/tracker/presentation/reminders_screen.dart';
import 'package:her_circle/features/tracker/presentation/tracker_providers.dart';
import 'package:her_circle/features/tracker/presentation/reminders_controller.dart';
import 'package:her_circle/features/tracker/presentation/vaccinations_screen.dart';
import 'package:her_circle/features/tracker/presentation/widgets/daily_log_sheet.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../helpers/pump_app.dart';

void main() {
  Future<void> openTracker(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.water_drop_outlined));
    await tester.pumpAndSettle();
  }

  /// Brings [finder] on screen, scrolling [scrollable] when the widget has
  /// not been built yet.
  Future<void> reveal(
    WidgetTester tester,
    Finder finder, {
    Finder? scrollable,
  }) async {
    if (finder.evaluate().isEmpty) {
      await tester.scrollUntilVisible(
        finder,
        120,
        scrollable: scrollable ?? find.byType(Scrollable).first,
      );
    } else {
      await tester.ensureVisible(finder.first);
    }
    await tester.pumpAndSettle();
  }

  /// Scrolls the page list back to the top.
  Future<void> scrollToTop(WidgetTester tester) async {
    await tester.drag(find.byType(Scrollable).first, const Offset(0, 2000));
    await tester.pumpAndSettle();
  }

  Future<void> tapAt(
    WidgetTester tester,
    Finder finder, {
    Finder? scrollable,
  }) async {
    await reveal(tester, finder, scrollable: scrollable);
    await tester.tap(finder.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapText(WidgetTester tester, String text) =>
      tapAt(tester, find.text(text));

  /// The daily log sheet scrolls independently of the page behind it.
  final sheetScrollable = find
      .descendant(
        of: find.byType(DailyLogSheet),
        matching: find.byType(Scrollable),
      )
      .last;

  testWidgets('empty tracker offers to mark the first period', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: null),
      prefs: {'settings.locale': 'en'},
    );
    await openTracker(tester);

    expect(find.text('Start tracking your cycle'), findsOneWidget);
    await tapText(tester, 'Mark period start');

    // The status card replaces the empty state, on cycle day 1.
    expect(find.text('Period, day 1'), findsOneWidget);
    expect(find.text('Day 1'), findsOneWidget);
  });

  testWidgets('shows the cycle day, phase and next period', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-11)),
      prefs: {'settings.locale': 'en'},
    );
    await openTracker(tester);

    expect(find.text('Day 12'), findsOneWidget);
    expect(find.text('28-day cycle'), findsOneWidget);
    // One logged cycle only, so the forecast is labelled an estimate.
    expect(find.text('Estimate'), findsOneWidget);
    // Day 12 of a 28-day cycle sits in the fertile window.
    expect(find.text('Fertile window'), findsWidgets);
    final nextPeriod = DateFormat.MMMMd('en')
        .format(today().addDays(-11).addDays(28));
    expect(find.text('Next period: $nextPeriod'), findsOneWidget);
  });

  testWidgets('a late period is called out', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-32)),
      prefs: {'settings.locale': 'en'},
    );
    await openTracker(tester);

    expect(find.text('4 days late'), findsOneWidget);
  });

  testWidgets('logging mood and flow updates the day and the chart', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-5)),
      prefs: {'settings.locale': 'en'},
    );
    await openTracker(tester);

    await reveal(
      tester,
      find.text('Log your mood and a chart will appear here.'),
    );

    await scrollToTop(tester);
    await tapText(tester, 'Log today');
    expect(find.byType(DailyLogSheet), findsOneWidget);

    // Flow and energy both offer "Medium"; flow's chips come first.
    await tapAt(
      tester,
      find.widgetWithText(ChoiceChip, 'Medium').first,
      scrollable: sheetScrollable,
    );
    await tapAt(tester, find.text('Good'), scrollable: sheetScrollable);
    await tapAt(
      tester,
      find.widgetWithText(FilterChip, 'Cramps'),
      scrollable: sheetScrollable,
    );
    await tapAt(
      tester,
      find.widgetWithText(FilledButton, 'Save'),
      scrollable: sheetScrollable,
    );

    expect(find.text('Log saved'), findsOneWidget);
    final log = container.read(cycleTimelineProvider).logFor(today())!;
    expect(log.flow, FlowLevel.medium);
    expect(log.mood, Mood.good);
    expect(log.symptoms, [Symptom.cramps]);

    // The mood chart replaces its empty state.
    await reveal(tester, find.text('Average 4.0'));
    expect(
      find.text('Log your mood and a chart will appear here.'),
      findsNothing,
    );
  });

  testWidgets('selecting a calendar day shows its actions', (tester) async {
    final container = await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-20)),
      prefs: {'settings.locale': 'en'},
    );
    await openTracker(tester);

    // Pick a day earlier this month and mark a period on it.
    final target = today().addDays(-2);
    final cell = find.descendant(
      of: find.byType(TableCalendar<void>),
      matching: find.text('${target.day}'),
    );
    await reveal(tester, cell);
    await tester.tap(cell.first);
    await tester.pumpAndSettle();

    final dayLabel = find.text(DateFormat.yMMMMEEEEd('en').format(target));
    await reveal(tester, dayLabel);
    expect(dayLabel, findsOneWidget);
    await tapText(tester, 'Period started');

    final timeline = container.read(cycleTimelineProvider);
    expect(timeline.isBleedingOn(target), isTrue);
    // The earlier cycle is kept, so the next forecast has two data points.
    expect(timeline.cycles.length, 2);
    expect(find.text('Remove mark'), findsOneWidget);
  });

  testWidgets('reminders can be toggled and vaccinations opened', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-5)),
      prefs: {'settings.locale': 'en'},
    );
    await openTracker(tester);

    await tester.tap(find.byIcon(Icons.notifications_none_rounded));
    await tester.pumpAndSettle();
    expect(find.byType(RemindersScreen), findsOneWidget);

    // The pill reminder is off by default.
    await reveal(tester, find.byType(Switch));
    final pillSwitch = find.byType(Switch).at(2);
    expect(tester.widget<Switch>(pillSwitch).value, isFalse);
    await tester.tap(pillSwitch);
    await tester.pumpAndSettle();
    expect(container.read(remindersControllerProvider)[2].enabled, isTrue);

    await tapText(tester, 'Vaccinations');
    expect(find.byType(VaccinationsScreen), findsOneWidget);
    expect(find.text('Flu'), findsWidgets);

    await tapText(tester, 'Mark as done');
    expect(find.text('Done'), findsWidgets);
  });

  testWidgets('pregnancy stage offers cycle mode until step 10', (
    tester,
  ) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(
        lifeStage: LifeStage.pregnant,
        lastPeriodStart: today().addDays(-60),
      ),
      prefs: {'settings.locale': 'en'},
    );
    await openTracker(tester);

    expect(
      find.textContaining('Pregnancy mode is coming soon'),
      findsOneWidget,
    );
    await tapText(tester, 'Open the cycle calendar');
    expect(find.text('Day 61'), findsOneWidget);
  });
}
