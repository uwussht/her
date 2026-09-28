import 'package:flutter/material.dart';
import 'package:her_circle/features/circle/domain/circle_link.dart';
import 'package:her_circle/features/circle/domain/share_scope.dart';
import 'package:her_circle/features/circle/presentation/circle_providers.dart';
import 'package:her_circle/features/circle/presentation/family_screen.dart';
import 'package:her_circle/features/circle/presentation/join_link_screen.dart';
import 'package:her_circle/features/circle/presentation/partner_preview_screen.dart';
import 'package:her_circle/features/circle/presentation/partner_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  Future<void> openProfile(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.person_outline_rounded));
    await tester.pumpAndSettle();
  }

  Future<void> openPartner(WidgetTester tester) async {
    await openProfile(tester);
    await tester.tap(find.text('Partner'));
    await tester.pumpAndSettle();
    expect(find.byType(PartnerScreen), findsOneWidget);
  }

  Future<void> tapText(WidgetTester tester, String text) async {
    final finder = find.text(text);
    await tester.ensureVisible(finder.first);
    await tester.pumpAndSettle();
    await tester.tap(finder.first);
    await tester.pumpAndSettle();
  }

  testWidgets('creates an invite with a code and a QR', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openPartner(tester);

    expect(find.textContaining('exactly what you choose to share'), findsOne);

    await tapText(tester, 'Create an invite code');

    final link = container.read(linkOfKindProvider(LinkKind.partner));
    expect(link, isNotNull);
    expect(link!.isPending, isTrue);
    // A new partner link starts on the documented defaults, not on everything.
    expect(link.shares, ShareScope.partnerDefaults);
    // The code is shown grouped for reading aloud, and as a QR.
    expect(find.text(link.code.replaceRange(3, 3, '-')), findsOneWidget);
    expect(find.textContaining('scanned with a phone camera'), findsOne);
  });

  testWidgets('shares only what she turns on, and shows her the result', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openPartner(tester);
    await tapText(tester, 'Create an invite code');
    // The linked state needs the other device; the demo switch stands in.
    await tapText(tester, 'Demo: mark as connected');

    final id = container.read(linkOfKindProvider(LinkKind.partner))!.id;
    expect(find.text('What your partner sees'), findsOneWidget);

    // Symptoms are off by default; turning them on is a deliberate act.
    expect(
      container
          .read(linkOfKindProvider(LinkKind.partner))!
          .allows(ShareScope.symptoms),
      isFalse,
    );
    await tapText(tester, "Today's symptoms");
    expect(
      container
          .read(linkOfKindProvider(LinkKind.partner))!
          .allows(ShareScope.symptoms),
      isTrue,
    );

    await tapText(tester, 'See what your partner sees');
    expect(find.byType(PartnerPreviewScreen), findsOneWidget);
    // Her real data through her real switches: the life stage is shared, so
    // it shows; the test profile has logged no cycle, so no day appears.
    expect(find.text('Life stage'), findsOneWidget);
    expect(find.text('Tracking my cycle'), findsOneWidget);
    expect(find.textContaining('Day '), findsNothing);
    expect(find.text('How to support her today'), findsOneWidget);

    // Turning everything off leaves him with the tip and nothing else.
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tapText(tester, 'Turn everything off');
    expect(
      container.read(linkOfKindProvider(LinkKind.partner))!.shares,
      isEmpty,
    );
    expect(find.text('You are not sharing anything right now'), findsOneWidget);

    await tapText(tester, 'See what your partner sees');
    expect(
      find.textContaining('they only see the tip of the day'),
      findsOneWidget,
    );
    expect(container.read(sharedSummaryProvider(id)).isEmpty, isTrue);
  });

  testWidgets('unlinks after confirming', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openPartner(tester);
    await tapText(tester, 'Create an invite code');
    await tapText(tester, 'Demo: mark as connected');

    await tapText(tester, 'Unlink');
    expect(find.text('Unlink?'), findsOneWidget);
    expect(find.textContaining('the code will stop working'), findsOneWidget);
    await tester.tap(find.widgetWithText(FilledButton, 'Unlink'));
    await tester.pumpAndSettle();

    expect(container.read(linkOfKindProvider(LinkKind.partner)), isNull);
    expect(find.text('Create an invite code'), findsOneWidget);
  });

  testWidgets('joins with a code, and rejects a bad one', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openPartner(tester);
    await tapText(tester, 'I have a code');
    expect(find.byType(JoinLinkScreen), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'AB');
    await tapText(tester, 'Connect');
    expect(find.text('A code is six characters long'), findsOneWidget);
    expect(container.read(circleControllerProvider), isEmpty);

    await tester.enterText(find.byType(TextField), 'qrt-234');
    await tapText(tester, 'Connect');

    final link = container.read(linkOfKindProvider(LinkKind.partner));
    expect(link, isNotNull);
    expect(link!.side, LinkSide.viewer);
    expect(link.code, 'QRT234');
    // The viewer's side shows what the backend serves, labelled as sample data.
    expect(find.byType(PartnerScreen), findsOneWidget);
    expect(find.textContaining('This is sample data'), findsOneWidget);
  });

  testWidgets('family mode keeps the daughter private and shares lessons', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openProfile(tester);
    await tapText(tester, 'Moms & Daughters');
    expect(find.byType(FamilyScreen), findsOneWidget);

    expect(
      find.textContaining("daughter's tracker stays private"),
      findsWidgets,
    );
    // Lessons for both, and never the 18+ section.
    expect(find.text('Lessons together'), findsOneWidget);
    final lessons = container.read(sharedFamilyLessonsProvider);
    expect(lessons, isNotEmpty);
    expect(lessons.any((item) => item.isAdultOnly), isFalse);

    await tapText(tester, 'Create an invite code');
    // Spec 5.8: a daughter shares nothing until she chooses to.
    expect(
      container.read(linkOfKindProvider(LinkKind.family))!.shares,
      isEmpty,
    );
  });
}
