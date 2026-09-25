import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/utils/date_utils.dart';
import 'package:her_circle/features/learn/presentation/content_detail_screen.dart';
import 'package:her_circle/features/learn/presentation/widgets/content_card.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/qa/presentation/widgets/question_card.dart';
import 'package:her_circle/features/shop/presentation/widgets/product_card.dart';
import 'package:her_circle/features/tracker/presentation/widgets/cycle_status_card.dart';

import '../../helpers/pump_app.dart';

void main() {
  Future<void> reveal(WidgetTester tester, Finder finder) async {
    if (finder.evaluate().isEmpty) {
      await tester.scrollUntilVisible(
        finder,
        160,
        scrollable: find.byType(Scrollable).first,
      );
    } else {
      await tester.ensureVisible(finder.first);
    }
    await tester.pumpAndSettle();
  }

  testWidgets('greets her and shows the cycle status', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-11)),
      prefs: {'settings.locale': 'en'},
    );

    expect(find.text('How are you feeling today?'), findsOneWidget);
    expect(find.byType(CycleStatusCard), findsOneWidget);
    expect(find.text('Day 12'), findsOneWidget);
  });

  testWidgets('personalises the For you carousel by stage', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(
        lifeStage: LifeStage.menopause,
        interests: const [Interest.menopause],
        lastPeriodStart: today().addDays(-20),
      ),
      prefs: {'settings.locale': 'en'},
    );

    await reveal(tester, find.text('For you'));
    expect(find.byType(ContentCard), findsWidgets);
    // Menopause material is surfaced for a menopause stage.
    expect(find.text('Perimenopause: the first signals'), findsWidgets);
  });

  testWidgets('shows the tip of the day and a course to start', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-2)),
      prefs: {'settings.locale': 'en'},
    );

    await reveal(tester, find.text('Tip of the day'));
    await reveal(tester, find.text('Start a course'));
    expect(find.textContaining('Next:'), findsOneWidget);
  });

  testWidgets('times the shop row to the predicted period', (tester) async {
    await pumpHerCircle(
      tester,
      // A 28-day cycle that started 26 days ago: the period is 2 days away.
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-26)),
      prefs: {'settings.locale': 'en'},
    );

    await reveal(tester, find.text('Your period is close — these help'));
    expect(find.byType(ProductCard), findsWidgets);
    expect(find.text('Night pads, 10 pack'), findsWidgets);
  });

  testWidgets('a pregnant user sees her week and baby size', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(
        lifeStage: LifeStage.pregnant,
        interests: const [Interest.pregnancy],
        // 18 weeks and 4 days ago.
        lastPeriodStart: today().addDays(-130),
      ),
      prefs: {'settings.locale': 'en'},
    );

    expect(find.text('Week 19'), findsOneWidget);
    expect(find.text('Trimester 2'), findsOneWidget);
    expect(find.textContaining('Baby is the size of'), findsOneWidget);
    expect(find.textContaining('days to go'), findsOneWidget);

    await reveal(tester, find.text('For you'));
    // Week-by-week material near her week.
    expect(find.text('Week 18: first movements'), findsWidgets);

    await reveal(tester, find.text('For your pregnancy'));
    expect(find.byType(ProductCard), findsWidgets);
  });

  testWidgets('trending Q&A shows the verified doctor and answer', (
    tester,
  ) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-5)),
      prefs: {'settings.locale': 'en'},
    );

    await reveal(tester, find.text('Ask the experts'));
    expect(find.byType(QuestionCard), findsWidgets);
    expect(find.textContaining('Answered by'), findsWidgets);
  });

  testWidgets('tapping a card opens the content screen', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: today().addDays(-5)),
      prefs: {'settings.locale': 'en'},
    );

    await reveal(tester, find.byType(ContentCard).first);
    await tester.tap(find.byType(ContentCard).first);
    await tester.pumpAndSettle();

    expect(find.byType(ContentDetailScreen), findsOneWidget);
    expect(find.byType(BackButton), findsOneWidget);
  });

  testWidgets('a teen sees no 18+ content and her own shop row', (
    tester,
  ) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(
        ageGroup: AgeGroup.age10to15,
        lifeStage: LifeStage.firstPeriod,
        interests: const [Interest.myBody],
        lastPeriodStart: today().addDays(-10),
      ),
      prefs: {'settings.locale': 'en'},
    );

    await reveal(tester, find.text('For you'));
    expect(find.text('Talking to your partner about intimacy'), findsNothing);
    expect(find.text('Your first period: what to expect'), findsWidgets);

    await reveal(tester, find.text('Your first kit'));
    expect(find.byType(ProductCard), findsWidgets);
  });

  testWidgets('without tracker data it points her at the tracker', (
    tester,
  ) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(lastPeriodStart: null),
      prefs: {'settings.locale': 'en'},
    );

    expect(find.text('Start tracking your cycle'), findsOneWidget);
    expect(find.byType(CycleStatusCard), findsNothing);
    // The rest of the feed still renders.
    await reveal(tester, find.text('For you'));
    expect(find.byType(ContentCard), findsWidgets);
  });
}
