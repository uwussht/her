import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_service.g.dart';

/// Raw [SharedPreferences] instance.
///
/// Loaded once in `bootstrap()` and injected with `overrideWithValue`, so
/// every read afterwards is synchronous.
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError(
    'sharedPreferencesProvider must be overridden in ProviderScope.',
  );
}

@Riverpod(keepAlive: true)
PreferencesService preferencesService(Ref ref) {
  return PreferencesService(ref.watch(sharedPreferencesProvider));
}

/// Typed access to small, non-sensitive app settings.
///
/// Health data never goes here. It lives in the encrypted local tracker
/// store (step 3).
class PreferencesService {
  const PreferencesService(this._prefs);

  final SharedPreferences _prefs;

  static const _kLocale = 'settings.locale';
  static const _kThemeMode = 'settings.themeMode';

  String? get localeCode => _prefs.getString(_kLocale);

  Future<void> setLocaleCode(String code) => _prefs.setString(_kLocale, code);

  ThemeMode get themeMode {
    final stored = _prefs.getString(_kThemeMode);
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == stored,
      orElse: () => ThemeMode.light,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) =>
      _prefs.setString(_kThemeMode, mode.name);
}
