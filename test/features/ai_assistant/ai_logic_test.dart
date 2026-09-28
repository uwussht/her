import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/localized_text.dart';
import 'package:her_circle/features/ai_assistant/data/ai_answer.dart';
import 'package:her_circle/features/ai_assistant/data/answer_matcher.dart';
import 'package:her_circle/features/ai_assistant/data/mock_ai_service.dart';
import 'package:her_circle/features/ai_assistant/domain/ai_context.dart';
import 'package:her_circle/features/ai_assistant/domain/ai_quota.dart';
import 'package:her_circle/features/ai_assistant/domain/ai_service.dart';
import 'package:her_circle/features/ai_assistant/domain/chat_message.dart';
import 'package:her_circle/features/ai_assistant/domain/emergency_detector.dart';
import 'package:her_circle/features/ai_assistant/domain/suggested_questions.dart';
import 'package:her_circle/core/services/mock_asset_loader.dart';
import 'package:her_circle/features/profile/domain/personalization.dart';
import 'package:her_circle/features/profile/domain/user_profile.dart';
import 'package:her_circle/features/tracker/domain/cycle.dart';
import 'package:her_circle/features/tracker/domain/cycle_timeline.dart';

void main() {
  group('EmergencyDetector', () {
    const detector = EmergencyDetector();

    test('catches red flags in all three languages', () {
      expect(
        detector.isEmergency('У меня обильное кровотечение, что делать'),
        isTrue,
      );
      expect(detector.isEmergency('Қатты қан кетіп жатыр'), isTrue);
      expect(detector.isEmergency('I have severe pain in my belly'), isTrue);
      expect(detector.isEmergency('Мой ребёнок не шевелится с утра'), isTrue);
      expect(detector.isEmergency('Иногда хочу умереть'), isTrue);
    });

    test('ignores case and surrounding words', () {
      expect(detector.isEmergency('ПОТЕРЯ СОЗНАНИЯ была вчера'), isTrue);
    });

    test('leaves ordinary questions alone', () {
      expect(
        detector.isEmergency('Почему болит живот перед месячными?'),
        isFalse,
      );
      expect(detector.isEmergency('What cycle length is normal?'), isFalse);
      expect(detector.isEmergency(''), isFalse);
    });

    test('uses the Kazakhstan ambulance number', () {
      expect(EmergencyDetector.emergencyNumber, '103');
    });
  });

  group('AiQuota', () {
    const quota = AiQuota();
    final today = DateTime(2026, 9, 28, 14);

    test('free tier stops after five messages', () {
      var usage = AiUsage(day: today);
      for (var i = 0; i < 5; i++) {
        expect(
          quota.canSend(usage: usage, hasPremium: false, now: today),
          isTrue,
          reason: 'message ${i + 1} should go through',
        );
        usage = usage.increment(today);
      }
      expect(
        quota.canSend(usage: usage, hasPremium: false, now: today),
        isFalse,
      );
      expect(quota.remaining(usage: usage, hasPremium: false, now: today), 0);
    });

    test('premium is unlimited and has no counter', () {
      final usage = AiUsage(day: today, count: 99);
      expect(quota.canSend(usage: usage, hasPremium: true, now: today), isTrue);
      expect(
        quota.remaining(usage: usage, hasPremium: true, now: today),
        isNull,
      );
    });

    test('the count resets the next day', () {
      final usage = AiUsage(day: today, count: 5);
      final tomorrow = today.add(const Duration(days: 1));
      expect(
        quota.canSend(usage: usage, hasPremium: false, now: tomorrow),
        isTrue,
      );
      expect(
        quota.remaining(usage: usage, hasPremium: false, now: tomorrow),
        5,
      );
      expect(usage.increment(tomorrow).count, 1);
    });
  });

  group('SuggestedQuestion', () {
    test('follows her life stage', () {
      expect(
        SuggestedQuestion.forStage(LifeStage.pregnant),
        contains(SuggestedQuestion.babyMovements),
      );
      expect(
        SuggestedQuestion.forStage(LifeStage.menopause),
        contains(SuggestedQuestion.hotFlashes),
      );
      expect(
        SuggestedQuestion.forStage(LifeStage.firstPeriod).first,
        SuggestedQuestion.firstPeriod,
      );
    });

    test('never offers conception starters to a 10-15 year old', () {
      final questions = SuggestedQuestion.forProfile(
        ageGroup: AgeGroup.age10to15,
        stage: LifeStage.tryingToConceive,
      );
      expect(questions, isNot(contains(SuggestedQuestion.conceiveFaster)));
      expect(questions, isNot(contains(SuggestedQuestion.fertileDays)));
    });
  });

  group('AnswerMatcher', () {
    const matcher = AnswerMatcher();
    final answers = [
      _answer('period_pain', {
        'ru': ['болит живот', 'боль при месячных'],
      }),
      _answer('iron', {
        // Stems, so "железа" and "железом" match too.
        'ru': ['желез'],
      }),
      _answer(AiAnswer.fallbackId, const {}),
    ];

    test('picks the topic she asked about', () {
      expect(
        matcher.match('Болит живот, что делать?', answers)?.id,
        'period_pain',
      );
      expect(matcher.match('Где больше железа?', answers)?.id, 'iron');
    });

    test('prefers the longer phrase when two match', () {
      final both = [
        _answer('general', {
          'ru': ['боль'],
        }),
        _answer('period_pain', {
          'ru': ['боль при месячных'],
        }),
      ];
      expect(
        matcher.match('Сильная боль при месячных', both)?.id,
        'period_pain',
      );
    });

    test('falls back rather than guessing', () {
      expect(
        matcher.match('Сколько стоит доставка в Актау?', answers)?.id,
        AiAnswer.fallbackId,
      );
    });
  });

  group('MockAiService', () {
    test('answers in her language and carries the references', () async {
      final service = MockAiService(
        MockAssetLoader.preloaded({
          'ai_answers': [
            {
              'id': 'period_pain',
              'keywords': {
                'en': ['period pain'],
              },
              'answer': {'ru': 'Тепло помогает.', 'en': 'Warmth helps.'},
              'references': [
                {'kind': 'product', 'id': 'p_heatpad'},
              ],
            },
          ],
        }),
        latency: Duration.zero,
      );

      final response = await service.chat(
        const AiChatRequest(
          message: 'What helps with period pain?',
          userContext: AiUserContext(language: 'en'),
        ),
      );

      expect(response.reply, 'Warmth helps.');
      expect(response.emergency, isFalse);
      expect(response.references, [
        const ChatReference(kind: ReferenceKind.product, id: 'p_heatpad'),
      ]);

      final russian = await service.chat(
        const AiChatRequest(
          message: 'period pain',
          userContext: AiUserContext(language: 'ru'),
        ),
      );
      expect(russian.reply, 'Тепло помогает.');
    });

    test('flags an emergency without needing the backend', () async {
      final service = MockAiService(
        MockAssetLoader.preloaded({'ai_answers': const []}),
        latency: Duration.zero,
      );
      final response = await service.chat(
        const AiChatRequest(
          message: 'У меня сильное кровотечение',
          userContext: AiUserContext(language: 'ru'),
        ),
      );
      expect(response.emergency, isTrue);
    });
  });

  group('AiUserContext', () {
    test('sends an age band and a cycle day, never a birth date', () {
      final context = AiUserContext.from(
        profile: UserProfile(
          uid: 'u1',
          ageGroup: AgeGroup.age25to34,
          lifeStage: LifeStage.trackingCycle,
          cycleLength: 28,
          lastPeriodStart: DateTime(2026, 9, 20),
          createdAt: DateTime(2026),
        ),
        timeline: CycleTimeline(
          cycles: [
            Cycle(
              id: 'c1',
              startDate: DateTime(2026, 9, 20),
              periodEndDate: DateTime(2026, 9, 24),
            ),
          ],
          logs: const {},
          prediction: null,
        ),
        language: 'ru',
        now: DateTime(2026, 9, 28),
      );

      expect(context.ageGroup, '25-34');
      expect(context.stage, 'trackingCycle');
      expect(context.cycleDay, 9);
      expect(context.pregWeek, isNull);
      expect(context.toJson().containsKey('birthDate'), isFalse);
    });

    test('sends a pregnancy week instead of a cycle day', () {
      final context = AiUserContext.from(
        profile: UserProfile(
          uid: 'u1',
          ageGroup: AgeGroup.age25to34,
          lifeStage: LifeStage.pregnant,
          cycleLength: 28,
          lastPeriodStart: DateTime(2026, 5, 1),
          createdAt: DateTime(2026),
        ),
        timeline: CycleTimeline(
          cycles: const [],
          logs: const {},
          prediction: null,
        ),
        language: 'kk',
        now: DateTime(2026, 9, 28),
      );

      expect(context.cycleDay, isNull);
      expect(context.pregWeek, greaterThan(20));
      expect(context.language, 'kk');
    });
  });
}

AiAnswer _answer(String id, Map<String, List<String>> keywords) => AiAnswer(
  id: id,
  keywords: keywords,
  answer: const LocalizedText({'ru': 'текст', 'en': 'text'}),
);
