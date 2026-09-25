import '../../../core/services/storage/local_store.dart';
import '../domain/bookmark_repository.dart';

class LocalBookmarkRepository implements BookmarkRepository {
  const LocalBookmarkRepository(this._store, this._uid);

  final LocalStore _store;
  final String _uid;

  String get _key => 'learn.bookmarks.$_uid';

  @override
  Set<String> read() {
    final ids = _store.readJson(_key)?['ids'] as List<dynamic>? ?? const [];
    return {for (final id in ids) id as String};
  }

  @override
  Future<void> save(Set<String> ids) =>
      _store.writeJson(_key, {'ids': ids.toList()});
}
