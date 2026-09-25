import '../../../core/services/storage/local_store.dart';
import '../domain/question.dart';

/// Her own questions and upvotes, kept on device.
///
/// Replaced by Firestore writes once the backend exists; the interface stays
/// the same.
abstract interface class QaLocalStore {
  List<Question> readMyQuestions();

  Future<void> saveMyQuestions(List<Question> questions);

  Set<String> readUpvotes();

  Future<void> saveUpvotes(Set<String> ids);
}

class LocalQaStore implements QaLocalStore {
  const LocalQaStore(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _questionsKey => 'qa.myQuestions.$_uid';
  String get _upvotesKey => 'qa.upvotes.$_uid';

  @override
  List<Question> readMyQuestions() {
    final items =
        _store.readJson(_questionsKey)?['items'] as List<dynamic>? ?? const [];
    return [
      for (final item in items) Question.fromJson(item as Map<String, dynamic>),
    ];
  }

  @override
  Future<void> saveMyQuestions(List<Question> questions) =>
      _store.writeJson(_questionsKey, {
        'items': [for (final question in questions) question.toJson()],
      });

  @override
  Set<String> readUpvotes() {
    final ids =
        _store.readJson(_upvotesKey)?['ids'] as List<dynamic>? ?? const [];
    return {for (final id in ids) id as String};
  }

  @override
  Future<void> saveUpvotes(Set<String> ids) =>
      _store.writeJson(_upvotesKey, {'ids': ids.toList()});
}
