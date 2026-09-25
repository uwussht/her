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
  String get languageKazakh => 'Қазақша';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageEnglish => 'English';

  @override
  String get notFoundTitle => 'Бет табылмады';

  @override
  String get goHome => 'Басты бетке';

  @override
  String get actionContinue => 'Жалғастыру';

  @override
  String get actionNext => 'Келесі';

  @override
  String get actionSkip => 'Өткізу';

  @override
  String get actionDone => 'Дайын';

  @override
  String get actionCancel => 'Болдырмау';

  @override
  String get splashTagline => 'Үйрен. Бақыла. Өзіңе қамқор бол.';

  @override
  String get introStart => 'Бастау';

  @override
  String get intro1Title => 'Дәрігерлерден білім';

  @override
  String get intro1Body =>
      'Өмірдің әр кезеңіндегі денсаулық туралы бейнесабақтар, курстар және сарапшылардың жауаптары.';

  @override
  String get intro2Title => 'Циклыңыз бақылауда';

  @override
  String get intro2Body =>
      'Күнтізбе, болжамдар және еске салғыштар — цикл, жүктілік және менопауза үшін. Деректер құрылғыңызда сақталады.';

  @override
  String get intro3Title => 'Қажеттінің бәрі — жаныңызда';

  @override
  String get intro3Body =>
      'Денсаулыққа арналған тауарлар, Circle AI және жақын ортаңыз: серіктес пен отбасы.';

  @override
  String introPageLabel(int current, int total) {
    return '$total слайдтың $current-сі';
  }

  @override
  String get languageTitle => 'Тілді таңдаңыз';

  @override
  String get languageSubtitle => 'Оны баптауларда өзгертуге болады.';

  @override
  String get authWelcomeTitle => 'Her Circle-ге қош келдіңіз';

  @override
  String get authWelcomeSubtitle =>
      'Прогресіңізді сақтау үшін кіріңіз немесе аккаунт жасаңыз.';

  @override
  String get authContinuePhone => 'Телефон нөмірімен жалғастыру';

  @override
  String get authContinueEmail => 'Email арқылы жалғастыру';

  @override
  String get authContinueGoogle => 'Google арқылы жалғастыру';

  @override
  String get authTerms =>
      'Жалғастыра отырып, сіз Пайдалану шарттары мен Құпиялылық саясатын қабылдайсыз.';

  @override
  String get authPhoneTitle => 'Телефон нөміріңіз';

  @override
  String get authPhoneSubtitle => 'Біз растау коды бар SMS жібереміз.';

  @override
  String get authPhoneLabel => 'Телефон нөмірі';

  @override
  String get authSendCode => 'Код алу';

  @override
  String get authOtpTitle => 'Кодты енгізіңіз';

  @override
  String authOtpSubtitle(String phone) {
    return 'Код $phone нөміріне жіберілді';
  }

  @override
  String get authOtpLabel => 'SMS-тегі код';

  @override
  String authOtpResendIn(int seconds) {
    return '$seconds с кейін қайта жіберу';
  }

  @override
  String get authOtpResend => 'Кодты қайта жіберу';

  @override
  String get authVerify => 'Растау';

  @override
  String authDemoCode(String code) {
    return 'Демо режим: код $code';
  }

  @override
  String get authEmailTitle => 'Email арқылы кіру';

  @override
  String get authSignIn => 'Кіру';

  @override
  String get authSignUp => 'Тіркелу';

  @override
  String get authCreateAccount => 'Аккаунт жасау';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authPasswordLabel => 'Құпиясөз';

  @override
  String get authConfirmPasswordLabel => 'Құпиясөзді қайталаңыз';

  @override
  String get authShowPassword => 'Құпиясөзді көрсету';

  @override
  String get authHidePassword => 'Құпиясөзді жасыру';

  @override
  String get authForgotPassword => 'Құпиясөзді ұмыттыңыз ба?';

  @override
  String authResetSent(String email) {
    return 'Құпиясөзді қалпына келтіру сілтемесі $email мекенжайына жіберілді';
  }

  @override
  String get validationPhone => 'Нөмірді 7XX XXX XX XX форматында енгізіңіз';

  @override
  String get validationEmail => 'Дұрыс email енгізіңіз';

  @override
  String get validationPassword => 'Кемінде 8 таңба';

  @override
  String get validationPasswordMatch => 'Құпиясөздер сәйкес келмейді';

  @override
  String get validationCode => '6 цифр енгізіңіз';

  @override
  String get authErrorInvalidPhone => 'Телефон нөмірі қате.';

  @override
  String get authErrorInvalidCode =>
      'Код қате. SMS-ті тексеріп, қайталап көріңіз.';

  @override
  String get authErrorCodeExpired => 'Кодтың мерзімі өтті. Жаңасын сұраңыз.';

  @override
  String get authErrorInvalidEmail => 'Email қате.';

  @override
  String get authErrorWrongCredentials => 'Email немесе құпиясөз қате.';

  @override
  String get authErrorEmailInUse => 'Бұл email тіркелген. Кіріп көріңіз.';

  @override
  String get authErrorWeakPassword => 'Құпиясөз тым оңай.';

  @override
  String get authErrorTooManyRequests =>
      'Әрекет тым көп. Кейінірек қайталаңыз.';

  @override
  String get authErrorNetwork => 'Интернет байланысы жоқ.';

  @override
  String get authErrorUnknown => 'Бірдеңе дұрыс болмады. Қайталап көріңіз.';

  @override
  String quizStepOf(int step, int total) {
    return '$total қадамның $step-і';
  }

  @override
  String get quizAgeTitle => 'Жасыңыз нешеде?';

  @override
  String get quizAgeSubtitle =>
      'Осылайша сізге лайықты материалдарды таңдаймыз.';

  @override
  String get ageGroup10to15 => '10–15 жас';

  @override
  String get ageGroup16to24 => '16–24 жас';

  @override
  String get ageGroup25to34 => '25–34 жас';

  @override
  String get ageGroup35to44 => '35–44 жас';

  @override
  String get ageGroup45plus => '45 жас және одан жоғары';

  @override
  String get quizStageTitle => 'Қазір сіз үшін не маңызды?';

  @override
  String get quizStageSubtitle =>
      'Трекер мен кеңестер сізге бейімделеді. Мұны профильде өзгертуге болады.';

  @override
  String get stageFirstPeriod => 'Алғашқы етеккір';

  @override
  String get stageFirstPeriodDesc => 'Не күтетінін біліп, дайындалу';

  @override
  String get stageTrackingCycle => 'Циклымды бақылаймын';

  @override
  String get stageTrackingCycleDesc => 'Етеккір болжамы және көңіл-күй';

  @override
  String get stageTryingToConceive => 'Жүктілікті жоспарлап жүрмін';

  @override
  String get stageTryingToConceiveDesc => 'Құнарлы кезең және овуляция';

  @override
  String get stagePregnant => 'Жүктімін';

  @override
  String get stagePregnantDesc => 'Сәбимен кездескенше апта сайын';

  @override
  String get stagePostpartum => 'Босанғаннан кейін';

  @override
  String get stagePostpartumDesc => 'Қалпына келу, емізу және ұйқы';

  @override
  String get stagePerimenopause => 'Перименопауза';

  @override
  String get stagePerimenopauseDesc => 'Цикл өзгерістері мен белгілері';

  @override
  String get stageMenopause => 'Менопауза';

  @override
  String get stageMenopauseDesc => 'Көңіл-күй, ұйқы және сүйек денсаулығы';

  @override
  String get quizCycleTitle => 'Циклыңыз туралы айтып беріңіз';

  @override
  String get quizCycleSubtitle =>
      'Бұл болжамдарды дәлірек жасауға көмектеседі. Бұл қадамды өткізуге болады.';

  @override
  String get quizPregnancySubtitle =>
      'Соңғы етеккірдің бірінші күні бойынша жүктілік мерзімін есептейміз. Бұл қадамды өткізуге болады.';

  @override
  String get quizLastPeriodLabel => 'Соңғы етеккірдің бірінші күні';

  @override
  String get quizSelectDate => 'Күнді таңдау';

  @override
  String get quizCycleLengthLabel => 'Циклдің орташа ұзақтығы';

  @override
  String quizCycleLengthValue(int days) {
    return '$days күн';
  }

  @override
  String get quizCycleLengthHint =>
      'Әдетте 21-ден 35 күнге дейін. Сенімді болмасаңыз, 28 қалдырыңыз.';

  @override
  String get quizDecreaseDays => 'Бір күнге азайту';

  @override
  String get quizIncreaseDays => 'Бір күнге көбейту';

  @override
  String get quizInterestsTitle => 'Сізді не қызықтырады?';

  @override
  String get quizInterestsSubtitle => 'Бір немесе бірнеше тақырыпты таңдаңыз.';

  @override
  String get interestMyBody => 'Менің денем';

  @override
  String get interestCycleHealth => 'Цикл және денсаулық';

  @override
  String get interestFertility => 'Құнарлылық';

  @override
  String get interestPregnancy => 'Жүктілік';

  @override
  String get interestBabyAndMotherhood => 'Сәби және аналық';

  @override
  String get interestMenopause => 'Менопауза';

  @override
  String get interestMentalHealth => 'Психикалық денсаулық';

  @override
  String get interestNutrition => 'Тамақтану';

  @override
  String get interestFitness => 'Спорт және қозғалыс';

  @override
  String get interestBeauty => 'Сұлулық және күтім';

  @override
  String get interestIntimacy => 'Жақындық және қарым-қатынас';

  @override
  String get familyOfferTitle => 'Анаммен бірге';

  @override
  String get familyOfferBody =>
      '«Аналар мен қыздар» режимін қосыңыз — сабақтарды бірге өтесіздер. Трекеріңіз өзіңіз бөлісуді шешпейінше жеке болып қалады.';

  @override
  String get familyOfferAccept => 'Анамды шақыру';

  @override
  String get familyOfferLater => 'Кейінірек';

  @override
  String get familyOfferAccepted =>
      'Тамаша! Шақыру коды профильдегі «Байланысқан аккаунттар» бөлімінде пайда болады.';

  @override
  String get profileLifeStage => 'Өмір кезеңі';

  @override
  String get profileAgeGroup => 'Жасы';

  @override
  String get profileSignOut => 'Шығу';

  @override
  String get profileSignOutConfirm =>
      'Аккаунттан шығасыз ба? Трекер деректері осы құрылғыда қалады.';

  @override
  String get authPhoneHint => '7XX XXX XX XX';

  @override
  String get actionSave => 'Сақтау';

  @override
  String get actionDelete => 'Жою';

  @override
  String get actionAdd => 'Қосу';

  @override
  String get actionClose => 'Жабу';

  @override
  String get actionToday => 'Бүгін';

  @override
  String get actionNotNow => 'Қазір емес';

  @override
  String get actionAllow => 'Рұқсат беру';

  @override
  String trackerCycleDay(int day) {
    return '$day-күн';
  }

  @override
  String trackerPeriodDay(int day) {
    return 'Етеккір, $day-күн';
  }

  @override
  String trackerPeriodInDays(int days) {
    return 'Етеккірге $days күн қалды';
  }

  @override
  String get trackerPeriodToday => 'Етеккір бүгін күтіледі';

  @override
  String trackerPeriodLate(int days) {
    return 'Кешігу $days күн';
  }

  @override
  String get trackerFertileToday => 'Құнарлы кезең';

  @override
  String get trackerOvulationToday => 'Бүгін овуляция';

  @override
  String trackerNextPeriodOn(String date) {
    return 'Келесі етеккір: $date';
  }

  @override
  String trackerAverageCycle(int days) {
    return 'Цикл $days күн';
  }

  @override
  String get trackerEmptyTitle => 'Циклды бақылауды бастаңыз';

  @override
  String get trackerEmptyBody =>
      'Соңғы етеккірдің бірінші күнін белгілеңіз — біз болжамдары бар күнтізбе жасаймыз.';

  @override
  String get trackerMarkPeriodStart => 'Етеккірдің басталуын белгілеу';

  @override
  String get trackerPeriodStarted => 'Етеккір басталды';

  @override
  String get trackerPeriodEnded => 'Етеккір бітті';

  @override
  String get trackerRemoveDay => 'Белгіні алып тастау';

  @override
  String get confidenceEstimated => 'Шамалау';

  @override
  String get confidenceLow => 'Дәлдігі төмен';

  @override
  String get confidenceMedium => 'Орташа дәлдік';

  @override
  String get confidenceHigh => 'Жоғары дәлдік';

  @override
  String get confidenceEstimatedHint =>
      'Болжам сіз көрсеткен цикл ұзақтығы бойынша жасалды. Етеккірді белгілеп жүрсеңіз, дәлдігі артады.';

  @override
  String confidenceBasis(int cycles, int days) {
    return '$cycles цикл бойынша · айырмасы ±$days күн';
  }

  @override
  String get predictionDisclaimer =>
      'Болжамдар шамамен берілген және контрацепция құралы емес.';

  @override
  String get legendPeriod => 'Етеккір';

  @override
  String get legendPredictedPeriod => 'Етеккір болжамы';

  @override
  String get legendFertile => 'Құнарлы күндер';

  @override
  String get legendOvulation => 'Овуляция';

  @override
  String get legendLogged => 'Жазба бар';

  @override
  String get phaseFollicular => 'Фолликулалық фаза';

  @override
  String get phaseLuteal => 'Лютеин фазасы';

  @override
  String logTitle(String date) {
    return '$date жазбасы';
  }

  @override
  String get logToday => 'Бүгінгі жазба';

  @override
  String get logFlow => 'Бөліністер';

  @override
  String get flowSpotting => 'Аздаған';

  @override
  String get flowLight => 'Әлсіз';

  @override
  String get flowMedium => 'Орташа';

  @override
  String get flowHeavy => 'Көп';

  @override
  String get logMood => 'Көңіл-күй';

  @override
  String get moodGreat => 'Тамаша';

  @override
  String get moodGood => 'Жақсы';

  @override
  String get moodOkay => 'Қалыпты';

  @override
  String get moodLow => 'Жаман';

  @override
  String get moodAwful => 'Өте жаман';

  @override
  String get logEnergy => 'Қуат';

  @override
  String get energyLow => 'Аз';

  @override
  String get energyMedium => 'Орташа';

  @override
  String get energyHigh => 'Көп';

  @override
  String get logSleep => 'Ұйқы';

  @override
  String logSleepHours(String hours) {
    return '$hours сағ';
  }

  @override
  String get logSymptoms => 'Белгілер';

  @override
  String get logNotes => 'Жазбалар';

  @override
  String get logNotesHint => 'Есте қаларлық не бар?';

  @override
  String get logSaved => 'Жазба сақталды';

  @override
  String get logDeleted => 'Жазба жойылды';

  @override
  String get logEmptyHint =>
      'Заңдылықтарды көру үшін көңіл-күйіңізді белгілеңіз.';

  @override
  String get symptomCramps => 'Құрысу';

  @override
  String get symptomHeadache => 'Бас ауруы';

  @override
  String get symptomBackPain => 'Арқа ауруы';

  @override
  String get symptomBloating => 'Кебу';

  @override
  String get symptomBreastTenderness => 'Кеуде сезімталдығы';

  @override
  String get symptomNausea => 'Жүрек айну';

  @override
  String get symptomAcne => 'Бөртпе';

  @override
  String get symptomFatigue => 'Шаршау';

  @override
  String get symptomCravings => 'Тәбет тартуы';

  @override
  String get symptomInsomnia => 'Ұйқысыздық';

  @override
  String get symptomHotFlashes => 'Қызу толқыны';

  @override
  String get symptomNightSweats => 'Түнгі тершеңдік';

  @override
  String get symptomIrritability => 'Ашушаңдық';

  @override
  String get symptomAnxiety => 'Мазасыздық';

  @override
  String get symptomLowMood => 'Көңілсіздік';

  @override
  String get symptomGroupPhysical => 'Физикалық';

  @override
  String get symptomGroupEmotional => 'Эмоционалдық';

  @override
  String get symptomGroupMenopause => 'Менопауза';

  @override
  String get moodChartTitle => 'Көңіл-күй';

  @override
  String get moodChartWeek => 'Апта';

  @override
  String get moodChartMonth => 'Ай';

  @override
  String get moodChartEmpty =>
      'Көңіл-күйді белгілеп жүрсеңіз, мұнда график пайда болады.';

  @override
  String moodChartAverage(String value) {
    return 'Орташа $value';
  }

  @override
  String get remindersTitle => 'Еске салғыштар';

  @override
  String get remindersSubtitle => 'Тек осы құрылғыға келеді.';

  @override
  String reminderNext(String when) {
    return 'Жақындағы: $when';
  }

  @override
  String get reminderNone => 'Еске салғыштар өшірілген';

  @override
  String get reminderPeriodComingTitle => 'Етеккір жақындады';

  @override
  String reminderPeriodComingBody(int days) {
    return 'Басталуы $days күннен кейін күтіледі. Дайындалу уақыты.';
  }

  @override
  String get reminderFertileTitle => 'Құнарлы кезең басталады';

  @override
  String get reminderFertileBody =>
      'Келесі күндер — ұрықтануға ең қолайлы кезең.';

  @override
  String get reminderPillTitle => 'Дәрі қабылдау';

  @override
  String get reminderPillBody => 'Қабылдауды ұмытпаңыз.';

  @override
  String get reminderWaterTitle => 'Су ішу уақыты';

  @override
  String get reminderWaterBody => 'Бірер жұтым су ішіңіз.';

  @override
  String get reminderDoctorTitle => 'Дәрігерге бару';

  @override
  String get reminderDoctorBody => 'Бүгін бару жоспарланған.';

  @override
  String get reminderVaccinationTitle => 'Вакцинация уақыты';

  @override
  String reminderVaccinationBody(String vaccine) {
    return 'Жоспар бойынша: $vaccine. Дәрігерден сұраңыз.';
  }

  @override
  String get reminderTypePeriodComing => 'Етеккір жақындады';

  @override
  String get reminderTypeFertileWindow => 'Құнарлы кезең';

  @override
  String get reminderTypePill => 'Дәрі';

  @override
  String get reminderTypeWater => 'Су';

  @override
  String get reminderTypeDoctorVisit => 'Дәрігерге бару';

  @override
  String get reminderTypeVaccination => 'Вакцинация';

  @override
  String reminderDaysBefore(int days) {
    return '$days күн бұрын';
  }

  @override
  String reminderTimesPerDay(int count) {
    return 'Күніне $count рет';
  }

  @override
  String get reminderTimeLabel => 'Уақыт';

  @override
  String get reminderAddDoctorVisit => 'Дәрігерге баруды қосу';

  @override
  String get reminderDateLabel => 'Күні';

  @override
  String get reminderDeleted => 'Еске салғыш жойылды';

  @override
  String get notificationsPermissionTitle =>
      'Еске салғыштарға рұқсат берейік пе?';

  @override
  String get notificationsPermissionBody =>
      'Етеккірдің басталуы, дәрі қабылдау немесе дәрігерге бару туралы хабарлама жібереміз.';

  @override
  String get notificationsDenied =>
      'Хабарламалар телефон баптауларында өшірілген.';

  @override
  String get vaccinationsTitle => 'Вакцинация';

  @override
  String get vaccinationsSubtitle =>
      'Тізім жас пен өмір кезеңі бойынша жасалды. Оны өңдеуге болады.';

  @override
  String get vaccinationsDisclaimer =>
      'Бұл — анықтамалық тізім, медициналық тағайындау емес. Мерзімдерді дәрігерден сұраңыз.';

  @override
  String get vaccineHpv => 'АПВ (папиллома вирусы)';

  @override
  String get vaccineFlu => 'Тұмау';

  @override
  String get vaccineTdap => 'Көкжөтел, дифтерия, сіреспе (Tdap)';

  @override
  String get vaccineHepatitisB => 'В гепатиті';

  @override
  String get vaccineMeaslesRubella => 'Қызылша және қызамық';

  @override
  String get vaccineCovid19 => 'COVID-19';

  @override
  String get vaccineTetanus => 'Сіреспе';

  @override
  String get vaccinePneumococcal => 'Пневмококк';

  @override
  String get vaccineShingles => 'Герпес зостер';

  @override
  String vaccinationDue(String date) {
    return '$date дейін';
  }

  @override
  String get vaccinationOverdue => 'Мерзімі өтті';

  @override
  String get vaccinationStatusPlanned => 'Жоспарланған';

  @override
  String get vaccinationStatusDone => 'Жасалды';

  @override
  String get vaccinationStatusSkipped => 'Өткізілген';

  @override
  String get vaccinationMarkDone => 'Жасалды деп белгілеу';

  @override
  String get vaccinationSkip => 'Өткізу';

  @override
  String get vaccinationRestore => 'Жоспарға қайтару';

  @override
  String get vaccinationRemind => 'Еске салу';

  @override
  String get vaccinationReminderAdded => 'Еске салғыш қосылды';

  @override
  String get vaccinationChangeDate => 'Күнді өзгерту';

  @override
  String get reportCardTitle => 'Дәрігерге арналған есеп';

  @override
  String get reportCardBody =>
      'Соңғы айлардағы циклдар, белгілер және көңіл-күй туралы PDF.';

  @override
  String get reportShare => 'PDF сақтау';

  @override
  String get reportEmpty =>
      'Әзірге шығаратын дерек жоқ — алғашқы жазбаларды жасаңыз.';

  @override
  String get reportFailed => 'PDF жасау сәтсіз аяқталды';

  @override
  String get reportHeading => 'Цикл бойынша есеп';

  @override
  String reportGeneratedOn(String date) {
    return '$date жасалды';
  }

  @override
  String get reportSummary => 'Түйіндеме';

  @override
  String get reportAverageCycleLength => 'Циклдің орташа ұзақтығы';

  @override
  String get reportAveragePeriodLength => 'Етеккірдің орташа ұзақтығы';

  @override
  String get reportLastPeriodStart => 'Соңғы етеккірдің басы';

  @override
  String get reportNextPredicted => 'Келесі етеккір болжамы';

  @override
  String reportDays(int days) {
    return '$days күн';
  }

  @override
  String get reportCyclesSection => 'Циклдар';

  @override
  String get reportColumnStart => 'Басы';

  @override
  String get reportColumnCycleLength => 'Цикл ұзақтығы';

  @override
  String get reportColumnPeriodLength => 'Етеккір ұзақтығы';

  @override
  String get reportLogsSection => 'Жазбалар';

  @override
  String get reportColumnDate => 'Күні';

  @override
  String get reportColumnFlow => 'Бөліністер';

  @override
  String get reportColumnMood => 'Көңіл-күй';

  @override
  String get reportColumnEnergy => 'Қуат';

  @override
  String get reportColumnSleep => 'Ұйқы';

  @override
  String get reportColumnSymptoms => 'Белгілер';

  @override
  String get reportColumnNotes => 'Жазбалар';

  @override
  String get reportProfileSection => 'Пациент туралы';

  @override
  String get reportDash => '—';

  @override
  String get trackerPregnancySoon =>
      'Жүктілік режимі жақында қосылады: апта сайын, қимыл санағышы және салмақ.';

  @override
  String get trackerMenopauseSoon =>
      'Менопауза режимі жақында қосылады: қызу толқыны, ұйқы және көңіл-күй.';

  @override
  String get trackerSwitchToCycle => 'Цикл күнтізбесін ашу';

  @override
  String get actionEdit => 'Өзгерту';

  @override
  String get privacyHideContent => 'Мазмұнды жасыру';

  @override
  String get privacyHideContentBody =>
      'Хабарламаларда детальдар болмайды — тек қосымша атауы.';

  @override
  String reminderTimeAt(String time) {
    return 'Уақыты: $time';
  }
}
