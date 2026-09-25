import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/localized_text.dart';
import 'package:her_circle/core/services/mock_asset_loader.dart';
import 'package:her_circle/core/services/storage/local_store.dart';
import 'package:her_circle/core/services/storage/preferences_service.dart';
import 'package:her_circle/features/home/presentation/home_providers.dart';
import 'package:her_circle/features/learn/domain/content_item.dart';
import 'package:her_circle/features/premium/presentation/premium_controller.dart';
import 'package:her_circle/features/qa/domain/qa_state.dart';
import 'package:her_circle/features/qa/domain/question.dart';
import 'package:her_circle/features/qa/presentation/qa_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

LocalizedText t(String value) => LocalizedText({'ru': value, 'en': value});

Question question(
  String id, {
  int upvotes = 0,
  bool answered = true,
  ContentCategory category = ContentCategory.cycleHealth,
  DateTime? askedAt,
}) {
  return Question(
    id: id,
    body: t(id),
    category: category,
    askedAt: askedAt ?? DateTime(2026, 9, 1),
    upvotes: upvotes,
    answers: [
      if (answered)
        Answer(
          id: 'a_$id',
          questionId: id,
          expertId: 'exp_aigul',
          body: t('answer $id'),
          answeredAt: DateTime(2026, 9, 2),
        ),
    ],
  );
}

void main() {
  const catalogue = QaCatalogue();

  group('sorting', () {
    final questions = [
      question('low', upvotes: 5),
      question('top', upvotes: 200),
      question('fresh', upvotes: 1, askedAt: DateTime(2026, 9, 20)),
      question('open', upvotes: 90, answered: false),
    ];

    List<String> ids(QaSort sort) => catalogue
        .apply(questions: questions, sort: sort)
        .map((q) => q.id)
        .toList();

    test('top puts answered first, then upvotes', () {
      expect(ids(QaSort.top), ['top', 'low', 'fresh', 'open']);
    });

    test('newest is by date', () {
      expect(ids(QaSort.newest).first, 'fresh');
    });

    test('unanswered surfaces open questions', () {
      expect(ids(QaSort.unanswered).first, 'open');
    });
  });

  test('filters by category', () {
    final questions = [
      question('cycle'),
      question('mind', category: ContentCategory.mentalHealth),
    ];
    expect(
      catalogue
          .apply(questions: questions, category: ContentCategory.mentalHealth)
          .map((q) => q.id),
      ['mind'],
    );
  });

  test('hides 18+ questions from minors', () {
    final questions = [
      question('safe'),
      question('adult', category: ContentCategory.intimacy),
    ];
    expect(
      catalogue
          .apply(questions: questions, hideAdultOnly: true)
          .map((q) => q.id),
      ['safe'],
    );
    expect(catalogue.apply(questions: questions).length, 2);
  });

  test('her own upvote is reflected in the count straight away', () {
    final questions = [question('q', upvotes: 10)];
    final result = catalogue.apply(questions: questions, upvoted: {'q'});
    expect(result.single.upvotes, 11);
  });

  group('QaController', () {
    late ProviderContainer container;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          localStoreProvider.overrideWithValue(InMemoryLocalStore()),
          mockAssetLoaderProvider.overrideWithValue(
            MockAssetLoader.preloaded(const {}),
          ),
        ],
      );
      addTearDown(container.dispose);
      container.listen(qaControllerProvider, (_, _) {});
    });

    test('asking stores the question anonymously by default', () async {
      final asked = await container
          .read(qaControllerProvider.notifier)
          .ask(
            text: '  Is a 35-day cycle normal?  ',
            category: ContentCategory.cycleHealth,
            anonymous: true,
          );

      expect(asked.isAnonymous, isTrue);
      expect(asked.body.values['ru'], 'Is a 35-day cycle normal?');
      expect(asked.isAnswered, isFalse);
      expect(asked.priority, isFalse);
      expect(container.read(qaControllerProvider).myQuestions, [asked]);

      // Survives a rebuild, so it is really stored.
      container.invalidate(qaControllerProvider);
      expect(
        container.read(qaControllerProvider).myQuestions.first.id,
        asked.id,
      );
    });

    test('premium askers get priority', () async {
      await container.read(premiumControllerProvider.notifier).toggleDemo();
      final asked = await container
          .read(qaControllerProvider.notifier)
          .ask(
            text: 'Can I exercise during my period?',
            category: ContentCategory.cycleHealth,
            anonymous: true,
          );
      expect(asked.priority, isTrue);
    });

    test('upvotes toggle and persist', () async {
      final notifier = container.read(qaControllerProvider.notifier);
      expect(await notifier.toggleUpvote('q1'), isTrue);
      expect(notifier.hasUpvoted('q1'), isTrue);

      container.invalidate(qaControllerProvider);
      expect(
        container.read(qaControllerProvider).upvotedQuestionIds,
        contains('q1'),
      );

      expect(
        await container.read(qaControllerProvider.notifier).toggleUpvote('q1'),
        isFalse,
      );
      expect(container.read(qaControllerProvider).upvotedQuestionIds, isEmpty);
    });

    test('her questions appear in the list, newest first', () async {
      final notifier = container.read(qaControllerProvider.notifier);
      await notifier.ask(
        text: 'A question long enough to pass validation',
        category: ContentCategory.cycleHealth,
        anonymous: true,
      );
      await notifier.ask(
        text: 'A second question long enough to pass',
        category: ContentCategory.nutrition,
        anonymous: false,
      );

      container.listen(qaResultsProvider, (_, _) {});
      // Both are unanswered, so order by date to make the newest explicit.
      container
          .read(qaFilterControllerProvider.notifier)
          .setSort(QaSort.newest);
      final results = container.read(qaResultsProvider);
      expect(results.length, 2);
      expect(
        results.first.body.values['ru'],
        'A second question long enough to pass',
      );
    });
  });
}
