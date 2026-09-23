import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/storage/preferences_service.dart';

part 'theme_mode_controller.g.dart';

/// Light / dark / system theme selection. Light is the default.
@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeMode build() => ref.watch(preferencesServiceProvider).themeMode;

  Future<void> setThemeMode(ThemeMode mode) async {
    if (state == mode) return;
    state = mode;
    await ref.read(preferencesServiceProvider).setThemeMode(mode);
  }
}
