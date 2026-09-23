import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/storage/preferences_service.dart';
import 'app_locales.dart';

part 'locale_controller.g.dart';

/// The user's chosen app language. Defaults to Russian and is persisted.
@Riverpod(keepAlive: true)
class LocaleController extends _$LocaleController {
  @override
  AppLocale build() {
    return AppLocale.fromCode(ref.watch(preferencesServiceProvider).localeCode);
  }

  Future<void> setLocale(AppLocale locale) async {
    if (state == locale) return;
    state = locale;
    await ref
        .read(preferencesServiceProvider)
        .setLocaleCode(locale.locale.languageCode);
  }
}
