// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Her Circle';

  @override
  String get navHome => 'Home';

  @override
  String get navLearn => 'Learn';

  @override
  String get navTracker => 'Tracker';

  @override
  String get navShop => 'Shop';

  @override
  String get navProfile => 'Profile';

  @override
  String get aiAssistantName => 'Circle AI';

  @override
  String get aiAssistantOpen => 'Ask Circle AI';

  @override
  String get aiAssistantPlaceholder =>
      'Ask a health question — Circle AI answers using the app\'s own content.';

  @override
  String get greetingMorning => 'Good morning';

  @override
  String get greetingAfternoon => 'Good afternoon';

  @override
  String get greetingEvening => 'Good evening';

  @override
  String get homeSubtitle => 'How are you feeling today?';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get homePlaceholder =>
      'Your personal feed will live here: cycle status, the tip of the day and picks for you.';

  @override
  String get learnPlaceholder =>
      'Video lessons, courses, articles and answers from doctors — all in one place.';

  @override
  String get trackerPlaceholder =>
      'Cycle calendar, predictions and daily wellbeing logs.';

  @override
  String get shopPlaceholder =>
      'Health products, subscription boxes and ready-made bundles.';

  @override
  String get medicalDisclaimer =>
      'Information in this app does not replace a doctor\'s advice. Circle AI never diagnoses.';

  @override
  String get profileGuest => 'Guest';

  @override
  String get profileGuestSubtitle => 'Sign in to keep your data';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get themeSystem => 'System default';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get languageKazakh => 'Қазақша';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageEnglish => 'English';

  @override
  String get notFoundTitle => 'Page not found';

  @override
  String get goHome => 'Go to home';

  @override
  String get actionContinue => 'Continue';

  @override
  String get actionNext => 'Next';

  @override
  String get actionSkip => 'Skip';

  @override
  String get actionDone => 'Done';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get splashTagline => 'Learn. Track. Care for yourself.';

  @override
  String get introStart => 'Get started';

  @override
  String get intro1Title => 'Knowledge from doctors';

  @override
  String get intro1Body =>
      'Video lessons, courses and expert answers about health at every stage of life.';

  @override
  String get intro2Title => 'Your cycle, understood';

  @override
  String get intro2Body =>
      'Calendar, predictions and reminders for your cycle, pregnancy and menopause. Your data stays on your device.';

  @override
  String get intro3Title => 'Everything you need, close by';

  @override
  String get intro3Body =>
      'Health products, Circle AI and your inner circle: partner and family.';

  @override
  String introPageLabel(int current, int total) {
    return 'Slide $current of $total';
  }

  @override
  String get languageTitle => 'Choose your language';

  @override
  String get languageSubtitle => 'You can change it later in Settings.';

  @override
  String get authWelcomeTitle => 'Welcome to Her Circle';

  @override
  String get authWelcomeSubtitle =>
      'Sign in or create an account to keep your progress.';

  @override
  String get authContinuePhone => 'Continue with phone';

  @override
  String get authContinueEmail => 'Continue with email';

  @override
  String get authContinueGoogle => 'Continue with Google';

  @override
  String get authTerms =>
      'By continuing you accept the Terms of Use and Privacy Policy.';

  @override
  String get authPhoneTitle => 'Your phone number';

  @override
  String get authPhoneSubtitle => 'We\'ll text you a verification code.';

  @override
  String get authPhoneLabel => 'Phone number';

  @override
  String get authSendCode => 'Send code';

  @override
  String get authOtpTitle => 'Enter the code';

  @override
  String authOtpSubtitle(String phone) {
    return 'We sent a code to $phone';
  }

  @override
  String get authOtpLabel => 'Code from SMS';

  @override
  String authOtpResendIn(int seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String get authOtpResend => 'Resend code';

  @override
  String get authVerify => 'Verify';

  @override
  String authDemoCode(String code) {
    return 'Demo mode: code $code';
  }

  @override
  String get authEmailTitle => 'Sign in with email';

  @override
  String get authSignIn => 'Sign in';

  @override
  String get authSignUp => 'Sign up';

  @override
  String get authCreateAccount => 'Create account';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authConfirmPasswordLabel => 'Repeat password';

  @override
  String get authShowPassword => 'Show password';

  @override
  String get authHidePassword => 'Hide password';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String authResetSent(String email) {
    return 'A password reset link was sent to $email';
  }

  @override
  String get validationPhone => 'Enter a number like 7XX XXX XX XX';

  @override
  String get validationEmail => 'Enter a valid email';

  @override
  String get validationPassword => 'At least 8 characters';

  @override
  String get validationPasswordMatch => 'Passwords don\'t match';

  @override
  String get validationCode => 'Enter 6 digits';

  @override
  String get authErrorInvalidPhone => 'That phone number isn\'t valid.';

  @override
  String get authErrorInvalidCode => 'Wrong code. Check the SMS and try again.';

  @override
  String get authErrorCodeExpired => 'The code has expired. Request a new one.';

  @override
  String get authErrorInvalidEmail => 'That email isn\'t valid.';

  @override
  String get authErrorWrongCredentials => 'Wrong email or password.';

  @override
  String get authErrorEmailInUse =>
      'This email is already registered. Try signing in.';

  @override
  String get authErrorWeakPassword => 'That password is too weak.';

  @override
  String get authErrorTooManyRequests => 'Too many attempts. Try again later.';

  @override
  String get authErrorNetwork => 'No internet connection.';

  @override
  String get authErrorUnknown => 'Something went wrong. Please try again.';

  @override
  String quizStepOf(int step, int total) {
    return 'Step $step of $total';
  }

  @override
  String get quizAgeTitle => 'How old are you?';

  @override
  String get quizAgeSubtitle => 'This helps us pick the right content for you.';

  @override
  String get ageGroup10to15 => '10–15';

  @override
  String get ageGroup16to24 => '16–24';

  @override
  String get ageGroup25to34 => '25–34';

  @override
  String get ageGroup35to44 => '35–44';

  @override
  String get ageGroup45plus => '45+';

  @override
  String get quizStageTitle => 'What\'s your stage right now?';

  @override
  String get quizStageSubtitle =>
      'The tracker and tips adapt to you. You can change this in your profile.';

  @override
  String get stageFirstPeriod => 'First period';

  @override
  String get stageFirstPeriodDesc => 'Learn what to expect and get ready';

  @override
  String get stageTrackingCycle => 'Tracking my cycle';

  @override
  String get stageTrackingCycleDesc => 'Period predictions and wellbeing';

  @override
  String get stageTryingToConceive => 'Trying to conceive';

  @override
  String get stageTryingToConceiveDesc => 'Fertile window and ovulation';

  @override
  String get stagePregnant => 'Pregnant';

  @override
  String get stagePregnantDesc => 'Week by week until you meet your baby';

  @override
  String get stagePostpartum => 'Postpartum';

  @override
  String get stagePostpartumDesc => 'Recovery, feeding and sleep';

  @override
  String get stagePerimenopause => 'Perimenopause';

  @override
  String get stagePerimenopauseDesc => 'Cycle changes and symptoms';

  @override
  String get stageMenopause => 'Menopause';

  @override
  String get stageMenopauseDesc => 'Wellbeing, sleep and bone health';

  @override
  String get quizCycleTitle => 'Tell us about your cycle';

  @override
  String get quizCycleSubtitle =>
      'This makes predictions more accurate. You can skip this step.';

  @override
  String get quizPregnancySubtitle =>
      'We\'ll use the first day of your last period to work out how far along you are. You can skip this step.';

  @override
  String get quizLastPeriodLabel => 'First day of your last period';

  @override
  String get quizSelectDate => 'Choose a date';

  @override
  String get quizCycleLengthLabel => 'Average cycle length';

  @override
  String quizCycleLengthValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '$days day',
    );
    return '$_temp0';
  }

  @override
  String get quizCycleLengthHint =>
      'Usually 21 to 35 days. If you\'re not sure, leave it at 28.';

  @override
  String get quizDecreaseDays => 'One day less';

  @override
  String get quizIncreaseDays => 'One day more';

  @override
  String get quizInterestsTitle => 'What are you interested in?';

  @override
  String get quizInterestsSubtitle => 'Pick one or more topics.';

  @override
  String get interestMyBody => 'My body';

  @override
  String get interestCycleHealth => 'Cycle & health';

  @override
  String get interestFertility => 'Fertility';

  @override
  String get interestPregnancy => 'Pregnancy';

  @override
  String get interestBabyAndMotherhood => 'Baby & motherhood';

  @override
  String get interestMenopause => 'Menopause';

  @override
  String get interestMentalHealth => 'Mental health';

  @override
  String get interestNutrition => 'Nutrition';

  @override
  String get interestFitness => 'Fitness & movement';

  @override
  String get interestBeauty => 'Beauty & self-care';

  @override
  String get interestIntimacy => 'Intimacy & relationships';

  @override
  String get familyOfferTitle => 'Together with mom';

  @override
  String get familyOfferBody =>
      'Turn on Moms & Daughters mode to take lessons together. Your tracker stays private unless you choose to share it.';

  @override
  String get familyOfferAccept => 'Invite my mom';

  @override
  String get familyOfferLater => 'Maybe later';

  @override
  String get familyOfferAccepted =>
      'Great! Your invite code will appear in Profile → Linked accounts.';

  @override
  String get profileLifeStage => 'Life stage';

  @override
  String get profileAgeGroup => 'Age';

  @override
  String get profileSignOut => 'Sign out';

  @override
  String get profileSignOutConfirm =>
      'Sign out? Your tracker data stays on this device.';

  @override
  String get authPhoneHint => '7XX XXX XX XX';
}
