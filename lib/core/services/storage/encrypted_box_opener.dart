import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'local_store.dart';

/// Opens the encrypted Hive box that backs [LocalStore].
///
/// The AES key is generated once and kept in the Android Keystore through
/// flutter_secure_storage, so data at rest is unreadable without the device.
abstract final class EncryptedBoxOpener {
  static const _boxName = 'her_circle_secure';
  static const _keyName = 'her_circle.hive_key';

  static Future<LocalStore> open({
    FlutterSecureStorage secureStorage = const FlutterSecureStorage(),
  }) async {
    await Hive.initFlutter();
    final key = await _readOrCreateKey(secureStorage);
    final box = await Hive.openBox<String>(
      _boxName,
      encryptionCipher: HiveAesCipher(key),
    );
    return HiveLocalStore(box);
  }

  static Future<List<int>> _readOrCreateKey(
    FlutterSecureStorage storage,
  ) async {
    final existing = await storage.read(key: _keyName);
    if (existing != null) return base64Url.decode(existing);
    final key = Hive.generateSecureKey();
    await storage.write(key: _keyName, value: base64Url.encode(key));
    return key;
  }
}
