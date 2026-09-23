import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('en'),
    Locale('kk'),
  ];

  /// Brand name. Not translated.
  ///
  /// In ru, this message translates to:
  /// **'Her Circle'**
  String get appTitle;

  /// Bottom navigation: home feed tab
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get navHome;

  /// Bottom navigation: learning tab
  ///
  /// In ru, this message translates to:
  /// **'Обучение'**
  String get navLearn;

  /// Bottom navigation: cycle/pregnancy tracker tab
  ///
  /// In ru, this message translates to:
  /// **'Трекер'**
  String get navTracker;

  /// Bottom navigation: marketplace tab
  ///
  /// In ru, this message translates to:
  /// **'Магазин'**
  String get navShop;

  /// Bottom navigation: profile tab
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get navProfile;

  /// Name of the AI assistant. Not translated.
  ///
  /// In ru, this message translates to:
  /// **'Circle AI'**
  String get aiAssistantName;

  /// Tooltip / semantics label of the floating AI button
  ///
  /// In ru, this message translates to:
  /// **'Спросить Circle AI'**
  String get aiAssistantOpen;

  /// Placeholder body on the AI assistant screen
  ///
  /// In ru, this message translates to:
  /// **'Задайте вопрос о здоровье — Circle AI ответит на основе материалов приложения.'**
  String get aiAssistantPlaceholder;

  /// Home greeting, 05:00–11:59
  ///
  /// In ru, this message translates to:
  /// **'Доброе утро'**
  String get greetingMorning;

  /// Home greeting, 12:00–17:59
  ///
  /// In ru, this message translates to:
  /// **'Добрый день'**
  String get greetingAfternoon;

  /// Home greeting, 18:00–04:59
  ///
  /// In ru, this message translates to:
  /// **'Добрый вечер'**
  String get greetingEvening;

  /// Subtitle under the greeting on the home feed
  ///
  /// In ru, this message translates to:
  /// **'Как вы себя чувствуете сегодня?'**
  String get homeSubtitle;

  /// Badge shown on sections that are not built yet
  ///
  /// In ru, this message translates to:
  /// **'Скоро'**
  String get comingSoon;

  /// Placeholder body for the home feed
  ///
  /// In ru, this message translates to:
  /// **'Здесь появится ваша персональная лента: статус цикла, совет дня и подборки для вас.'**
  String get homePlaceholder;

  /// Placeholder body for the learn tab
  ///
  /// In ru, this message translates to:
  /// **'Видеоуроки, курсы, статьи и ответы врачей — всё в одном месте.'**
  String get learnPlaceholder;

  /// Placeholder body for the tracker tab
  ///
  /// In ru, this message translates to:
  /// **'Календарь цикла, прогнозы и ежедневные записи о самочувствии.'**
  String get trackerPlaceholder;

  /// Placeholder body for the shop tab
  ///
  /// In ru, this message translates to:
  /// **'Товары для здоровья, боксы по подписке и готовые наборы.'**
  String get shopPlaceholder;

  /// Medical disclaimer shown in onboarding, AI chat and Q&A
  ///
  /// In ru, this message translates to:
  /// **'Информация в приложении не заменяет консультацию врача. Circle AI не ставит диагнозы.'**
  String get medicalDisclaimer;

  /// Profile name shown before the user signs in
  ///
  /// In ru, this message translates to:
  /// **'Гостья'**
  String get profileGuest;

  /// Profile subtitle shown before the user signs in
  ///
  /// In ru, this message translates to:
  /// **'Войдите, чтобы сохранить свои данные'**
  String get profileGuestSubtitle;

  /// Settings screen title and profile menu item
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settingsTitle;

  /// Settings section: app language
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get settingsLanguage;

  /// Settings section: light/dark theme
  ///
  /// In ru, this message translates to:
  /// **'Оформление'**
  String get settingsAppearance;

  /// Theme option: follow the system setting
  ///
  /// In ru, this message translates to:
  /// **'Как в системе'**
  String get themeSystem;

  /// Theme option: light
  ///
  /// In ru, this message translates to:
  /// **'Светлая'**
  String get themeLight;

  /// Theme option: dark
  ///
  /// In ru, this message translates to:
  /// **'Тёмная'**
  String get themeDark;

  /// Settings section: about the app
  ///
  /// In ru, this message translates to:
  /// **'О приложении'**
  String get settingsAbout;

  /// App version label
  ///
  /// In ru, this message translates to:
  /// **'Версия {version}'**
  String appVersion(String version);

  /// Kazakh language name, always written in Kazakh
  ///
  /// In ru, this message translates to:
  /// **'Қазақша'**
  String get languageKazakh;

  /// Russian language name, always written in Russian
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get languageRussian;

  /// English language name, always written in English
  ///
  /// In ru, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// Title of the 404 route
  ///
  /// In ru, this message translates to:
  /// **'Страница не найдена'**
  String get notFoundTitle;

  /// Button that returns to the home tab
  ///
  /// In ru, this message translates to:
  /// **'На главную'**
  String get goHome;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'kk', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'kk':
      return AppLocalizationsKk();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
