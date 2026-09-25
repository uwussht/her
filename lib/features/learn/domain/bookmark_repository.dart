/// Saved content ids, stored on device.
abstract interface class BookmarkRepository {
  Set<String> read();

  Future<void> save(Set<String> ids);
}
