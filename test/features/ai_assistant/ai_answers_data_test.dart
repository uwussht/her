import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/app_locales.dart';
import 'package:her_circle/core/services/mock_asset_loader.dart';
import 'package:her_circle/features/ai_assistant/data/ai_answer.dart';
import 'package:her_circle/features/ai_assistant/domain/chat_message.dart';
import 'package:her_circle/features/learn/data/mock_content_repository.dart';
import 'package:her_circle/features/shop/data/mock_product_repository.dart';

/// Guards `assets/mock/ai_answers.json`: it must parse, be fully translated,
/// and never link to a lesson or product that does not exist.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final loader = MockAssetLoader();
  final languages = AppLocale.values
      .map((locale) => locale.locale.languageCode)
      .toList();

  Future<List<AiAnswer>> answers() async => [
    for (final json in await loader.loadList('ai_answers'))
      AiAnswer.fromJson(json),
  ];

  test('every answer exists in all three languages', () async {
    final list = await answers();
    expect(list, isNotEmpty);
    for (final answer in list) {
      expect(
        answer.answer.values.keys,
        containsAll(languages),
        reason: '${answer.id} is missing a translation',
      );
      for (final entry in answer.answer.values.entries) {
        expect(entry.value.trim(), isNotEmpty, reason: '${answer.id} is blank');
      }
    }
    expect(list.map((answer) => answer.id).toSet().length, list.length);
  });

  test('there is exactly one fallback, and it needs no keywords', () async {
    final list = await answers();
    final fallbacks = list.where((answer) => answer.id == AiAnswer.fallbackId);
    expect(fallbacks, hasLength(1));
    expect(fallbacks.single.allKeywords, isEmpty);
    // Everything else must be reachable.
    for (final answer in list) {
      if (answer.id == AiAnswer.fallbackId) continue;
      expect(answer.allKeywords, isNotEmpty, reason: answer.id);
    }
  });

  test('keywords are lowercase stems', () async {
    for (final answer in await answers()) {
      for (final keyword in answer.allKeywords) {
        expect(keyword, keyword.toLowerCase(), reason: answer.id);
        expect(keyword.trim(), keyword, reason: answer.id);
      }
    }
  });

  test('references point at real lessons and products', () async {
    final content = await MockContentRepository(loader).fetchContent();
    final products = await MockProductRepository(loader).fetchProducts();
    final lessonIds = {for (final item in content) item.id};
    final productIds = {for (final product in products) product.id};

    for (final answer in await answers()) {
      for (final reference in answer.references) {
        final ids = switch (reference.kind) {
          ReferenceKind.lesson => lessonIds,
          ReferenceKind.product => productIds,
        };
        expect(
          ids,
          contains(reference.id),
          reason: '${answer.id} links to a missing ${reference.kind.name}',
        );
      }
    }
  });
}
