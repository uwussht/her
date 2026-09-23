// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Her Circle';

  @override
  String get navHome => 'Басты';

  @override
  String get navLearn => 'Оқу';

  @override
  String get navTracker => 'Трекер';

  @override
  String get navShop => 'Дүкен';

  @override
  String get navProfile => 'Профиль';

  @override
  String get aiAssistantName => 'Circle AI';

  @override
  String get aiAssistantOpen => 'Circle AI-ден сұрау';

  @override
  String get aiAssistantPlaceholder =>
      'Денсаулық туралы сұрақ қойыңыз — Circle AI қосымшадағы материалдар негізінде жауап береді.';

  @override
  String get greetingMorning => 'Қайырлы таң';

  @override
  String get greetingAfternoon => 'Қайырлы күн';

  @override
  String get greetingEvening => 'Қайырлы кеш';

  @override
  String get homeSubtitle => 'Бүгін өзіңізді қалай сезінесіз?';

  @override
  String get comingSoon => 'Жақында';

  @override
  String get homePlaceholder =>
      'Мұнда жеке таспаңыз пайда болады: цикл күйі, күн кеңесі және сізге арналған таңдаулар.';

  @override
  String get learnPlaceholder =>
      'Бейнесабақтар, курстар, мақалалар және дәрігерлердің жауаптары — бәрі бір жерде.';

  @override
  String get trackerPlaceholder =>
      'Цикл күнтізбесі, болжамдар және көңіл-күй туралы күнделікті жазбалар.';

  @override
  String get shopPlaceholder =>
      'Денсаулыққа арналған тауарлар, жазылым қораптары және дайын жинақтар.';

  @override
  String get medicalDisclaimer =>
      'Қосымшадағы ақпарат дәрігердің кеңесін алмастырмайды. Circle AI диагноз қоймайды.';

  @override
  String get profileGuest => 'Қонақ';

  @override
  String get profileGuestSubtitle => 'Деректеріңізді сақтау үшін кіріңіз';

  @override
  String get settingsTitle => 'Баптаулар';

  @override
  String get settingsLanguage => 'Тіл';

  @override
  String get settingsAppearance => 'Безендіру';

  @override
  String get themeSystem => 'Жүйедегідей';

  @override
  String get themeLight => 'Ашық';

  @override
  String get themeDark => 'Қараңғы';

  @override
  String get settingsAbout => 'Қосымша туралы';

  @override
  String appVersion(String version) {
    return 'Нұсқа $version';
  }

  @override
  String get languageKazakh => 'Қазақша';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageEnglish => 'English';

  @override
  String get notFoundTitle => 'Бет табылмады';

  @override
  String get goHome => 'Басты бетке';
}
