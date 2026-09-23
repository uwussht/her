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

  /// Generic continue button
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get actionContinue;

  /// Generic next button
  ///
  /// In ru, this message translates to:
  /// **'Далее'**
  String get actionNext;

  /// Generic skip button
  ///
  /// In ru, this message translates to:
  /// **'Пропустить'**
  String get actionSkip;

  /// Generic done button
  ///
  /// In ru, this message translates to:
  /// **'Готово'**
  String get actionDone;

  /// Generic cancel button
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get actionCancel;

  /// Tagline on the splash screen
  ///
  /// In ru, this message translates to:
  /// **'Учиться. Следить. Заботиться о себе.'**
  String get splashTagline;

  /// Last intro slide button
  ///
  /// In ru, this message translates to:
  /// **'Начать'**
  String get introStart;

  /// Intro slide 1 title
  ///
  /// In ru, this message translates to:
  /// **'Знания от врачей'**
  String get intro1Title;

  /// Intro slide 1 body
  ///
  /// In ru, this message translates to:
  /// **'Видеоуроки, курсы и ответы экспертов о здоровье на каждом этапе жизни.'**
  String get intro1Body;

  /// Intro slide 2 title
  ///
  /// In ru, this message translates to:
  /// **'Ваш цикл под контролем'**
  String get intro2Title;

  /// Intro slide 2 body
  ///
  /// In ru, this message translates to:
  /// **'Календарь, прогнозы и напоминания — для цикла, беременности и менопаузы. Данные хранятся на вашем устройстве.'**
  String get intro2Body;

  /// Intro slide 3 title
  ///
  /// In ru, this message translates to:
  /// **'Всё нужное — рядом'**
  String get intro3Title;

  /// Intro slide 3 body
  ///
  /// In ru, this message translates to:
  /// **'Товары для здоровья, Circle AI и ваш близкий круг: партнёр и семья.'**
  String get intro3Body;

  /// Screen reader label for intro page dots
  ///
  /// In ru, this message translates to:
  /// **'Слайд {current} из {total}'**
  String introPageLabel(int current, int total);

  /// Language picker title
  ///
  /// In ru, this message translates to:
  /// **'Выберите язык'**
  String get languageTitle;

  /// Language picker subtitle
  ///
  /// In ru, this message translates to:
  /// **'Его можно изменить в настройках.'**
  String get languageSubtitle;

  /// Auth welcome title
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в Her Circle'**
  String get authWelcomeTitle;

  /// Auth welcome subtitle
  ///
  /// In ru, this message translates to:
  /// **'Войдите или создайте аккаунт, чтобы сохранить свой прогресс.'**
  String get authWelcomeSubtitle;

  /// Phone sign-in button
  ///
  /// In ru, this message translates to:
  /// **'Продолжить с номером телефона'**
  String get authContinuePhone;

  /// Email sign-in button
  ///
  /// In ru, this message translates to:
  /// **'Продолжить с email'**
  String get authContinueEmail;

  /// Google sign-in button
  ///
  /// In ru, this message translates to:
  /// **'Продолжить с Google'**
  String get authContinueGoogle;

  /// Legal line under sign-in buttons
  ///
  /// In ru, this message translates to:
  /// **'Продолжая, вы принимаете Условия использования и Политику конфиденциальности.'**
  String get authTerms;

  /// Phone screen title
  ///
  /// In ru, this message translates to:
  /// **'Ваш номер телефона'**
  String get authPhoneTitle;

  /// Phone screen subtitle
  ///
  /// In ru, this message translates to:
  /// **'Мы отправим SMS с кодом подтверждения.'**
  String get authPhoneSubtitle;

  /// Phone input label
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get authPhoneLabel;

  /// Send SMS code button
  ///
  /// In ru, this message translates to:
  /// **'Получить код'**
  String get authSendCode;

  /// OTP screen title
  ///
  /// In ru, this message translates to:
  /// **'Введите код'**
  String get authOtpTitle;

  /// OTP screen subtitle
  ///
  /// In ru, this message translates to:
  /// **'Код отправлен на {phone}'**
  String authOtpSubtitle(String phone);

  /// OTP input label
  ///
  /// In ru, this message translates to:
  /// **'Код из SMS'**
  String get authOtpLabel;

  /// Resend countdown
  ///
  /// In ru, this message translates to:
  /// **'Отправить снова через {seconds} с'**
  String authOtpResendIn(int seconds);

  /// Resend code button
  ///
  /// In ru, this message translates to:
  /// **'Отправить код снова'**
  String get authOtpResend;

  /// Verify OTP button
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get authVerify;

  /// Hint shown when running with mock auth
  ///
  /// In ru, this message translates to:
  /// **'Демо-режим: код {code}'**
  String authDemoCode(String code);

  /// Email screen title
  ///
  /// In ru, this message translates to:
  /// **'Вход по email'**
  String get authEmailTitle;

  /// Sign-in tab and button
  ///
  /// In ru, this message translates to:
  /// **'Вход'**
  String get authSignIn;

  /// Sign-up tab
  ///
  /// In ru, this message translates to:
  /// **'Регистрация'**
  String get authSignUp;

  /// Sign-up submit button
  ///
  /// In ru, this message translates to:
  /// **'Создать аккаунт'**
  String get authCreateAccount;

  /// Email input label
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get authEmailLabel;

  /// Password input label
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get authPasswordLabel;

  /// Confirm password label
  ///
  /// In ru, this message translates to:
  /// **'Повторите пароль'**
  String get authConfirmPasswordLabel;

  /// Password visibility toggle
  ///
  /// In ru, this message translates to:
  /// **'Показать пароль'**
  String get authShowPassword;

  /// Password visibility toggle
  ///
  /// In ru, this message translates to:
  /// **'Скрыть пароль'**
  String get authHidePassword;

  /// Forgot password link
  ///
  /// In ru, this message translates to:
  /// **'Забыли пароль?'**
  String get authForgotPassword;

  /// Snackbar after reset email
  ///
  /// In ru, this message translates to:
  /// **'Ссылка для сброса пароля отправлена на {email}'**
  String authResetSent(String email);

  /// Phone validation error
  ///
  /// In ru, this message translates to:
  /// **'Введите номер в формате 7XX XXX XX XX'**
  String get validationPhone;

  /// Email validation error
  ///
  /// In ru, this message translates to:
  /// **'Введите корректный email'**
  String get validationEmail;

  /// Password validation error
  ///
  /// In ru, this message translates to:
  /// **'Минимум 8 символов'**
  String get validationPassword;

  /// Confirm password validation error
  ///
  /// In ru, this message translates to:
  /// **'Пароли не совпадают'**
  String get validationPasswordMatch;

  /// OTP validation error
  ///
  /// In ru, this message translates to:
  /// **'Введите 6 цифр'**
  String get validationCode;

  /// Auth error
  ///
  /// In ru, this message translates to:
  /// **'Неверный номер телефона.'**
  String get authErrorInvalidPhone;

  /// Auth error
  ///
  /// In ru, this message translates to:
  /// **'Неверный код. Проверьте SMS и попробуйте снова.'**
  String get authErrorInvalidCode;

  /// Auth error
  ///
  /// In ru, this message translates to:
  /// **'Срок действия кода истёк. Запросите новый.'**
  String get authErrorCodeExpired;

  /// Auth error
  ///
  /// In ru, this message translates to:
  /// **'Некорректный email.'**
  String get authErrorInvalidEmail;

  /// Auth error
  ///
  /// In ru, this message translates to:
  /// **'Неверный email или пароль.'**
  String get authErrorWrongCredentials;

  /// Auth error
  ///
  /// In ru, this message translates to:
  /// **'Этот email уже зарегистрирован. Попробуйте войти.'**
  String get authErrorEmailInUse;

  /// Auth error
  ///
  /// In ru, this message translates to:
  /// **'Слишком простой пароль.'**
  String get authErrorWeakPassword;

  /// Auth error
  ///
  /// In ru, this message translates to:
  /// **'Слишком много попыток. Попробуйте позже.'**
  String get authErrorTooManyRequests;

  /// Auth error
  ///
  /// In ru, this message translates to:
  /// **'Нет соединения с интернетом.'**
  String get authErrorNetwork;

  /// Auth error
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так. Попробуйте ещё раз.'**
  String get authErrorUnknown;

  /// Quiz progress
  ///
  /// In ru, this message translates to:
  /// **'Шаг {step} из {total}'**
  String quizStepOf(int step, int total);

  /// Quiz step 1 title
  ///
  /// In ru, this message translates to:
  /// **'Сколько вам лет?'**
  String get quizAgeTitle;

  /// Quiz step 1 subtitle
  ///
  /// In ru, this message translates to:
  /// **'Так мы подберём подходящие материалы.'**
  String get quizAgeSubtitle;

  /// Age band
  ///
  /// In ru, this message translates to:
  /// **'10–15 лет'**
  String get ageGroup10to15;

  /// Age band
  ///
  /// In ru, this message translates to:
  /// **'16–24 года'**
  String get ageGroup16to24;

  /// Age band
  ///
  /// In ru, this message translates to:
  /// **'25–34 года'**
  String get ageGroup25to34;

  /// Age band
  ///
  /// In ru, this message translates to:
  /// **'35–44 года'**
  String get ageGroup35to44;

  /// Age band
  ///
  /// In ru, this message translates to:
  /// **'45 лет и старше'**
  String get ageGroup45plus;

  /// Quiz step 2 title
  ///
  /// In ru, this message translates to:
  /// **'Что сейчас актуально для вас?'**
  String get quizStageTitle;

  /// Quiz step 2 subtitle
  ///
  /// In ru, this message translates to:
  /// **'Трекер и советы подстроятся под вас. Это можно изменить в профиле.'**
  String get quizStageSubtitle;

  /// Life stage
  ///
  /// In ru, this message translates to:
  /// **'Первые месячные'**
  String get stageFirstPeriod;

  /// Life stage description
  ///
  /// In ru, this message translates to:
  /// **'Узнать, чего ожидать, и подготовиться'**
  String get stageFirstPeriodDesc;

  /// Life stage
  ///
  /// In ru, this message translates to:
  /// **'Слежу за циклом'**
  String get stageTrackingCycle;

  /// Life stage description
  ///
  /// In ru, this message translates to:
  /// **'Прогнозы месячных и самочувствие'**
  String get stageTrackingCycleDesc;

  /// Life stage
  ///
  /// In ru, this message translates to:
  /// **'Планирую беременность'**
  String get stageTryingToConceive;

  /// Life stage description
  ///
  /// In ru, this message translates to:
  /// **'Фертильное окно и овуляция'**
  String get stageTryingToConceiveDesc;

  /// Life stage
  ///
  /// In ru, this message translates to:
  /// **'Беременна'**
  String get stagePregnant;

  /// Life stage description
  ///
  /// In ru, this message translates to:
  /// **'Неделя за неделей до встречи с малышом'**
  String get stagePregnantDesc;

  /// Life stage
  ///
  /// In ru, this message translates to:
  /// **'После родов'**
  String get stagePostpartum;

  /// Life stage description
  ///
  /// In ru, this message translates to:
  /// **'Восстановление, кормление и сон'**
  String get stagePostpartumDesc;

  /// Life stage
  ///
  /// In ru, this message translates to:
  /// **'Перименопауза'**
  String get stagePerimenopause;

  /// Life stage description
  ///
  /// In ru, this message translates to:
  /// **'Изменения цикла и симптомы'**
  String get stagePerimenopauseDesc;

  /// Life stage
  ///
  /// In ru, this message translates to:
  /// **'Менопауза'**
  String get stageMenopause;

  /// Life stage description
  ///
  /// In ru, this message translates to:
  /// **'Самочувствие, сон и здоровье костей'**
  String get stageMenopauseDesc;

  /// Quiz step 3 title
  ///
  /// In ru, this message translates to:
  /// **'Расскажите о своём цикле'**
  String get quizCycleTitle;

  /// Quiz step 3 subtitle
  ///
  /// In ru, this message translates to:
  /// **'Это поможет точнее строить прогнозы. Шаг можно пропустить.'**
  String get quizCycleSubtitle;

  /// Quiz step 3 subtitle for pregnancy
  ///
  /// In ru, this message translates to:
  /// **'По первому дню последних месячных мы рассчитаем срок беременности. Шаг можно пропустить.'**
  String get quizPregnancySubtitle;

  /// Last period date field
  ///
  /// In ru, this message translates to:
  /// **'Первый день последних месячных'**
  String get quizLastPeriodLabel;

  /// Date field placeholder
  ///
  /// In ru, this message translates to:
  /// **'Выбрать дату'**
  String get quizSelectDate;

  /// Cycle length field
  ///
  /// In ru, this message translates to:
  /// **'Средняя длина цикла'**
  String get quizCycleLengthLabel;

  /// Cycle length value
  ///
  /// In ru, this message translates to:
  /// **'{days, plural, one{{days} день} few{{days} дня} many{{days} дней} other{{days} дня}}'**
  String quizCycleLengthValue(int days);

  /// Cycle length helper
  ///
  /// In ru, this message translates to:
  /// **'Обычно от 21 до 35 дней. Если не уверены, оставьте 28.'**
  String get quizCycleLengthHint;

  /// Stepper minus semantics
  ///
  /// In ru, this message translates to:
  /// **'Меньше на день'**
  String get quizDecreaseDays;

  /// Stepper plus semantics
  ///
  /// In ru, this message translates to:
  /// **'Больше на день'**
  String get quizIncreaseDays;

  /// Quiz step 4 title
  ///
  /// In ru, this message translates to:
  /// **'Что вам интересно?'**
  String get quizInterestsTitle;

  /// Quiz step 4 subtitle
  ///
  /// In ru, this message translates to:
  /// **'Выберите одну или несколько тем.'**
  String get quizInterestsSubtitle;

  /// Interest
  ///
  /// In ru, this message translates to:
  /// **'Моё тело'**
  String get interestMyBody;

  /// Interest
  ///
  /// In ru, this message translates to:
  /// **'Цикл и здоровье'**
  String get interestCycleHealth;

  /// Interest
  ///
  /// In ru, this message translates to:
  /// **'Фертильность'**
  String get interestFertility;

  /// Interest
  ///
  /// In ru, this message translates to:
  /// **'Беременность'**
  String get interestPregnancy;

  /// Interest
  ///
  /// In ru, this message translates to:
  /// **'Малыш и материнство'**
  String get interestBabyAndMotherhood;

  /// Interest
  ///
  /// In ru, this message translates to:
  /// **'Менопауза'**
  String get interestMenopause;

  /// Interest
  ///
  /// In ru, this message translates to:
  /// **'Ментальное здоровье'**
  String get interestMentalHealth;

  /// Interest
  ///
  /// In ru, this message translates to:
  /// **'Питание'**
  String get interestNutrition;

  /// Interest
  ///
  /// In ru, this message translates to:
  /// **'Спорт и движение'**
  String get interestFitness;

  /// Interest
  ///
  /// In ru, this message translates to:
  /// **'Красота и уход'**
  String get interestBeauty;

  /// Interest (18+)
  ///
  /// In ru, this message translates to:
  /// **'Близость и отношения'**
  String get interestIntimacy;

  /// Moms & Daughters offer title
  ///
  /// In ru, this message translates to:
  /// **'Вместе с мамой'**
  String get familyOfferTitle;

  /// Moms & Daughters offer body
  ///
  /// In ru, this message translates to:
  /// **'Подключите режим «Мамы и дочки» — вы будете проходить уроки вместе. Ваш трекер останется приватным, пока вы сами не решите им поделиться.'**
  String get familyOfferBody;

  /// Moms & Daughters accept
  ///
  /// In ru, this message translates to:
  /// **'Пригласить маму'**
  String get familyOfferAccept;

  /// Moms & Daughters decline
  ///
  /// In ru, this message translates to:
  /// **'Может быть, позже'**
  String get familyOfferLater;

  /// Snackbar after accepting
  ///
  /// In ru, this message translates to:
  /// **'Отлично! Код приглашения появится в профиле, в разделе «Связанные аккаунты».'**
  String get familyOfferAccepted;

  /// Profile row label
  ///
  /// In ru, this message translates to:
  /// **'Этап жизни'**
  String get profileLifeStage;

  /// Profile row label
  ///
  /// In ru, this message translates to:
  /// **'Возраст'**
  String get profileAgeGroup;

  /// Sign out button
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get profileSignOut;

  /// Sign out confirmation
  ///
  /// In ru, this message translates to:
  /// **'Выйти из аккаунта? Данные трекера останутся на этом устройстве.'**
  String get profileSignOutConfirm;

  /// Phone input mask hint (national part of a KZ number)
  ///
  /// In ru, this message translates to:
  /// **'7XX XXX XX XX'**
  String get authPhoneHint;
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
