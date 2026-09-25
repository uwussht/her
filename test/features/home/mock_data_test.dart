import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/app_locales.dart';
import 'package:her_circle/core/services/mock_asset_loader.dart';
import 'package:her_circle/features/learn/data/mock_content_repository.dart';
import 'package:her_circle/features/learn/domain/content_item.dart';
import 'package:her_circle/features/qa/data/mock_qa_repository.dart';
import 'package:her_circle/features/shop/data/mock_product_repository.dart';

/// Guards the mock JSON in assets/mock/: every file must parse, and every
/// piece of content must exist in all three languages.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final loader = MockAssetLoader();
  final content = MockContentRepository(loader);
  final qa = MockQaRepository(loader);
  final shop = MockProductRepository(loader);

  final languages = AppLocale.values
      .map((locale) => locale.locale.languageCode)
      .toList();

  void expectAllLanguages(Map<String, String> values, String label) {
    expect(
      values.keys,
      containsAll(languages),
      reason: '$label is missing a translation',
    );
    for (final entry in values.entries) {
      expect(entry.value.trim(), isNotEmpty, reason: '$label is blank');
    }
  }

  test('content parses and is fully translated', () async {
    final items = await content.fetchContent();
    expect(items, isNotEmpty);
    for (final item in items) {
      expectAllLanguages(item.title.values, 'title of ${item.id}');
      expectAllLanguages(item.summary.values, 'summary of ${item.id}');
      expect(item.durationMinutes, greaterThan(0), reason: item.id);
    }
    // Ids must be unique, or the feed would show duplicates.
    expect(items.map((item) => item.id).toSet().length, items.length);
  });

  test('every course entry points at a real course', () async {
    final items = await content.fetchContent();
    final courses = await content.fetchCourses();
    final courseIds = courses.map((course) => course.id).toSet();

    for (final item in items.where((i) => i.type == ContentType.course)) {
      expect(item.courseId, isNotNull, reason: item.id);
      expect(courseIds, contains(item.courseId), reason: item.id);
    }
    for (final course in courses) {
      expect(course.lessonCount, greaterThan(0), reason: course.id);
      expectAllLanguages(course.title.values, 'course ${course.id}');
      for (final lesson in course.lessons) {
        expectAllLanguages(lesson.title.values, 'lesson ${lesson.id}');
      }
      // Lesson ids must be unique within a course so progress is unambiguous.
      final ids = course.lessons.map((lesson) => lesson.id);
      expect(ids.toSet().length, course.lessonCount, reason: course.id);
    }
  });

  test('tips and baby sizes parse', () async {
    final tips = await content.fetchTips();
    expect(tips, isNotEmpty);
    for (final tip in tips) {
      expectAllLanguages(tip.text.values, 'tip ${tip.id}');
    }

    final sizes = await content.fetchBabySizes();
    expect(sizes.length, greaterThan(30));
    for (final size in sizes) {
      expect(size.week, inInclusiveRange(4, 42));
      expectAllLanguages(size.name.values, 'baby size week ${size.week}');
    }
  });

  test('questions reference known experts', () async {
    final questions = await qa.fetchQuestions();
    final expertIds = (await qa.fetchExperts()).map((e) => e.id).toSet();

    expect(questions, isNotEmpty);
    for (final question in questions) {
      expectAllLanguages(question.body.values, 'question ${question.id}');
      for (final answer in question.answers) {
        expect(expertIds, contains(answer.expertId), reason: answer.id);
        expectAllLanguages(answer.body.values, 'answer ${answer.id}');
      }
    }
    // At least one unanswered question, so the waiting state is exercised.
    expect(questions.any((question) => !question.isAnswered), isTrue);
  });

  test('products reference known sellers and price sanely', () async {
    final products = await shop.fetchProducts();
    final sellerIds = (await shop.fetchSellers()).map((s) => s.id).toSet();
    final productIds = products.map((product) => product.id).toSet();

    expect(products, isNotEmpty);
    for (final product in products) {
      expectAllLanguages(product.title.values, 'product ${product.id}');
      expectAllLanguages(
        product.description.values,
        'description of ${product.id}',
      );
      expect(sellerIds, contains(product.sellerId), reason: product.id);
      expect(product.price, greaterThan(0), reason: product.id);
      if (product.oldPrice != null) {
        expect(
          product.oldPrice,
          greaterThan(product.price),
          reason: product.id,
        );
      }
      for (final id in product.bundleProductIds) {
        expect(productIds, contains(id), reason: 'bundle ${product.id}');
      }
    }
    // The Hospital Bag Bundle is linked from a pregnancy article.
    final hospitalBag = products.firstWhere(
      (product) => product.id == 'p_bundle_hospital',
    );
    expect(hospitalBag.isBundle, isTrue);
    expect(hospitalBag.relatedContentId, 'c_hospital_bag');
    final contentIds = (await content.fetchContent()).map((i) => i.id).toSet();
    expect(contentIds, contains(hospitalBag.relatedContentId));
  });
}
