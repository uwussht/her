import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/features/ai_assistant/domain/ai_quota.dart';
import 'package:her_circle/features/ai_assistant/domain/ai_service.dart';
import 'package:her_circle/features/ai_assistant/presentation/ai_assistant_screen.dart';
import 'package:her_circle/features/ai_assistant/presentation/ai_providers.dart';
import 'package:her_circle/features/ai_assistant/presentation/chat_controller.dart';
import 'package:her_circle/features/ai_assistant/presentation/widgets/emergency_card.dart';
import 'package:her_circle/features/premium/presentation/premium_controller.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';

import '../../helpers/pump_app.dart';

void main() {
  Future<void> openChat(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.auto_awesome_rounded).first);
    await tester.pumpAndSettle();
    expect(find.byType(AiAssistantScreen), findsOneWidget);
  }

  /// Drags the conversation up until [finder] is built, for the cards that
  /// land below the fold after a long exchange.
  Future<void> reveal(WidgetTester tester, Finder finder) async {
    for (var i = 0; i < 6 && finder.evaluate().isEmpty; i++) {
      await tester.drag(find.byType(ListView), const Offset(0, -240));
      await tester.pumpAndSettle();
    }
  }

  Future<void> ask(WidgetTester tester, String question) async {
    await tester.enterText(find.byType(TextField), question);
    await tester.tap(find.byIcon(Icons.arrow_upward_rounded));
    await tester.pumpAndSettle();
  }

  testWidgets(
    'opens from the floating button with the disclaimer and starters',
    (tester) async {
      await pumpHerCircle(tester, prefs: {'settings.locale': 'en'});
      await openChat(tester);

      // Spec 6: the medical disclaimer is on the screen before anything is sent.
      expect(
        find.textContaining('does not replace'),
        findsWidgets,
        reason: 'the medical disclaimer must be visible',
      );
      expect(
        find.text('This chat is stored on your device only.'),
        findsOneWidget,
      );
      expect(find.text('Ask anything'), findsOneWidget);
      // Starters follow her life stage (trackingCycle in the test profile).
      expect(find.text('What cycle length is normal?'), findsOneWidget);
      expect(find.text('5 questions left today'), findsOneWidget);
    },
  );

  testWidgets('answers a suggested question with links and a disclaimer', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openChat(tester);

    await tester.tap(find.text('What helps with period pain?'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Mild cramping'), findsOneWidget);
    expect(
      find.text('This is not a diagnosis. For a diagnosis, see a doctor.'),
      findsOneWidget,
    );
    // The answer links into Learn and Shop.
    expect(find.text('More on this in the app'), findsOneWidget);
    expect(find.text('Belly heat pad'), findsOneWidget);
    // A delivered answer is charged against the free tier.
    expect(container.read(aiUsageControllerProvider).count, 1);
    expect(find.text('4 questions left today'), findsOneWidget);
  });

  testWidgets('shows the urgent-care card and sends nothing', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openChat(tester);

    await ask(tester, 'I have heavy bleeding and severe pain');

    expect(find.byType(EmergencyCard), findsOneWidget);
    expect(find.text('Call 103'), findsOneWidget);
    expect(
      find.textContaining('Circle AI cannot help with this'),
      findsOneWidget,
    );
    // An emergency is screened on the device: no answer, no quota spent.
    expect(container.read(aiUsageControllerProvider).count, 0);
    expect(
      container.read(chatControllerProvider).messages.last.isEmergency,
      isTrue,
    );
  });

  testWidgets('stops at five questions a day and points at premium', (
    tester,
  ) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openChat(tester);

    for (var i = 0; i < AiQuota.defaultFreeMessagesPerDay; i++) {
      await ask(tester, 'What cycle length is normal? $i');
    }
    expect(find.text('0 questions left today'), findsOneWidget);

    await ask(tester, 'One more question please');

    final limitTitle = find.text('You have used today’s questions');
    await reveal(tester, limitTitle);
    expect(limitTitle, findsOneWidget);
    expect(find.text('See what premium gives'), findsOneWidget);
    // The question is kept in the field instead of being thrown away.
    expect(
      tester.widget<TextField>(find.byType(TextField)).controller?.text,
      'One more question please',
    );
    expect(
      container.read(aiUsageControllerProvider).count,
      AiQuota.defaultFreeMessagesPerDay,
    );

    // Premium lifts the limit.
    await container.read(premiumControllerProvider.notifier).toggleDemo();
    await tester.pumpAndSettle();
    expect(find.text('Premium: unlimited'), findsOneWidget);
  });

  testWidgets('keeps the history on device and can clear it', (tester) async {
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
    );
    await openChat(tester);
    await ask(tester, 'Which foods have the most iron?');
    expect(find.textContaining('iron is lost faster'), findsOneWidget);

    // Reopening reads the saved conversation back.
    expect(container.read(chatRepositoryProvider).read(), hasLength(2));

    await tester.tap(find.byIcon(Icons.delete_outline_rounded));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Clear'));
    await tester.pumpAndSettle();

    expect(find.textContaining('iron is lost faster'), findsNothing);
    expect(container.read(chatRepositoryProvider).read(), isEmpty);
  });

  testWidgets('offers a retry when the request fails, and charges nothing', (
    tester,
  ) async {
    final service = _FlakyAiService();
    final container = await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      aiService: service,
    );
    await openChat(tester);
    await ask(tester, 'What cycle length is normal?');

    expect(find.textContaining('Could not get an answer'), findsOneWidget);
    // A failed request must not eat one of her five daily questions.
    expect(container.read(aiUsageControllerProvider).count, 0);

    service.failing = false;
    await tester.tap(find.text('Try again'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Could not get an answer'), findsNothing);
    expect(find.text('An answer.'), findsOneWidget);
    expect(container.read(aiUsageControllerProvider).count, 1);
    // The question is asked once, not twice.
    expect(
      container
          .read(chatControllerProvider)
          .messages
          .where((message) => message.isUser),
      hasLength(1),
    );
  });

  testWidgets('hides conception starters from a 10-15 year old', (
    tester,
  ) async {
    await pumpHerCircle(
      tester,
      prefs: {'settings.locale': 'en'},
      profile: testProfile.copyWith(
        ageGroup: AgeGroup.age10to15,
        lifeStage: LifeStage.firstPeriod,
      ),
    );
    await openChat(tester);

    expect(find.text('When does a first period come?'), findsOneWidget);
    expect(find.text('How do I find my fertile days?'), findsNothing);
    expect(find.text('What helps to conceive sooner?'), findsNothing);
  });
}

/// Fails the first request, then answers.
class _FlakyAiService implements AiService {
  bool failing = true;

  @override
  Future<AiChatResponse> chat(AiChatRequest request) async {
    if (failing) throw const AiFailure(AiFailureReason.network);
    return const AiChatResponse(reply: 'An answer.');
  }
}
