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
}
