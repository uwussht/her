import 'expert.dart';
import 'question.dart';

abstract interface class QaRepository {
  Future<List<Question>> fetchQuestions();

  Future<List<Expert>> fetchExperts();
}
