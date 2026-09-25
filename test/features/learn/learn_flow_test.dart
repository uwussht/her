import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/utils/date_utils.dart';
import 'package:her_circle/features/home/presentation/home_providers.dart';
import 'package:her_circle/features/learn/presentation/certificate_screen.dart';
import 'package:her_circle/features/learn/presentation/content_detail_screen.dart';
import 'package:her_circle/features/learn/presentation/course_screen.dart';
import 'package:her_circle/features/learn/presentation/learn_providers.dart';
import 'package:her_circle/features/learn/presentation/lesson_screen.dart';
import 'package:her_circle/features/learn/presentation/pregnancy_school_screen.dart';
import 'package:her_circle/features/learn/presentation/quiz_screen.dart';
import 'package:her_circle/features/premium/presentation/premium_controller.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';

import '../../helpers/pump_app.dart';

void main() {
  Future<void> openLearn(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.school_outlined));
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

  testWidgets('lists the library and filters by category and search', (
    tester,
  ) async {
    await pumpHerCircle(tester, prefs: {'settings.locale': 'en'});
    await openLearn(tester);

    expect(find.text('18 items'), findsOneWidget);

    await tapText(tester, 'Nutrition');
    expect(find.text('Iron and your period'), findsOneWidget);
    expect(find.text('Hot flashes: what helps day to day'), findsNothing);

    await tapText(tester, 'All');
    await tester.enterText(find.byType(TextField).first, 'hot flash');
    await tester.pumpAndSettle();
    expect(find.text('1 items'), findsOneWidget);
    expect(find.text('Hot flashes: what helps day to day'), findsOneWidget);
  });

  testWidgets('hides the 18+ section from a teen', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(
        ageGroup: AgeGroup.age10to15,
        lifeStage: LifeStage.firstPeriod,
      ),
      prefs: {'settings.locale': 'en'},
    );
    await openLearn(tester);

    expect(find.text('Intimacy & relationships'), findsNothing);
    expect(find.text('My body'), findsWidgets);
    // 17 of the 18 items remain.
    expect(find.text('17 items'), findsOneWidget);
  });

  testWidgets('the 18+ section asks for confirmation first', (tester) async {
    await pumpHerCircle(tester, prefs: {'settings.locale': 'en'});
    await openLearn(tester);

    await tapText(tester, 'Intimacy & relationships');
    expect(find.text('18+ section'), findsOneWidget);
    await tapText(tester, 'Cancel');
    // Cancelling leaves the filter untouched.
    expect(find.text('18 items'), findsOneWidget);

    await tapText(tester, 'Intimacy & relationships');
    await tapText(tester, "I'm 18 or older");
    expect(find.text('1 items'), findsOneWidget);
  });

  testWidgets('opens an article, reads the body and bookmarks it', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openLearn(tester);

    await tapText(tester, 'Iron and your period');
    expect(find.byType(ContentDetailScreen), findsOneWidget);
    expect(
      find.textContaining('A heavy period loses 60 to 80 ml'),
      findsOneWidget,
    );
    // The reviewing doctor is credited.
    expect(find.text('Дана Ким'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.bookmark_border_rounded).last);
    await tester.pumpAndSettle();
    expect(container.read(bookmarksControllerProvider), contains('c_iron'));
    expect(find.text('Saved'), findsWidgets);
  });

  testWidgets('a premium article is locked until premium is on', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openLearn(tester);

    await tapText(tester, 'Irregular cycles: when to see a doctor');
    expect(find.text('This is a Premium item'), findsWidgets);
    expect(
      find.textContaining('A normal cycle runs 21 to 35 days'),
      findsNothing,
    );

    await tapText(tester, 'More about Premium');
    await tapText(tester, 'Turn on Premium (demo)');
    expect(container.read(hasPremiumProvider), isTrue);
    expect(
      find.textContaining('A normal cycle runs 21 to 35 days'),
      findsOneWidget,
    );
  });

  testWidgets('a video lesson falls back to an error panel offline', (
    tester,
  ) async {
    await pumpHerCircle(tester, prefs: {'settings.locale': 'en'});
    await openLearn(tester);

    await tapText(tester, 'The 4 cycle phases and your energy');
    expect(find.byType(ContentDetailScreen), findsOneWidget);
    // There is no video platform under test, so the player falls back
    // instead of leaving her on a placeholder.
    expect(find.text('Video unavailable'), findsOneWidget);
    expect(find.text('Try again'), findsOneWidget);
  });

  testWidgets('walks a course: lesson, quiz, certificate', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en', 'premium.status': 'trial'},
    );
    await openLearn(tester);

    await tapText(tester, 'Course: your cycle, understood');
    await tapText(tester, 'Start');
    expect(find.byType(CourseScreen), findsOneWidget);
    expect(find.text('0% done'), findsOneWidget);

    await tapText(tester, 'Start');
    expect(find.byType(LessonScreen), findsOneWidget);
    expect(find.text('Lesson 1 of 6'), findsOneWidget);
    expect(
      find.textContaining('A cycle is not just your period'),
      findsOneWidget,
    );

    // Lesson 1 → 2 → the quiz.
    await tapText(tester, 'Next lesson');
    expect(find.text('Lesson 2 of 6'), findsOneWidget);
    await tapText(tester, 'Next lesson');
    expect(find.byType(QuizScreen), findsOneWidget);
    expect(find.text('Step 1 of 2'), findsOneWidget);

    // Answer the first question wrongly, then correctly.
    await tapText(tester, '14–18 days');
    await tapText(tester, 'Check');
    expect(find.text('Not quite'), findsOneWidget);
    await tapText(tester, 'Next');

    await tapText(tester, 'About 14 days before the next period');
    await tapText(tester, 'Check');
    expect(find.text('Correct'), findsOneWidget);
    await tapText(tester, 'Done');

    // One of two correct is below the pass mark.
    expect(find.text('Try again'), findsWidgets);
    await tapText(tester, 'Retake');
    await tapText(tester, '21–35 days');
    await tapText(tester, 'Check');
    await tapText(tester, 'Next');
    await tapText(tester, 'About 14 days before the next period');
    await tapText(tester, 'Check');
    await tapText(tester, 'Done');
    expect(find.text('You passed'), findsOneWidget);

    await tapText(tester, 'Next lesson');
    final progress = container.read(
      courseProgressControllerProvider,
    )['course_cycle']!;
    expect(progress.completedLessonIds, ['l1', 'l2', 'l3']);
    expect(
      progress.fractionOf(container.read(courseByIdProvider('course_cycle'))!),
      0.5,
    );
  });

  testWidgets('finishing a course offers the certificate', (tester) async {
    await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en', 'premium.status': 'trial'},
      progress: {
        'course_cycle': ['l1', 'l2', 'l3', 'l4', 'l5', 'l6'],
      },
    );
    await openLearn(tester);

    await tapText(tester, 'Course: your cycle, understood');
    await tapText(tester, 'Start again');
    expect(find.text('Course completed'), findsOneWidget);
    expect(find.text('100% done'), findsOneWidget);

    await tapText(tester, 'Save certificate');
    expect(find.byType(CertificateScreen), findsOneWidget);
    expect(find.text('Your certificate is ready'), findsOneWidget);
    expect(find.text('6 lessons · 73 min'), findsOneWidget);
  });

  testWidgets('pregnancy school orders weeks around hers', (tester) async {
    await pumpHerCircle(
      tester,
      profile: testProfile.copyWith(
        lifeStage: LifeStage.pregnant,
        lastPeriodStart: today().addDays(-130),
      ),
      prefs: {'settings.locale': 'en'},
    );
    await openLearn(tester);

    // The name also appears as a category chip, so target the list tile.
    final entry = find.widgetWithText(ListTile, 'Pregnancy school');
    await reveal(tester, entry);
    await tester.tap(entry);
    await tester.pumpAndSettle();
    expect(find.byType(PregnancySchoolScreen), findsOneWidget);
    expect(find.text('Your week: Week 19'), findsOneWidget);
    // Week 18 is nearest to her week 19, so it comes first.
    expect(find.text('Week 18: first movements'), findsOneWidget);
  });

  testWidgets('saved filter shows only bookmarks', (tester) async {
    await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      bookmarks: {'c_pms'},
    );
    await openLearn(tester);

    await tester.tap(
      find.descendant(
        of: find.byType(AppBar),
        matching: find.byIcon(Icons.bookmark_border_rounded),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('1 items'), findsOneWidget);
    expect(find.text("PMS: what helps and what doesn't"), findsOneWidget);
  });
}
