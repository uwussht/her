// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Her Circle';

  @override
  String get navHome => 'Главная';

  @override
  String get navLearn => 'Обучение';

  @override
  String get navTracker => 'Трекер';

  @override
  String get navShop => 'Магазин';

  @override
  String get navProfile => 'Профиль';

  @override
  String get aiAssistantName => 'Circle AI';

  @override
  String get aiAssistantOpen => 'Спросить Circle AI';

  @override
  String get aiAssistantPlaceholder =>
      'Задайте вопрос о здоровье — Circle AI ответит на основе материалов приложения.';

  @override
  String get greetingMorning => 'Доброе утро';

  @override
  String get greetingAfternoon => 'Добрый день';

  @override
  String get greetingEvening => 'Добрый вечер';

  @override
  String get homeSubtitle => 'Как вы себя чувствуете сегодня?';

  @override
  String get comingSoon => 'Скоро';

  @override
  String get homePlaceholder =>
      'Здесь появится ваша персональная лента: статус цикла, совет дня и подборки для вас.';

  @override
  String get learnPlaceholder =>
      'Видеоуроки, курсы, статьи и ответы врачей — всё в одном месте.';

  @override
  String get trackerPlaceholder =>
      'Календарь цикла, прогнозы и ежедневные записи о самочувствии.';

  @override
  String get shopPlaceholder =>
      'Товары для здоровья, боксы по подписке и готовые наборы.';

  @override
  String get medicalDisclaimer =>
      'Информация в приложении не заменяет консультацию врача. Circle AI не ставит диагнозы.';

  @override
  String get profileGuest => 'Гостья';

  @override
  String get profileGuestSubtitle => 'Войдите, чтобы сохранить свои данные';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsAppearance => 'Оформление';

  @override
  String get themeSystem => 'Как в системе';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get settingsAbout => 'О приложении';

  @override
  String appVersion(String version) {
    return 'Версия $version';
  }

  @override
  String get languageKazakh => 'Қазақша';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageEnglish => 'English';

  @override
  String get notFoundTitle => 'Страница не найдена';

  @override
  String get goHome => 'На главную';
}
