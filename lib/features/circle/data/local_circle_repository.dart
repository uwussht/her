import '../../../core/services/storage/local_store.dart';
import '../domain/circle_link.dart';
import '../domain/circle_repository.dart';

/// Links in the encrypted on-device store.
class LocalCircleRepository implements CircleRepository {
  const LocalCircleRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _key => 'circle.links.$_uid';

  @override
  List<CircleLink> read() {
    final items = _store.readJson(_key)?['links'] as List<dynamic>? ?? const [];
    return [
      for (final item in items)
        CircleLink.fromJson(item as Map<String, dynamic>),
    ];
  }

  @override
  Future<void> save(List<CircleLink> links) => _store.writeJson(_key, {
    'links': [for (final link in links) link.toJson()],
  });
}
