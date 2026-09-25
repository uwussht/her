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

  @override
  String get actionSave => 'Сохранить';

  @override
  String get actionDelete => 'Удалить';

  @override
  String get actionAdd => 'Добавить';

  @override
  String get actionClose => 'Закрыть';

  @override
  String get actionToday => 'Сегодня';

  @override
  String get actionNotNow => 'Не сейчас';

  @override
  String get actionAllow => 'Разрешить';

  @override
  String trackerCycleDay(int day) {
    return 'День $day';
  }

  @override
  String trackerPeriodDay(int day) {
    return 'Месячные, день $day';
  }

  @override
  String trackerPeriodInDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Месячные через $days дня',
      many: 'Месячные через $days дней',
      few: 'Месячные через $days дня',
      one: 'Месячные через $days день',
    );
    return '$_temp0';
  }

  @override
  String get trackerPeriodToday => 'Месячные ожидаются сегодня';

  @override
  String trackerPeriodLate(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Задержка $days дня',
      many: 'Задержка $days дней',
      few: 'Задержка $days дня',
      one: 'Задержка $days день',
    );
    return '$_temp0';
  }

  @override
  String get trackerFertileToday => 'Фертильное окно';

  @override
  String get trackerOvulationToday => 'Овуляция сегодня';

  @override
  String trackerNextPeriodOn(String date) {
    return 'Следующие месячные: $date';
  }

  @override
  String trackerAverageCycle(int days) {
    return 'Цикл $days дней';
  }

  @override
  String get trackerEmptyTitle => 'Начните следить за циклом';

  @override
  String get trackerEmptyBody =>
      'Отметьте первый день последних месячных — и мы построим календарь с прогнозами.';

  @override
  String get trackerMarkPeriodStart => 'Отметить начало месячных';

  @override
  String get trackerPeriodStarted => 'Месячные начались';

  @override
  String get trackerPeriodEnded => 'Месячные закончились';

  @override
  String get trackerRemoveDay => 'Убрать отметку';

  @override
  String get confidenceEstimated => 'Оценка';

  @override
  String get confidenceLow => 'Низкая точность';

  @override
  String get confidenceMedium => 'Средняя точность';

  @override
  String get confidenceHigh => 'Высокая точность';

  @override
  String get confidenceEstimatedHint =>
      'Прогноз построен по указанной вами длине цикла. Отмечайте месячные — и он станет точнее.';

  @override
  String confidenceBasis(int cycles, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      cycles,
      locale: localeName,
      other: 'По $cycles циклам',
      many: 'По $cycles циклам',
      few: 'По $cycles циклам',
      one: 'По $cycles циклу',
    );
    return '$_temp0 · разброс ±$days дн.';
  }

  @override
  String get predictionDisclaimer =>
      'Прогнозы приблизительны и не являются средством контрацепции.';

  @override
  String get legendPeriod => 'Месячные';

  @override
  String get legendPredictedPeriod => 'Прогноз месячных';

  @override
  String get legendFertile => 'Фертильные дни';

  @override
  String get legendOvulation => 'Овуляция';

  @override
  String get legendLogged => 'Есть запись';

  @override
  String get phaseFollicular => 'Фолликулярная фаза';

  @override
  String get phaseLuteal => 'Лютеиновая фаза';

  @override
  String logTitle(String date) {
    return 'Запись за $date';
  }

  @override
  String get logToday => 'Запись за сегодня';

  @override
  String get logFlow => 'Выделения';

  @override
  String get flowSpotting => 'Мажущие';

  @override
  String get flowLight => 'Скудные';

  @override
  String get flowMedium => 'Умеренные';

  @override
  String get flowHeavy => 'Обильные';

  @override
  String get logMood => 'Настроение';

  @override
  String get moodGreat => 'Отлично';

  @override
  String get moodGood => 'Хорошо';

  @override
  String get moodOkay => 'Нормально';

  @override
  String get moodLow => 'Плохо';

  @override
  String get moodAwful => 'Очень плохо';

  @override
  String get logEnergy => 'Энергия';

  @override
  String get energyLow => 'Мало';

  @override
  String get energyMedium => 'Средне';

  @override
  String get energyHigh => 'Много';

  @override
  String get logSleep => 'Сон';

  @override
  String logSleepHours(String hours) {
    return '$hours ч';
  }

  @override
  String get logSymptoms => 'Симптомы';

  @override
  String get logNotes => 'Заметки';

  @override
  String get logNotesHint => 'Что ещё важно запомнить?';

  @override
  String get logSaved => 'Запись сохранена';

  @override
  String get logDeleted => 'Запись удалена';

  @override
  String get logEmptyHint =>
      'Отметьте самочувствие, чтобы видеть закономерности.';

  @override
  String get symptomCramps => 'Спазмы';

  @override
  String get symptomHeadache => 'Головная боль';

  @override
  String get symptomBackPain => 'Боль в спине';

  @override
  String get symptomBloating => 'Вздутие';

  @override
  String get symptomBreastTenderness => 'Чувствительность груди';

  @override
  String get symptomNausea => 'Тошнота';

  @override
  String get symptomAcne => 'Высыпания';

  @override
  String get symptomFatigue => 'Усталость';

  @override
  String get symptomCravings => 'Тяга к еде';

  @override
  String get symptomInsomnia => 'Бессонница';

  @override
  String get symptomHotFlashes => 'Приливы';

  @override
  String get symptomNightSweats => 'Ночная потливость';

  @override
  String get symptomIrritability => 'Раздражительность';

  @override
  String get symptomAnxiety => 'Тревожность';

  @override
  String get symptomLowMood => 'Подавленность';

  @override
  String get symptomGroupPhysical => 'Физические';

  @override
  String get symptomGroupEmotional => 'Эмоциональные';

  @override
  String get symptomGroupMenopause => 'Менопауза';

  @override
  String get moodChartTitle => 'Настроение';

  @override
  String get moodChartWeek => 'Неделя';

  @override
  String get moodChartMonth => 'Месяц';

  @override
  String get moodChartEmpty => 'Отмечайте настроение — здесь появится график.';

  @override
  String moodChartAverage(String value) {
    return 'В среднем $value';
  }

  @override
  String get remindersTitle => 'Напоминания';

  @override
  String get remindersSubtitle => 'Приходят только на это устройство.';

  @override
  String reminderNext(String when) {
    return 'Ближайшее: $when';
  }

  @override
  String get reminderNone => 'Напоминания выключены';

  @override
  String get reminderPeriodComingTitle => 'Скоро месячные';

  @override
  String reminderPeriodComingBody(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Начало ожидается через $days дня. Пора подготовиться.',
      many: 'Начало ожидается через $days дней. Пора подготовиться.',
      few: 'Начало ожидается через $days дня. Пора подготовиться.',
      one: 'Начало ожидается через $days день. Пора подготовиться.',
    );
    return '$_temp0';
  }

  @override
  String get reminderFertileTitle => 'Фертильное окно открывается';

  @override
  String get reminderFertileBody =>
      'Следующие дни — самые благоприятные для зачатия.';

  @override
  String get reminderPillTitle => 'Приём таблетки';

  @override
  String get reminderPillBody => 'Не забудьте про приём.';

  @override
  String get reminderWaterTitle => 'Время воды';

  @override
  String get reminderWaterBody => 'Сделайте пару глотков.';

  @override
  String get reminderDoctorTitle => 'Визит к врачу';

  @override
  String get reminderDoctorBody => 'Сегодня запланирован визит.';

  @override
  String get reminderVaccinationTitle => 'Пора вакцинации';

  @override
  String reminderVaccinationBody(String vaccine) {
    return 'По плану: $vaccine. Уточните у врача.';
  }

  @override
  String get reminderTypePeriodComing => 'Скоро месячные';

  @override
  String get reminderTypeFertileWindow => 'Фертильное окно';

  @override
  String get reminderTypePill => 'Таблетки';

  @override
  String get reminderTypeWater => 'Вода';

  @override
  String get reminderTypeDoctorVisit => 'Визит к врачу';

  @override
  String get reminderTypeVaccination => 'Вакцинация';

  @override
  String reminderDaysBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'За $days дня',
      many: 'За $days дней',
      few: 'За $days дня',
      one: 'За $days день',
    );
    return '$_temp0';
  }

  @override
  String reminderTimesPerDay(int count) {
    return '$count раза в день';
  }

  @override
  String get reminderTimeLabel => 'Время';

  @override
  String get reminderAddDoctorVisit => 'Добавить визит к врачу';

  @override
  String get reminderDateLabel => 'Дата';

  @override
  String get reminderDeleted => 'Напоминание удалено';

  @override
  String get notificationsPermissionTitle => 'Разрешить напоминания?';

  @override
  String get notificationsPermissionBody =>
      'Мы пришлём уведомление о начале месячных, приёме таблетки или визите к врачу.';

  @override
  String get notificationsDenied =>
      'Уведомления выключены в настройках телефона.';

  @override
  String get vaccinationsTitle => 'Вакцинация';

  @override
  String get vaccinationsSubtitle =>
      'Список составлен по возрасту и этапу жизни. Его можно редактировать.';

  @override
  String get vaccinationsDisclaimer =>
      'Это справочный список, а не медицинское назначение. Сроки уточните у врача.';

  @override
  String get vaccineHpv => 'ВПЧ (папилломавирус)';

  @override
  String get vaccineFlu => 'Грипп';

  @override
  String get vaccineTdap => 'Коклюш, дифтерия, тетанус (Tdap)';

  @override
  String get vaccineHepatitisB => 'Гепатит B';

  @override
  String get vaccineMeaslesRubella => 'Корь и рубелла';

  @override
  String get vaccineCovid19 => 'COVID-19';

  @override
  String get vaccineTetanus => 'Тетанус';

  @override
  String get vaccinePneumococcal => 'Пневмококк';

  @override
  String get vaccineShingles => 'Герпес зостер';

  @override
  String vaccinationDue(String date) {
    return 'До $date';
  }

  @override
  String get vaccinationOverdue => 'Просрочено';

  @override
  String get vaccinationStatusPlanned => 'Запланировано';

  @override
  String get vaccinationStatusDone => 'Сделано';

  @override
  String get vaccinationStatusSkipped => 'Пропущено';

  @override
  String get vaccinationMarkDone => 'Отметить как сделано';

  @override
  String get vaccinationSkip => 'Пропустить';

  @override
  String get vaccinationRestore => 'Вернуть в план';

  @override
  String get vaccinationRemind => 'Напомнить';

  @override
  String get vaccinationReminderAdded => 'Напоминание добавлено';

  @override
  String get vaccinationChangeDate => 'Изменить дату';

  @override
  String get reportCardTitle => 'Отчёт для врача';

  @override
  String get reportCardBody =>
      'PDF с циклами, симптомами и настроением за последние месяцы.';

  @override
  String get reportShare => 'Сохранить PDF';

  @override
  String get reportEmpty => 'Пока нечего выгружать — сделайте первые записи.';

  @override
  String get reportFailed => 'Не удалось создать PDF';

  @override
  String get reportHeading => 'Отчёт по циклу';

  @override
  String reportGeneratedOn(String date) {
    return 'Создан $date';
  }

  @override
  String get reportSummary => 'Сводка';

  @override
  String get reportAverageCycleLength => 'Средняя длина цикла';

  @override
  String get reportAveragePeriodLength => 'Средняя длительность месячных';

  @override
  String get reportLastPeriodStart => 'Начало последних месячных';

  @override
  String get reportNextPredicted => 'Прогноз следующих месячных';

  @override
  String reportDays(int days) {
    return '$days дн.';
  }

  @override
  String get reportCyclesSection => 'Циклы';

  @override
  String get reportColumnStart => 'Начало';

  @override
  String get reportColumnCycleLength => 'Длина цикла';

  @override
  String get reportColumnPeriodLength => 'Длит. месячных';

  @override
  String get reportLogsSection => 'Записи';

  @override
  String get reportColumnDate => 'Дата';

  @override
  String get reportColumnFlow => 'Выделения';

  @override
  String get reportColumnMood => 'Настроение';

  @override
  String get reportColumnEnergy => 'Энергия';

  @override
  String get reportColumnSleep => 'Сон';

  @override
  String get reportColumnSymptoms => 'Симптомы';

  @override
  String get reportColumnNotes => 'Заметки';

  @override
  String get reportProfileSection => 'О пациентке';

  @override
  String get reportDash => '—';

  @override
  String get trackerPregnancySoon =>
      'Режим беременности скоро появится: неделя за неделей, счётчик шевелений и вес.';

  @override
  String get trackerMenopauseSoon =>
      'Режим менопаузы скоро появится: приливы, сон и настроение.';

  @override
  String get trackerSwitchToCycle => 'Открыть календарь цикла';

  @override
  String get actionEdit => 'Изменить';

  @override
  String get privacyHideContent => 'Скрывать содержание';

  @override
  String get privacyHideContentBody =>
      'В уведомлениях не будет деталей — только название приложения.';

  @override
  String reminderTimeAt(String time) {
    return 'Время: $time';
  }
}
