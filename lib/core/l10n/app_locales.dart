import 'package:flutter/widgets.dart';

import 'generated/app_localizations.dart';

/// Languages supported by Her Circle.
enum AppLocale {
  kk(Locale('kk')),
  ru(Locale('ru')),
  en(Locale('en'));

  const AppLocale(this.locale);

  final Locale locale;

  /// Russian is the default for the Kazakhstan market.
  static const AppLocale fallback = AppLocale.ru;

  static AppLocale fromCode(String? code) => AppLocale.values.firstWhere(
    (l) => l.locale.languageCode == code,
    orElse: () => fallback,
  );

  /// The language's own name (endonym), e.g. "Қазақша".
  String displayName(AppLocalizations l10n) => switch (this) {
    AppLocale.kk => l10n.languageKazakh,
    AppLocale.ru => l10n.languageRussian,
    AppLocale.en => l10n.languageEnglish,
  };
}
