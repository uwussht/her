import 'dart:convert';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/services.dart' show AssetBundle, rootBundle;

/// Loads and decodes the JSON in `assets/mock/`.
///
/// Each file is read once and cached, so rebuilding a provider does not hit
/// the asset bundle again. Replaced by Firestore queries once the backend is
/// connected.
class MockAssetLoader {
  MockAssetLoader({AssetBundle? bundle}) : _bundle = bundle ?? rootBundle;

  /// A loader whose data is already in memory.
  ///
  /// Used by widget tests, where reading an asset is real file I/O that does
  /// not progress under the test binding's fake clock.
  MockAssetLoader.preloaded(Map<String, List<Map<String, dynamic>>> data)
    : _bundle = rootBundle {
    for (final entry in data.entries) {
      _cache[entry.key] = SynchronousFuture(entry.value);
    }
  }

  final AssetBundle _bundle;
  final Map<String, Future<List<Map<String, dynamic>>>> _cache = {};

  static const String directory = 'assets/mock';

  /// Decodes `assets/mock/<name>.json`, which holds a list of objects.
  Future<List<Map<String, dynamic>>> loadList(String name) {
    return _cache.putIfAbsent(
      name,
      () async => decodeList(await _bundle.loadString(path(name))),
    );
  }

  static String path(String name) => '$directory/$name.json';

  static List<Map<String, dynamic>> decodeList(String raw) {
    final decoded = jsonDecode(raw) as List<dynamic>;
    return [for (final item in decoded) item as Map<String, dynamic>];
  }
}
