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
  String get languageKazakh => 'Қазақша';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageEnglish => 'English';

  @override
  String get notFoundTitle => 'Страница не найдена';

  @override
  String get goHome => 'На главную';

  @override
  String get actionContinue => 'Продолжить';

  @override
  String get actionNext => 'Далее';

  @override
  String get actionSkip => 'Пропустить';

  @override
  String get actionDone => 'Готово';

  @override
  String get actionCancel => 'Отмена';

  @override
  String get splashTagline => 'Учиться. Следить. Заботиться о себе.';

  @override
  String get introStart => 'Начать';

  @override
  String get intro1Title => 'Знания от врачей';

  @override
  String get intro1Body =>
      'Видеоуроки, курсы и ответы экспертов о здоровье на каждом этапе жизни.';

  @override
  String get intro2Title => 'Ваш цикл под контролем';

  @override
  String get intro2Body =>
      'Календарь, прогнозы и напоминания — для цикла, беременности и менопаузы. Данные хранятся на вашем устройстве.';

  @override
  String get intro3Title => 'Всё нужное — рядом';

  @override
  String get intro3Body =>
      'Товары для здоровья, Circle AI и ваш близкий круг: партнёр и семья.';

  @override
  String introPageLabel(int current, int total) {
    return 'Слайд $current из $total';
  }

  @override
  String get languageTitle => 'Выберите язык';

  @override
  String get languageSubtitle => 'Его можно изменить в настройках.';

  @override
  String get authWelcomeTitle => 'Добро пожаловать в Her Circle';

  @override
  String get authWelcomeSubtitle =>
      'Войдите или создайте аккаунт, чтобы сохранить свой прогресс.';

  @override
  String get authContinuePhone => 'Продолжить с номером телефона';

  @override
  String get authContinueEmail => 'Продолжить с email';

  @override
  String get authContinueGoogle => 'Продолжить с Google';

  @override
  String get authTerms =>
      'Продолжая, вы принимаете Условия использования и Политику конфиденциальности.';

  @override
  String get authPhoneTitle => 'Ваш номер телефона';

  @override
  String get authPhoneSubtitle => 'Мы отправим SMS с кодом подтверждения.';

  @override
  String get authPhoneLabel => 'Номер телефона';

  @override
  String get authSendCode => 'Получить код';

  @override
  String get authOtpTitle => 'Введите код';

  @override
  String authOtpSubtitle(String phone) {
    return 'Код отправлен на $phone';
  }

  @override
  String get authOtpLabel => 'Код из SMS';

  @override
  String authOtpResendIn(int seconds) {
    return 'Отправить снова через $seconds с';
  }

  @override
  String get authOtpResend => 'Отправить код снова';

  @override
  String get authVerify => 'Подтвердить';

  @override
  String authDemoCode(String code) {
    return 'Демо-режим: код $code';
  }

  @override
  String get authEmailTitle => 'Вход по email';

  @override
  String get authSignIn => 'Вход';

  @override
  String get authSignUp => 'Регистрация';

  @override
  String get authCreateAccount => 'Создать аккаунт';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authPasswordLabel => 'Пароль';

  @override
  String get authConfirmPasswordLabel => 'Повторите пароль';

  @override
  String get authShowPassword => 'Показать пароль';

  @override
  String get authHidePassword => 'Скрыть пароль';

  @override
  String get authForgotPassword => 'Забыли пароль?';

  @override
  String authResetSent(String email) {
    return 'Ссылка для сброса пароля отправлена на $email';
  }

  @override
  String get validationPhone => 'Введите номер в формате 7XX XXX XX XX';

  @override
  String get validationEmail => 'Введите корректный email';

  @override
  String get validationPassword => 'Минимум 8 символов';

  @override
  String get validationPasswordMatch => 'Пароли не совпадают';

  @override
  String get validationCode => 'Введите 6 цифр';

  @override
  String get authErrorInvalidPhone => 'Неверный номер телефона.';

  @override
  String get authErrorInvalidCode =>
      'Неверный код. Проверьте SMS и попробуйте снова.';

  @override
  String get authErrorCodeExpired =>
      'Срок действия кода истёк. Запросите новый.';

  @override
  String get authErrorInvalidEmail => 'Некорректный email.';

  @override
  String get authErrorWrongCredentials => 'Неверный email или пароль.';

  @override
  String get authErrorEmailInUse =>
      'Этот email уже зарегистрирован. Попробуйте войти.';

  @override
  String get authErrorWeakPassword => 'Слишком простой пароль.';

  @override
  String get authErrorTooManyRequests =>
      'Слишком много попыток. Попробуйте позже.';

  @override
  String get authErrorNetwork => 'Нет соединения с интернетом.';

  @override
  String get authErrorUnknown => 'Что-то пошло не так. Попробуйте ещё раз.';

  @override
  String quizStepOf(int step, int total) {
    return 'Шаг $step из $total';
  }

  @override
  String get quizAgeTitle => 'Сколько вам лет?';

  @override
  String get quizAgeSubtitle => 'Так мы подберём подходящие материалы.';

  @override
  String get ageGroup10to15 => '10–15 лет';

  @override
  String get ageGroup16to24 => '16–24 года';

  @override
  String get ageGroup25to34 => '25–34 года';

  @override
  String get ageGroup35to44 => '35–44 года';

  @override
  String get ageGroup45plus => '45 лет и старше';

  @override
  String get quizStageTitle => 'Что сейчас актуально для вас?';

  @override
  String get quizStageSubtitle =>
      'Трекер и советы подстроятся под вас. Это можно изменить в профиле.';

  @override
  String get stageFirstPeriod => 'Первые месячные';

  @override
  String get stageFirstPeriodDesc => 'Узнать, чего ожидать, и подготовиться';

  @override
  String get stageTrackingCycle => 'Слежу за циклом';

  @override
  String get stageTrackingCycleDesc => 'Прогнозы месячных и самочувствие';

  @override
  String get stageTryingToConceive => 'Планирую беременность';

  @override
  String get stageTryingToConceiveDesc => 'Фертильное окно и овуляция';

  @override
  String get stagePregnant => 'Беременна';

  @override
  String get stagePregnantDesc => 'Неделя за неделей до встречи с малышом';

  @override
  String get stagePostpartum => 'После родов';

  @override
  String get stagePostpartumDesc => 'Восстановление, кормление и сон';

  @override
  String get stagePerimenopause => 'Перименопауза';

  @override
  String get stagePerimenopauseDesc => 'Изменения цикла и симптомы';

  @override
  String get stageMenopause => 'Менопауза';

  @override
  String get stageMenopauseDesc => 'Самочувствие, сон и здоровье костей';

  @override
  String get quizCycleTitle => 'Расскажите о своём цикле';

  @override
  String get quizCycleSubtitle =>
      'Это поможет точнее строить прогнозы. Шаг можно пропустить.';

  @override
  String get quizPregnancySubtitle =>
      'По первому дню последних месячных мы рассчитаем срок беременности. Шаг можно пропустить.';

  @override
  String get quizLastPeriodLabel => 'Первый день последних месячных';

  @override
  String get quizSelectDate => 'Выбрать дату';

  @override
  String get quizCycleLengthLabel => 'Средняя длина цикла';

  @override
  String quizCycleLengthValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return '$_temp0';
  }

  @override
  String get quizCycleLengthHint =>
      'Обычно от 21 до 35 дней. Если не уверены, оставьте 28.';

  @override
  String get quizDecreaseDays => 'Меньше на день';

  @override
  String get quizIncreaseDays => 'Больше на день';

  @override
  String get quizInterestsTitle => 'Что вам интересно?';

  @override
  String get quizInterestsSubtitle => 'Выберите одну или несколько тем.';

  @override
  String get interestMyBody => 'Моё тело';

  @override
  String get interestCycleHealth => 'Цикл и здоровье';

  @override
  String get interestFertility => 'Фертильность';

  @override
  String get interestPregnancy => 'Беременность';

  @override
  String get interestBabyAndMotherhood => 'Малыш и материнство';

  @override
  String get interestMenopause => 'Менопауза';

  @override
  String get interestMentalHealth => 'Ментальное здоровье';

  @override
  String get interestNutrition => 'Питание';

  @override
  String get interestFitness => 'Спорт и движение';

  @override
  String get interestBeauty => 'Красота и уход';

  @override
  String get interestIntimacy => 'Близость и отношения';

  @override
  String get familyOfferTitle => 'Вместе с мамой';

  @override
  String get familyOfferBody =>
      'Подключите режим «Мамы и дочки» — вы будете проходить уроки вместе. Ваш трекер останется приватным, пока вы сами не решите им поделиться.';

  @override
  String get familyOfferAccept => 'Пригласить маму';

  @override
  String get familyOfferLater => 'Может быть, позже';

  @override
  String get familyOfferAccepted =>
      'Отлично! Код приглашения появится в профиле, в разделе «Связанные аккаунты».';

  @override
  String get profileLifeStage => 'Этап жизни';

  @override
  String get profileAgeGroup => 'Возраст';

  @override
  String get profileSignOut => 'Выйти';

  @override
  String get profileSignOutConfirm =>
      'Выйти из аккаунта? Данные трекера останутся на этом устройстве.';

  @override
  String get authPhoneHint => '7XX XXX XX XX';
}
