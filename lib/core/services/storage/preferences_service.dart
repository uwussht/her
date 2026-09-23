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
  static const _kIntroSeen = 'onboarding.introSeen';
  static const _kLanguageChosen = 'onboarding.languageChosen';
  static const _kFamilyOfferSeen = 'onboarding.familyOfferSeen';
  static const _kFamilyLinkRequested = 'onboarding.familyLinkRequested';

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

  bool get introSeen => _prefs.getBool(_kIntroSeen) ?? false;

  Future<void> setIntroSeen() => _prefs.setBool(_kIntroSeen, true);

  bool get languageChosen => _prefs.getBool(_kLanguageChosen) ?? false;

  Future<void> setLanguageChosen() => _prefs.setBool(_kLanguageChosen, true);

  /// Whether a user under 16 has already seen the Moms & Daughters offer.
  bool get familyOfferSeen => _prefs.getBool(_kFamilyOfferSeen) ?? false;

  Future<void> setFamilyOfferSeen() => _prefs.setBool(_kFamilyOfferSeen, true);

  /// She accepted the offer. Step 8 opens the linking flow from Profile.
  bool get familyLinkRequested =>
      _prefs.getBool(_kFamilyLinkRequested) ?? false;

  Future<void> setFamilyLinkRequested() =>
      _prefs.setBool(_kFamilyLinkRequested, true);

  String? getString(String key) => _prefs.getString(key);

  Future<void> setString(String key, String value) =>
      _prefs.setString(key, value);

  Future<void> remove(String key) => _prefs.remove(key);
}
