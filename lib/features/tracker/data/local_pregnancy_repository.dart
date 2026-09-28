import '../../../core/services/storage/local_store.dart';
import '../domain/contraction.dart';
import '../domain/kick_session.dart';
import '../domain/pregnancy_repository.dart';
import '../domain/weight_entry.dart';

/// Pregnancy tracking data in the encrypted on-device store.
class LocalPregnancyRepository implements PregnancyRepository {
  const LocalPregnancyRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _kicksKey => 'tracker.kicks.$_uid';

  String get _contractionsKey => 'tracker.contractions.$_uid';

  String get _weightsKey => 'tracker.weights.$_uid';

  List<Map<String, dynamic>> _list(String key, String field) {
    final items = _store.readJson(key)?[field] as List<dynamic>? ?? const [];
    return [for (final item in items) item as Map<String, dynamic>];
  }

  @override
  List<KickSession> readKickSessions() => [
    for (final json in _list(_kicksKey, 'sessions')) KickSession.fromJson(json),
  ];

  @override
  Future<void> saveKickSessions(List<KickSession> sessions) =>
      _store.writeJson(_kicksKey, {
        'sessions': [for (final session in sessions) session.toJson()],
      });

  @override
  List<Contraction> readContractions() => [
    for (final json in _list(_contractionsKey, 'contractions'))
      Contraction.fromJson(json),
  ];

  @override
  Future<void> saveContractions(List<Contraction> contractions) =>
      _store.writeJson(_contractionsKey, {
        'contractions': [
          for (final contraction in contractions) contraction.toJson(),
        ],
      });

  @override
  List<WeightEntry> readWeights() => [
    for (final json in _list(_weightsKey, 'entries'))
      WeightEntry.fromJson(json),
  ];

  @override
  Future<void> saveWeights(List<WeightEntry> entries) =>
      _store.writeJson(_weightsKey, {
        'entries': [for (final entry in entries) entry.toJson()],
      });
}
