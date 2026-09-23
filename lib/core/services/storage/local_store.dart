import 'dart:convert';

import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_store.g.dart';

/// Encrypted, on-device JSON store for personal and health data.
///
/// Opened in `bootstrap()` and injected with `overrideWithValue`, so reads
/// are synchronous.
@Riverpod(keepAlive: true)
LocalStore localStore(Ref ref) {
  throw UnimplementedError(
    'localStoreProvider must be overridden in ProviderScope.',
  );
}

/// Key-value storage for JSON documents.
abstract interface class LocalStore {
  Map<String, dynamic>? readJson(String key);

  Future<void> writeJson(String key, Map<String, dynamic> value);

  Future<void> delete(String key);

  /// Wipes everything, e.g. on account deletion.
  Future<void> clear();
}

/// [LocalStore] backed by an AES-encrypted Hive box.
class HiveLocalStore implements LocalStore {
  HiveLocalStore(this._box);

  final Box<String> _box;

  @override
  Map<String, dynamic>? readJson(String key) {
    final raw = _box.get(key);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  @override
  Future<void> writeJson(String key, Map<String, dynamic> value) =>
      _box.put(key, jsonEncode(value));

  @override
  Future<void> delete(String key) => _box.delete(key);

  @override
  Future<void> clear() => _box.clear();
}

/// In-memory [LocalStore] for tests and previews.
class InMemoryLocalStore implements LocalStore {
  final Map<String, String> _data = {};

  @override
  Map<String, dynamic>? readJson(String key) {
    final raw = _data[key];
    return raw == null ? null : jsonDecode(raw) as Map<String, dynamic>;
  }

  @override
  Future<void> writeJson(String key, Map<String, dynamic> value) async {
    _data[key] = jsonEncode(value);
  }

  @override
  Future<void> delete(String key) async => _data.remove(key);

  @override
  Future<void> clear() async => _data.clear();
}
