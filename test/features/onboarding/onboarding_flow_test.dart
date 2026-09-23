import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/services/storage/preferences_service.dart';
import 'package:her_circle/features/auth/data/mock_auth_repository.dart';
import 'package:her_circle/features/auth/presentation/auth_welcome_screen.dart';
import 'package:her_circle/features/home/presentation/home_screen.dart';
import 'package:her_circle/features/onboarding/presentation/family_offer_screen.dart';
import 'package:her_circle/features/onboarding/presentation/intro_screen.dart';
import 'package:her_circle/features/onboarding/presentation/language_screen.dart';
import 'package:her_circle/features/onboarding/presentation/quiz/quiz_screen.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/profile/presentation/user_profile_controller.dart';

import '../../helpers/pump_app.dart';

void main() {
  Future<void> tapText(WidgetTester tester, String text) async {
    await tester.ensureVisible(find.text(text).last);
    await tester.tap(find.text(text).last);
    await tester.pumpAndSettle();
  }

  /// Splash → intro → language (English) → auth welcome.
  Future<void> throughIntroAndLanguage(WidgetTester tester) async {
    expect(find.byType(IntroScreen), findsOneWidget);
    await tapText(tester, 'Далее');
    await tapText(tester, 'Далее');
    expect(
      find.textContaining('не заменяет консультацию врача'),
      findsOneWidget,
    );
    await tapText(tester, 'Начать');

    expect(find.byType(LanguageScreen), findsOneWidget);
    await tapText(tester, 'English');
    expect(find.text('Choose your language'), findsOneWidget);
    await tapText(tester, 'Continue');
    expect(find.byType(AuthWelcomeScreen), findsOneWidget);
  }

  Future<void> signInWithPhone(WidgetTester tester) async {
    await tapText(tester, 'Continue with phone');
    await tester.enterText(find.byType(TextFormField), '7011234567');
    expect(find.text('701 123 45 67'), findsOneWidget);
    await tapText(tester, 'Send code');

    expect(find.text('We sent a code to +7 701 123 45 67'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), '000000');
    await tester.pumpAndSettle();
    expect(
      find.text('Wrong code. Check the SMS and try again.'),
      findsOneWidget,
    );

    await tester.enterText(
      find.byType(TextFormField),
      MockAuthRepository.demoCode,
    );
    await tester.pumpAndSettle();
  }

  testWidgets('new adult user: intro → language → phone → quiz → home', (
    tester,
  ) async {
    final container = await pumpHerCircle(tester, onboarded: false);
    await throughIntroAndLanguage(tester);
    await signInWithPhone(tester);

    // Quiz step 1: age.
    expect(find.byType(QuizScreen), findsOneWidget);
    expect(find.text('Step 1 of 4'), findsOneWidget);
    await tapText(tester, '25–34');
    await tapText(tester, 'Continue');

    // Step 2: life stage.
    await tapText(tester, 'Trying to conceive');
    await tapText(tester, 'Continue');

    // Step 3: cycle. Bump the cycle length once.
    expect(find.text('28 days'), findsOneWidget);
    await tester.tap(find.byTooltip('One day more'));
    await tester.pumpAndSettle();
    expect(find.text('29 days'), findsOneWidget);
    await tapText(tester, 'Continue');

    // Step 4: interests, pre-selected from the stage.
    expect(find.text('Step 4 of 4'), findsOneWidget);
    await tapText(tester, 'Nutrition');
    await tapText(tester, 'Done');

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Home'), findsWidgets);

    final profile = container.read(userProfileControllerProvider)!;
    expect(profile.ageGroup, AgeGroup.age25to34);
    expect(profile.lifeStage, LifeStage.tryingToConceive);
    expect(profile.cycleLength, 29);
    expect(profile.lastPeriodStart, isNull);
    expect(
      profile.interests,
      containsAll([Interest.fertility, Interest.nutrition]),
    );
  });

  testWidgets('user under 16 skips the cycle step and gets the family offer', (
    tester,
  ) async {
    final container = await pumpHerCircle(tester, onboarded: false);
    await throughIntroAndLanguage(tester);
    await signInWithPhone(tester);

    await tapText(tester, '10–15');
    await tapText(tester, 'Continue');
    // Teens only see age-appropriate stages.
    expect(find.text('Pregnant'), findsNothing);
    await tapText(tester, 'First period');
    await tapText(tester, 'Continue');
    await tapText(tester, 'Skip');
    expect(find.text('Intimacy & relationships'), findsNothing);
    await tapText(tester, 'Done');

    expect(find.byType(FamilyOfferScreen), findsOneWidget);
    await tapText(tester, 'Invite my mom');
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(
      container.read(preferencesServiceProvider).familyLinkRequested,
      isTrue,
    );
  });

  testWidgets('email sign-in shows errors, then succeeds', (tester) async {
    await pumpHerCircle(
      tester,
      onboarded: false,
      prefs: {
        'onboarding.introSeen': true,
        'onboarding.languageChosen': true,
        'settings.locale': 'en',
      },
    );
    expect(find.byType(AuthWelcomeScreen), findsOneWidget);
    await tapText(tester, 'Continue with email');

    await tapText(tester, 'Sign in');
    expect(find.text('Enter a valid email'), findsOneWidget);

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'aru@mail.kz');
    await tester.enterText(fields.at(1), MockAuthRepository.wrongPassword);
    await tapText(tester, 'Sign in');
    expect(find.text('Wrong email or password.'), findsOneWidget);

    await tester.enterText(fields.at(1), 'correct-horse');
    await tapText(tester, 'Sign in');
    expect(find.byType(QuizScreen), findsOneWidget);
  });

  testWidgets('returning user opens on Home and can sign out', (tester) async {
    await pumpHerCircle(tester);
    expect(find.byType(HomeScreen), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person_outline_rounded));
    await tester.pumpAndSettle();
    expect(find.text('+7 701 123 45 67'), findsOneWidget);
    expect(find.text('Слежу за циклом'), findsOneWidget);

    await tapText(tester, 'Выйти');
    await tester.tap(find.widgetWithText(FilledButton, 'Выйти'));
    await tester.pumpAndSettle();
    expect(find.byType(AuthWelcomeScreen), findsOneWidget);
  });
}
