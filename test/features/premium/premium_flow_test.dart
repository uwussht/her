import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/features/ai_assistant/presentation/ai_providers.dart';
import 'package:her_circle/features/premium/domain/premium_plan.dart';
import 'package:her_circle/features/premium/domain/premium_status.dart';
import 'package:her_circle/features/premium/presentation/premium_controller.dart';
import 'package:her_circle/features/premium/presentation/premium_screen.dart';
import 'package:her_circle/features/premium/presentation/referral_screen.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/profile/presentation/user_profile_controller.dart';
import 'package:her_circle/features/shop/domain/payment_service.dart';

import '../../helpers/pump_app.dart';

void main() {
  Future<void> openProfile(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.person_outline_rounded));
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

  Future<void> openPremium(WidgetTester tester) async {
    await openProfile(tester);
    await tapText(tester, 'Her Circle Premium');
    expect(find.byType(PremiumScreen), findsOneWidget);
  }

  testWidgets('shows the benefits, both plans and the yearly saving', (
    tester,
  ) async {
    await pumpHerCircle(tester, prefs: {'settings.locale': 'en'});
    await openPremium(tester);

    // Spec 5.9: the five benefits.
    expect(find.text('Every course in full'), findsOneWidget);
    expect(find.text('Unlimited Circle AI'), findsOneWidget);
    expect(find.text('Priority in Q&A'), findsOneWidget);
    expect(find.text('Deeper insights'), findsOneWidget);
    expect(find.text('No ads'), findsOneWidget);

    // Both plans, with the real prices and the saving on the yearly one.
    expect(find.text('Monthly'), findsOneWidget);
    expect(find.text('Yearly'), findsOneWidget);
    expect(find.text('2 490 ₸'), findsOneWidget);
    expect(find.text('19 900 ₸'), findsOneWidget);
    expect(
      find.text('Save ${PremiumPlan.yearly.savingsPercent}%'),
      findsOneWidget,
    );
  });

  testWidgets('starts the seven-day trial once, and it unlocks premium', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openPremium(tester);

    await tapText(tester, '7 days free');

    final membership = container.read(premiumControllerProvider);
    expect(membership.status, PremiumStatus.trial);
    expect(membership.trialDaysLeft(DateTime.now()), 7);
    expect(container.read(hasPremiumProvider), isTrue);
    // Premium lifts the assistant's daily limit.
    expect(container.read(aiMessagesLeftProvider), isNull);
    expect(find.text('Premium is active'), findsOneWidget);
    // Offered once only.
    expect(find.text('7 days free'), findsNothing);
  });

  testWidgets('pays by card and turns premium on', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openPremium(tester);

    await tapText(tester, 'Subscribe for 19 900 ₸');
    expect(find.text('Pay for premium'), findsOneWidget);
    // Cash on delivery makes no sense for a subscription.
    expect(find.text('Cash on delivery'), findsNothing);

    await tapText(tester, 'Bank card');
    await tester.enterText(
      find.byType(TextFormField).at(0),
      '4242424242424242',
    );
    await tester.enterText(find.byType(TextFormField).at(1), '12/30');
    await tester.enterText(find.byType(TextFormField).at(2), '123');
    await tester.enterText(find.byType(TextFormField).at(3), 'AIGERIM TEST');
    await tapText(tester, 'Pay 19 900 ₸');

    final membership = container.read(premiumControllerProvider);
    expect(membership.status, PremiumStatus.active);
    expect(membership.plan, PremiumPlan.yearly);
    expect(container.read(hasPremiumProvider), isTrue);
    expect(find.byType(PremiumScreen), findsOneWidget);
  });

  testWidgets('explains a declined card instead of failing silently', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openPremium(tester);

    await tapText(tester, 'Subscribe for 19 900 ₸');
    await tapText(tester, 'Bank card');
    await tester.enterText(
      find.byType(TextFormField).at(0),
      CardValidator.declineCard,
    );
    await tester.enterText(find.byType(TextFormField).at(1), '12/30');
    await tester.enterText(find.byType(TextFormField).at(2), '123');
    await tester.enterText(find.byType(TextFormField).at(3), 'AIGERIM TEST');
    await tapText(tester, 'Pay 19 900 ₸');

    expect(find.textContaining('Payment declined'), findsOneWidget);
    expect(container.read(hasPremiumProvider), isFalse);
  });

  testWidgets('cancelling keeps the access she paid for', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      premium: true,
    );
    await openPremium(tester);

    expect(find.text('Premium is active'), findsOneWidget);
    await tapText(tester, 'Cancel renewal');
    expect(find.text('Cancel renewal?'), findsOneWidget);
    await tester.tap(find.widgetWithText(FilledButton, 'Cancel renewal'));
    await tester.pumpAndSettle();

    expect(container.read(premiumControllerProvider).plan, isNull);
    // She keeps premium until the period runs out.
    expect(container.read(hasPremiumProvider), isTrue);
  });

  testWidgets('a referral credits a month of premium to her', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openProfile(tester);
    await tapText(tester, 'Invite a friend');
    expect(find.byType(ReferralScreen), findsOneWidget);

    final code = container.read(referralControllerProvider).code;
    expect(find.text(code), findsOneWidget);
    expect(find.text('No one has joined yet'), findsOneWidget);

    await tapText(tester, 'Demo: a friend signed up');

    expect(container.read(referralControllerProvider).invitedCount, 1);
    expect(container.read(referralControllerProvider).rewardedMonths, 1);
    expect(find.text('1 friend has joined'), findsOneWidget);
    expect(find.text('1 month of premium earned'), findsOneWidget);
    // The month waits for her first subscription, then gets added to it.
    expect(container.read(premiumControllerProvider).bonusMonths, 1);
  });

  testWidgets('profile shows saved items and certificates', (tester) async {
    await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      bookmarks: {'c_iron'},
      progress: {
        'course_cycle': ['l_cycle_1', 'l_cycle_2', 'l_cycle_3'],
      },
    );
    await openProfile(tester);

    await tapText(tester, 'Saved');
    expect(find.text('Iron and your period'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tapText(tester, 'Certificates');
    expect(find.text('Your cycle, understood'), findsOneWidget);
  });

  testWidgets('she can change her life stage from profile', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openProfile(tester);

    await tapText(tester, 'Change life stage');
    await tapText(tester, 'Trying to conceive');

    expect(find.text('Life stage updated'), findsOneWidget);
    expect(
      container.read(userProfileControllerProvider)!.lifeStage,
      LifeStage.tryingToConceive,
    );
  });
}
