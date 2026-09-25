import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/qa/presentation/ask_question_screen.dart';
import 'package:her_circle/features/qa/presentation/qa_controller.dart';
import 'package:her_circle/features/qa/presentation/qa_screen.dart';
import 'package:her_circle/features/qa/presentation/question_detail_screen.dart';

import '../../helpers/pump_app.dart';

void main() {
  Future<void> openQa(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.school_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.forum_outlined));
    await tester.pumpAndSettle();
  }

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

  Future<void> tapText(WidgetTester tester, String text) async {
    final finder = find.text(text);
    await reveal(tester, finder);
    await tester.tap(finder.first);
    await tester.pumpAndSettle();
  }

  testWidgets('lists questions with answers and sorts them', (tester) async {
    await pumpHerCircle(tester, prefs: {'settings.locale': 'en'});
    await openQa(tester);

    expect(find.byType(QaScreen), findsOneWidget);
    expect(find.textContaining('My cycle is 35 days'), findsWidgets);
    expect(find.textContaining('Answered by'), findsWidgets);
    // Free users are told what Premium changes here.
    expect(
      find.textContaining('your questions go to the front'),
      findsOneWidget,
    );

    await tapText(tester, 'Unanswered');
    expect(find.text('Waiting for a doctor’s answer'), findsNothing);
    expect(find.textContaining('breastfeeding'), findsWidgets);
  });

  testWidgets('opens a thread, sees credentials and upvotes', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openQa(tester);

    await tapText(tester, 'Can I exercise during my period?');
    expect(find.byType(QuestionDetailScreen), findsOneWidget);
    expect(find.text('Айгүл Сәрсенова'), findsOneWidget);
    expect(find.text('14 years in practice'), findsOneWidget);
    expect(
      find.textContaining('Moderate movement often eases'),
      findsOneWidget,
    );

    await tapText(tester, 'Helpful · 167');
    expect(
      container.read(qaControllerProvider).upvotedQuestionIds,
      contains('q2'),
    );
    // The count updates straight away.
    expect(find.text('Helpful · 168'), findsOneWidget);
  });

  testWidgets('asks a question anonymously', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openQa(tester);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(AskQuestionScreen), findsOneWidget);

    // Too short to send.
    await tester.enterText(find.byType(TextFormField), 'Short');
    await tapText(tester, 'Send');
    expect(find.textContaining('at least 15 characters'), findsOneWidget);

    await tester.enterText(
      find.byType(TextFormField),
      'Is it normal to feel dizzy on the first day?',
    );
    await tapText(tester, 'Send');

    expect(find.byType(QaScreen), findsOneWidget);
    expect(find.textContaining('A doctor will answer'), findsOneWidget);

    final mine = container.read(qaControllerProvider).myQuestions;
    expect(mine.length, 1);
    expect(mine.single.isAnonymous, isTrue);
    expect(mine.single.priority, isFalse);

    // It shows up under "My questions".
    await tester.tap(find.byIcon(Icons.person_outline_rounded).last);
    await tester.pumpAndSettle();
    expect(find.textContaining('dizzy on the first day'), findsWidgets);
  });

  testWidgets('premium users ask with priority', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en', 'premium.status': 'trial'},
    );
    await openQa(tester);
    // The Premium nudge is gone for subscribers.
    expect(find.textContaining('front of the queue'), findsNothing);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byType(TextFormField),
      'Which vitamins matter in the second trimester?',
    );
    await tapText(tester, 'Send');

    expect(find.textContaining('Premium priority'), findsOneWidget);
    expect(
      container.read(qaControllerProvider).myQuestions.single.priority,
      isTrue,
    );
  });

  testWidgets('a teen cannot pick the 18+ category', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(
        ageGroup: AgeGroup.age10to15,
        lifeStage: LifeStage.firstPeriod,
      ),
      prefs: {'settings.locale': 'en'},
    );
    await openQa(tester);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.text('Intimacy & relationships'), findsNothing);
    expect(find.text('My body'), findsWidgets);
  });
}
