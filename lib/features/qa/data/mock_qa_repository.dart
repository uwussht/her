import '../../../core/services/mock_asset_loader.dart';
import '../domain/expert.dart';
import '../domain/qa_repository.dart';
import '../domain/question.dart';

class MockQaRepository implements QaRepository {
  const MockQaRepository(this._loader);

  final MockAssetLoader _loader;

  @override
  Future<List<Question>> fetchQuestions() async => [
    for (final json in await _loader.loadList('questions'))
      Question.fromJson(json),
  ];

  @override
  Future<List<Expert>> fetchExperts() async => [
    for (final json in await _loader.loadList('experts')) Expert.fromJson(json),
  ];
}
