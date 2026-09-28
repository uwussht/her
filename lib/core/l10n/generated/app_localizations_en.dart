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

  @override
  String get actionSave => 'Save';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionAdd => 'Add';

  @override
  String get actionClose => 'Close';

  @override
  String get actionToday => 'Today';

  @override
  String get actionNotNow => 'Not now';

  @override
  String get actionAllow => 'Allow';

  @override
  String trackerCycleDay(int day) {
    return 'Day $day';
  }

  @override
  String trackerPeriodDay(int day) {
    return 'Period, day $day';
  }

  @override
  String trackerPeriodInDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Period in $days days',
      one: 'Period in $days day',
    );
    return '$_temp0';
  }

  @override
  String get trackerPeriodToday => 'Your period is expected today';

  @override
  String trackerPeriodLate(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days late',
      one: '$days day late',
    );
    return '$_temp0';
  }

  @override
  String get trackerFertileToday => 'Fertile window';

  @override
  String get trackerOvulationToday => 'Ovulation today';

  @override
  String trackerNextPeriodOn(String date) {
    return 'Next period: $date';
  }

  @override
  String trackerAverageCycle(int days) {
    return '$days-day cycle';
  }

  @override
  String get trackerEmptyTitle => 'Start tracking your cycle';

  @override
  String get trackerEmptyBody =>
      'Mark the first day of your last period and we\'ll build your calendar with predictions.';

  @override
  String get trackerMarkPeriodStart => 'Mark period start';

  @override
  String get trackerPeriodStarted => 'Period started';

  @override
  String get trackerPeriodEnded => 'Period ended';

  @override
  String get trackerRemoveDay => 'Remove mark';

  @override
  String get confidenceEstimated => 'Estimate';

  @override
  String get confidenceLow => 'Low accuracy';

  @override
  String get confidenceMedium => 'Medium accuracy';

  @override
  String get confidenceHigh => 'High accuracy';

  @override
  String get confidenceEstimatedHint =>
      'This forecast uses the cycle length you entered. Log your periods and it will get more accurate.';

  @override
  String confidenceBasis(int cycles, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      cycles,
      locale: localeName,
      other: 'Based on $cycles cycles',
      one: 'Based on $cycles cycle',
    );
    return '$_temp0 · varies by ±$days days';
  }

  @override
  String get predictionDisclaimer =>
      'Predictions are estimates and are not a form of contraception.';

  @override
  String get legendPeriod => 'Period';

  @override
  String get legendPredictedPeriod => 'Predicted period';

  @override
  String get legendFertile => 'Fertile days';

  @override
  String get legendOvulation => 'Ovulation';

  @override
  String get legendLogged => 'Has a log';

  @override
  String get phaseFollicular => 'Follicular phase';

  @override
  String get phaseLuteal => 'Luteal phase';

  @override
  String logTitle(String date) {
    return 'Log for $date';
  }

  @override
  String get logToday => 'Log today';

  @override
  String get logFlow => 'Flow';

  @override
  String get flowSpotting => 'Spotting';

  @override
  String get flowLight => 'Light';

  @override
  String get flowMedium => 'Medium';

  @override
  String get flowHeavy => 'Heavy';

  @override
  String get logMood => 'Mood';

  @override
  String get moodGreat => 'Great';

  @override
  String get moodGood => 'Good';

  @override
  String get moodOkay => 'Okay';

  @override
  String get moodLow => 'Low';

  @override
  String get moodAwful => 'Awful';

  @override
  String get logEnergy => 'Energy';

  @override
  String get energyLow => 'Low';

  @override
  String get energyMedium => 'Medium';

  @override
  String get energyHigh => 'High';

  @override
  String get logSleep => 'Sleep';

  @override
  String logSleepHours(String hours) {
    return '$hours h';
  }

  @override
  String get logSymptoms => 'Symptoms';

  @override
  String get logNotes => 'Notes';

  @override
  String get logNotesHint => 'Anything else worth remembering?';

  @override
  String get logSaved => 'Log saved';

  @override
  String get logDeleted => 'Log deleted';

  @override
  String get logEmptyHint => 'Log how you feel to start seeing patterns.';

  @override
  String get symptomCramps => 'Cramps';

  @override
  String get symptomHeadache => 'Headache';

  @override
  String get symptomBackPain => 'Back pain';

  @override
  String get symptomBloating => 'Bloating';

  @override
  String get symptomBreastTenderness => 'Breast tenderness';

  @override
  String get symptomNausea => 'Nausea';

  @override
  String get symptomAcne => 'Acne';

  @override
  String get symptomFatigue => 'Fatigue';

  @override
  String get symptomCravings => 'Food cravings';

  @override
  String get symptomInsomnia => 'Insomnia';

  @override
  String get symptomHotFlashes => 'Hot flashes';

  @override
  String get symptomNightSweats => 'Night sweats';

  @override
  String get symptomIrritability => 'Irritability';

  @override
  String get symptomAnxiety => 'Anxiety';

  @override
  String get symptomLowMood => 'Low mood';

  @override
  String get symptomGroupPhysical => 'Physical';

  @override
  String get symptomGroupEmotional => 'Emotional';

  @override
  String get symptomGroupMenopause => 'Menopause';

  @override
  String get moodChartTitle => 'Mood';

  @override
  String get moodChartWeek => 'Week';

  @override
  String get moodChartMonth => 'Month';

  @override
  String get moodChartEmpty => 'Log your mood and a chart will appear here.';

  @override
  String moodChartAverage(String value) {
    return 'Average $value';
  }

  @override
  String get remindersTitle => 'Reminders';

  @override
  String get remindersSubtitle => 'They stay on this device only.';

  @override
  String reminderNext(String when) {
    return 'Next: $when';
  }

  @override
  String get reminderNone => 'Reminders are off';

  @override
  String get reminderPeriodComingTitle => 'Your period is coming';

  @override
  String reminderPeriodComingBody(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Expected in $days days. Time to get ready.',
      one: 'Expected in $days day. Time to get ready.',
    );
    return '$_temp0';
  }

  @override
  String get reminderFertileTitle => 'Your fertile window is opening';

  @override
  String get reminderFertileBody =>
      'The next few days are the most likely for conceiving.';

  @override
  String get reminderPillTitle => 'Time for your pill';

  @override
  String get reminderPillBody => 'Don\'t forget to take it.';

  @override
  String get reminderWaterTitle => 'Time for water';

  @override
  String get reminderWaterBody => 'Have a few sips.';

  @override
  String get reminderDoctorTitle => 'Doctor\'s appointment';

  @override
  String get reminderDoctorBody => 'You have a visit planned today.';

  @override
  String get reminderVaccinationTitle => 'Vaccination due';

  @override
  String reminderVaccinationBody(String vaccine) {
    return 'Scheduled: $vaccine. Check with your doctor.';
  }

  @override
  String get reminderTypePeriodComing => 'Period coming';

  @override
  String get reminderTypeFertileWindow => 'Fertile window';

  @override
  String get reminderTypePill => 'Pill';

  @override
  String get reminderTypeWater => 'Water';

  @override
  String get reminderTypeDoctorVisit => 'Doctor visit';

  @override
  String get reminderTypeVaccination => 'Vaccination';

  @override
  String reminderDaysBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days before',
      one: '$days day before',
    );
    return '$_temp0';
  }

  @override
  String reminderTimesPerDay(int count) {
    return '$count times a day';
  }

  @override
  String get reminderTimeLabel => 'Time';

  @override
  String get reminderAddDoctorVisit => 'Add a doctor visit';

  @override
  String get reminderDateLabel => 'Date';

  @override
  String get reminderDeleted => 'Reminder deleted';

  @override
  String get notificationsPermissionTitle => 'Allow reminders?';

  @override
  String get notificationsPermissionBody =>
      'We\'ll notify you about your period, your pill or a doctor\'s visit.';

  @override
  String get notificationsDenied =>
      'Notifications are turned off in your phone settings.';

  @override
  String get vaccinationsTitle => 'Vaccinations';

  @override
  String get vaccinationsSubtitle =>
      'This list is based on your age and life stage. You can edit it.';

  @override
  String get vaccinationsDisclaimer =>
      'This is a reference list, not a medical prescription. Confirm the timing with your doctor.';

  @override
  String get vaccineHpv => 'HPV';

  @override
  String get vaccineFlu => 'Flu';

  @override
  String get vaccineTdap => 'Whooping cough, diphtheria, tetanus (Tdap)';

  @override
  String get vaccineHepatitisB => 'Hepatitis B';

  @override
  String get vaccineMeaslesRubella => 'Measles and rubella';

  @override
  String get vaccineCovid19 => 'COVID-19';

  @override
  String get vaccineTetanus => 'Tetanus';

  @override
  String get vaccinePneumococcal => 'Pneumococcal';

  @override
  String get vaccineShingles => 'Shingles';

  @override
  String vaccinationDue(String date) {
    return 'Due $date';
  }

  @override
  String get vaccinationOverdue => 'Overdue';

  @override
  String get vaccinationStatusPlanned => 'Planned';

  @override
  String get vaccinationStatusDone => 'Done';

  @override
  String get vaccinationStatusSkipped => 'Skipped';

  @override
  String get vaccinationMarkDone => 'Mark as done';

  @override
  String get vaccinationSkip => 'Skip';

  @override
  String get vaccinationRestore => 'Back to plan';

  @override
  String get vaccinationRemind => 'Remind me';

  @override
  String get vaccinationReminderAdded => 'Reminder added';

  @override
  String get vaccinationChangeDate => 'Change date';

  @override
  String get reportCardTitle => 'Report for your doctor';

  @override
  String get reportCardBody =>
      'A PDF of your cycles, symptoms and mood over recent months.';

  @override
  String get reportShare => 'Save PDF';

  @override
  String get reportEmpty => 'Nothing to export yet — add your first entries.';

  @override
  String get reportFailed => 'Couldn\'t create the PDF';

  @override
  String get reportHeading => 'Cycle report';

  @override
  String reportGeneratedOn(String date) {
    return 'Generated $date';
  }

  @override
  String get reportSummary => 'Summary';

  @override
  String get reportAverageCycleLength => 'Average cycle length';

  @override
  String get reportAveragePeriodLength => 'Average period length';

  @override
  String get reportLastPeriodStart => 'Last period started';

  @override
  String get reportNextPredicted => 'Next period predicted';

  @override
  String reportDays(int days) {
    return '$days d';
  }

  @override
  String get reportCyclesSection => 'Cycles';

  @override
  String get reportColumnStart => 'Start';

  @override
  String get reportColumnCycleLength => 'Cycle length';

  @override
  String get reportColumnPeriodLength => 'Period length';

  @override
  String get reportLogsSection => 'Daily logs';

  @override
  String get reportColumnDate => 'Date';

  @override
  String get reportColumnFlow => 'Flow';

  @override
  String get reportColumnMood => 'Mood';

  @override
  String get reportColumnEnergy => 'Energy';

  @override
  String get reportColumnSleep => 'Sleep';

  @override
  String get reportColumnSymptoms => 'Symptoms';

  @override
  String get reportColumnNotes => 'Notes';

  @override
  String get reportProfileSection => 'About the patient';

  @override
  String get reportDash => '—';

  @override
  String get trackerPregnancySoon =>
      'Pregnancy mode is coming soon: week by week, kick counter and weight.';

  @override
  String get trackerMenopauseSoon =>
      'Menopause mode is coming soon: hot flashes, sleep and mood.';

  @override
  String get trackerSwitchToCycle => 'Open the cycle calendar';

  @override
  String get actionEdit => 'Edit';

  @override
  String get privacyHideContent => 'Hide content';

  @override
  String get privacyHideContentBody =>
      'Notifications will show only the app name, with no details.';

  @override
  String reminderTimeAt(String time) {
    return 'Time: $time';
  }

  @override
  String get homeForYou => 'For you';

  @override
  String get homeSeeAll => 'See all';

  @override
  String get homeTipOfDay => 'Tip of the day';

  @override
  String get homeContinueCourse => 'Continue course';

  @override
  String get homeStartCourse => 'Start a course';

  @override
  String get homeTrendingQa => 'Ask the experts';

  @override
  String get homeNextReminder => 'Next reminder';

  @override
  String get homeLoading => 'Putting your feed together…';

  @override
  String get homeFeedEmpty => 'Nothing to show yet. Take a look at Learn.';

  @override
  String get offerHeadingPeriodSoon => 'Your period is close — these help';

  @override
  String get offerHeadingPeriodNow => 'For these days';

  @override
  String get offerHeadingFertile => 'For trying to conceive';

  @override
  String get offerHeadingPregnancy => 'For your pregnancy';

  @override
  String get offerHeadingPostpartum => 'After birth';

  @override
  String get offerHeadingMenopause => 'For your comfort';

  @override
  String get offerHeadingTeen => 'Your first kit';

  @override
  String get offerHeadingGeneral => 'You might like';

  @override
  String pregnancyWeek(int week) {
    return 'Week $week';
  }

  @override
  String pregnancyBabySize(String size) {
    return 'Baby is the size of $size';
  }

  @override
  String pregnancyDueIn(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days to go',
      one: '$days day to go',
    );
    return '$_temp0';
  }

  @override
  String pregnancyDueDate(String date) {
    return 'Due date: $date';
  }

  @override
  String pregnancyTrimester(int trimester) {
    return 'Trimester $trimester';
  }

  @override
  String get pregnancyOverdue => 'Your due date has passed';

  @override
  String get badgeFree => 'Free';

  @override
  String get badgePremium => 'Premium';

  @override
  String get badgeLocalBrand => 'Local brand';

  @override
  String get badgeVerifiedDoctor => 'Verified doctor';

  @override
  String get badgeBundle => 'Bundle';

  @override
  String get badgeSubscription => 'Subscription';

  @override
  String get badgeAdultOnly => '18+';

  @override
  String contentMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get contentTypeVideo => 'Video';

  @override
  String get contentTypeArticle => 'Article';

  @override
  String get contentTypeCourse => 'Course';

  @override
  String get contentTypePodcast => 'Podcast';

  @override
  String get categoryMyBody => 'My body';

  @override
  String get categoryCycleHealth => 'Cycle & health';

  @override
  String get categoryPregnancySchool => 'Pregnancy school';

  @override
  String get categoryPostpartum => 'Postpartum';

  @override
  String get categoryMenopause => 'Menopause';

  @override
  String get categoryMentalHealth => 'Mental health';

  @override
  String get categoryNutrition => 'Nutrition';

  @override
  String get categoryIntimacy => 'Intimacy & relationships';

  @override
  String courseLessonsCount(int count) {
    return '$count lessons';
  }

  @override
  String courseProgressPercent(int percent) {
    return '$percent% done';
  }

  @override
  String courseNextLesson(String title) {
    return 'Next: $title';
  }

  @override
  String qaAnsweredBy(String name) {
    return 'Answered by $name';
  }

  @override
  String qaUpvotes(int count) {
    return '$count';
  }

  @override
  String get qaAwaitingAnswer => 'Waiting for a doctor\'s answer';

  @override
  String get qaAnonymous => 'Anonymous';

  @override
  String priceTenge(String price) {
    return '$price ₸';
  }

  @override
  String productRating(String rating) {
    return '$rating';
  }

  @override
  String productReviews(int count) {
    return '$count reviews';
  }

  @override
  String get shopAddToCart => 'Add to cart';

  @override
  String get shopCategoryPeriodCare => 'Period care';

  @override
  String get shopCategoryPregnancy => 'Pregnancy';

  @override
  String get shopCategoryBaby => 'Baby';

  @override
  String get shopCategoryBeauty => 'Beauty & self-care';

  @override
  String get shopCategoryWellness => 'Wellness';

  @override
  String get shopCategoryIntimateHealth => 'Intimate health';

  @override
  String get shopCategorySubscriptionBox => 'Subscription boxes';

  @override
  String get learnSearchHint => 'Search the library';

  @override
  String get learnAll => 'All';

  @override
  String get learnNothingFound => 'Nothing found. Try changing the filters.';

  @override
  String learnResultsCount(int count) {
    return '$count items';
  }

  @override
  String get learnFreeOnly => 'Free only';

  @override
  String get learnBookmarked => 'Saved';

  @override
  String get learnClearFilters => 'Clear';

  @override
  String get learnSortRecommended => 'Recommended';

  @override
  String get learnSortNewest => 'Newest';

  @override
  String get learnSortPopular => 'Popular';

  @override
  String get learnSortShortest => 'Shortest';

  @override
  String get learnSortLabel => 'Sort';

  @override
  String get learnCategories => 'Categories';

  @override
  String learnPregnancySchoolWeek(int week) {
    return 'Week $week';
  }

  @override
  String get learnPregnancyThisWeek => 'Your week';

  @override
  String get learnContinueWatching => 'Continue';

  @override
  String get ageGateTitle => '18+ section';

  @override
  String get ageGateBody =>
      'This section covers adult topics: intimacy, relationships and intimate health. Confirm that you are 18 or older.';

  @override
  String get ageGateConfirm => 'I\'m 18 or older';

  @override
  String get contentBookmark => 'Save';

  @override
  String get contentBookmarked => 'Saved';

  @override
  String get contentBookmarkRemoved => 'Removed from saved';

  @override
  String get contentShare => 'Share';

  @override
  String get contentMarkRead => 'Mark as read';

  @override
  String get contentRead => 'Read';

  @override
  String get contentRelatedProducts => 'This may help';

  @override
  String contentExpertBy(String name) {
    return 'Reviewed by $name';
  }

  @override
  String contentViews(int count) {
    return '$count views';
  }

  @override
  String get videoUnavailableTitle => 'Video unavailable';

  @override
  String get videoUnavailableBody => 'Check your connection and try again.';

  @override
  String get videoRetry => 'Try again';

  @override
  String get videoNoSource => 'No video has been uploaded for this lesson yet.';

  @override
  String get premiumGateTitle => 'This is a Premium item';

  @override
  String get premiumGateBody =>
      'Full courses, unlimited Circle AI and priority answers from doctors. The first 7 days are free.';

  @override
  String get premiumGateOpen => 'More about Premium';

  @override
  String get premiumDemoOn => 'Turn on Premium (demo)';

  @override
  String get premiumDemoOff => 'Turn off Premium (demo)';

  @override
  String get premiumDemoNote =>
      'Payment arrives in step 9. For now this is a switch for testing.';

  @override
  String get premiumActive => 'Premium is active';

  @override
  String courseModulesCount(int count) {
    return '$count modules';
  }

  @override
  String courseTotalTime(int minutes) {
    return '$minutes min total';
  }

  @override
  String get courseStart => 'Start';

  @override
  String get courseContinue => 'Continue';

  @override
  String get courseRestart => 'Start again';

  @override
  String get courseCompleted => 'Course completed';

  @override
  String get courseLessonDone => 'Lesson completed';

  @override
  String get courseMarkDone => 'Mark lesson done';

  @override
  String get courseNext => 'Next lesson';

  @override
  String get courseFinish => 'Finish the course';

  @override
  String courseLessonOf(int current, int total) {
    return 'Lesson $current of $total';
  }

  @override
  String get courseQuizBadge => 'Quiz';

  @override
  String get quizTitle => 'Check yourself';

  @override
  String quizQuestionOf(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get quizCheck => 'Check';

  @override
  String get quizNext => 'Next';

  @override
  String get quizCorrect => 'Correct';

  @override
  String get quizWrong => 'Not quite';

  @override
  String get quizResultTitle => 'Your result';

  @override
  String quizScore(int correct, int total) {
    return '$correct of $total';
  }

  @override
  String get quizPassed => 'You passed';

  @override
  String get quizFailed => 'Try again';

  @override
  String get quizRetry => 'Retake';

  @override
  String get quizFinish => 'Done';

  @override
  String get certificateTitle => 'Certificate of completion';

  @override
  String get certificateAwardedTo => 'Awarded to';

  @override
  String get certificateForCompleting => 'For completing the course';

  @override
  String certificateLessons(int lessons, int minutes) {
    return '$lessons lessons · $minutes min';
  }

  @override
  String get certificateNote =>
      'Her Circle · Educational material, not a medical qualification';

  @override
  String get certificateSave => 'Save certificate';

  @override
  String get certificateReady => 'Your certificate is ready';

  @override
  String get certificateName => 'Your name for the certificate';

  @override
  String get certificateNameHint => 'What\'s your name?';

  @override
  String get certificateFailed => 'Couldn\'t create the certificate';

  @override
  String get qaTitle => 'Ask the experts';

  @override
  String get qaAsk => 'Ask a question';

  @override
  String get qaAskTitle => 'Your question';

  @override
  String get qaAskHint =>
      'Describe what\'s worrying you. No names or personal details.';

  @override
  String get qaAskCategory => 'Category';

  @override
  String get qaAskAnonymously => 'Ask anonymously';

  @override
  String get qaAskAnonymouslyNote =>
      'Neither the doctors nor other users will see your name.';

  @override
  String get qaSend => 'Send';

  @override
  String get qaSent => 'Question sent. A doctor will answer within 48 hours.';

  @override
  String get qaSentPriority =>
      'Sent with Premium priority — an answer within 12 hours.';

  @override
  String get qaValidationTooShort =>
      'Add a little more detail — at least 15 characters.';

  @override
  String get qaPriorityBadge => 'Priority';

  @override
  String get qaPriorityHint =>
      'With Premium your questions go to the front of the queue.';

  @override
  String get qaMyQuestions => 'My questions';

  @override
  String get qaSortTop => 'Top';

  @override
  String get qaSortNew => 'New';

  @override
  String get qaSortUnanswered => 'Unanswered';

  @override
  String get qaEmpty => 'No questions in this category yet.';

  @override
  String get qaUpvote => 'Helpful';

  @override
  String qaAskedOn(String date) {
    return 'Asked $date';
  }

  @override
  String qaAnsweredOn(String date) {
    return 'Answered $date';
  }

  @override
  String qaExpertOf(String specialty, String city) {
    return '$specialty, $city';
  }

  @override
  String qaYearsOfPractice(int years) {
    return '$years years in practice';
  }

  @override
  String get qaDisclaimer =>
      'Answers from doctors are general information and do not replace a consultation.';

  @override
  String get shopSearchHint => 'Search products';

  @override
  String shopResultsCount(int count) {
    return '$count products';
  }

  @override
  String get shopNothingFound => 'Nothing found. Try changing the filters.';

  @override
  String get shopLocalBrands => 'Local brands';

  @override
  String get shopDiscounted => 'On sale';

  @override
  String shopMaxPrice(String price) {
    return 'Up to $price';
  }

  @override
  String get shopAnyPrice => 'Any price';

  @override
  String get shopSortRecommended => 'Recommended';

  @override
  String get shopSortPriceAsc => 'Price: low to high';

  @override
  String get shopSortPriceDesc => 'Price: high to low';

  @override
  String get shopSortRating => 'Top rated';

  @override
  String get shopSortNewest => 'Most reviewed';

  @override
  String get shopForYou => 'Picked for you';

  @override
  String get shopOutOfStock => 'Out of stock';

  @override
  String get productDescription => 'Description';

  @override
  String get productReviewsTitle => 'Reviews';

  @override
  String get productNoReviews => 'No reviews yet.';

  @override
  String get productSeller => 'Seller';

  @override
  String get productBundleContents => 'What\'s in the bundle';

  @override
  String get productVerifiedPurchase => 'Verified purchase';

  @override
  String get productAddedToCart => 'Added to cart';

  @override
  String productInCart(int count) {
    return 'In cart: $count';
  }

  @override
  String get productRelatedContent => 'Read about this';

  @override
  String productSaveAmount(String amount) {
    return 'Save $amount';
  }

  @override
  String get boxSubscribe => 'Subscribe';

  @override
  String get boxSubscribed => 'Subscription active';

  @override
  String get boxCancel => 'Cancel subscription';

  @override
  String get boxCancelled => 'Subscription cancelled';

  @override
  String get boxSchedule => 'Delivery schedule';

  @override
  String boxNextDelivery(String date) {
    return 'Next delivery: $date';
  }

  @override
  String get boxCadenceMonthly => 'Every cycle, 3 days before your period';

  @override
  String get boxCadenceTrimester => 'Once a trimester, 3 deliveries';

  @override
  String boxDeliveryNumber(int number) {
    return 'Delivery $number';
  }

  @override
  String get cartTitle => 'Cart';

  @override
  String get cartEmpty => 'Your cart is empty';

  @override
  String get cartEmptyBody =>
      'Have a look in the shop — we\'ve picked a few things for you.';

  @override
  String get cartGoShopping => 'Go to the shop';

  @override
  String get cartSubtotal => 'Items';

  @override
  String get cartDelivery => 'Delivery';

  @override
  String get cartDeliveryFree => 'Free';

  @override
  String get cartTotal => 'Total';

  @override
  String cartSavings(String amount) {
    return 'You save $amount';
  }

  @override
  String cartFreeDeliveryFrom(String amount) {
    return 'Add $amount more for free delivery';
  }

  @override
  String get cartCheckout => 'Checkout';

  @override
  String get cartRemove => 'Remove';

  @override
  String get cartRemoved => 'Removed from your cart';

  @override
  String get cartQuantity => 'Quantity';

  @override
  String get checkoutTitle => 'Checkout';

  @override
  String get checkoutStepAddress => 'Delivery';

  @override
  String get checkoutStepPayment => 'Payment';

  @override
  String get addressFullName => 'Full name';

  @override
  String get addressPhone => 'Phone';

  @override
  String get addressCity => 'City';

  @override
  String get addressStreet => 'Street and house';

  @override
  String get addressApartment => 'Apartment';

  @override
  String get addressPostalCode => 'Postal code';

  @override
  String get addressComment => 'Note for the courier';

  @override
  String get addressContinue => 'Continue to payment';

  @override
  String get addressRequired => 'Please fill this in';

  @override
  String get paymentKaspi => 'Kaspi Pay';

  @override
  String get paymentKaspiNote => 'The Kaspi app opens to confirm.';

  @override
  String get paymentCard => 'Bank card';

  @override
  String get paymentCardNote => 'Card details are never stored in the app.';

  @override
  String get paymentCash => 'Cash on delivery';

  @override
  String get paymentCashNote => 'Pay the courier on delivery.';

  @override
  String get cardNumber => 'Card number';

  @override
  String get cardExpiry => 'Expiry (MM/YY)';

  @override
  String get cardCvc => 'CVC';

  @override
  String get cardHolder => 'Name on card';

  @override
  String get cardInvalidNumber => 'Check the card number';

  @override
  String get cardInvalidExpiry => 'Check the expiry date';

  @override
  String get cardInvalidCvc => 'Check the CVC';

  @override
  String get cardTestHint =>
      'Demo payment: any valid card passes; 4000 0000 0000 0002 is declined.';

  @override
  String paymentPay(String amount) {
    return 'Pay $amount';
  }

  @override
  String get paymentErrorDeclined => 'Payment declined. Try another card.';

  @override
  String get paymentErrorFunds => 'Insufficient funds.';

  @override
  String get paymentErrorInvalidCard => 'Those card details aren\'t valid.';

  @override
  String get paymentErrorNetwork => 'No connection to the payment service.';

  @override
  String get paymentErrorCancelled => 'Payment cancelled.';

  @override
  String get paymentErrorNotImplemented =>
      'This payment method isn\'t available yet. Please pick another.';

  @override
  String get orderPlacedTitle => 'Order placed';

  @override
  String get orderPlacedBody =>
      'We\'ve sent the details to your notifications. Thank you!';

  @override
  String orderNumber(String reference) {
    return 'Order $reference';
  }

  @override
  String get orderTrack => 'Track order';

  @override
  String get orderContinueShopping => 'Keep shopping';

  @override
  String get ordersTitle => 'My orders';

  @override
  String get ordersEmpty => 'No orders yet.';

  @override
  String orderItemsCount(int count) {
    return '$count items';
  }

  @override
  String orderPlacedOn(String date) {
    return 'placed $date';
  }

  @override
  String get orderStatusPlaced => 'Placed';

  @override
  String get orderStatusPacking => 'Packing';

  @override
  String get orderStatusShipped => 'On the way';

  @override
  String get orderStatusDelivered => 'Delivered';

  @override
  String get orderStatusCancelled => 'Cancelled';

  @override
  String orderEstimated(String date) {
    return 'Expected $date';
  }

  @override
  String orderPaymentReference(String reference) {
    return 'Payment $reference';
  }

  @override
  String get orderDeliveryTo => 'Delivering to';

  @override
  String get orderSummary => 'Order summary';

  @override
  String orderQuantityShort(int count) {
    return '× $count';
  }

  @override
  String get aiIntroTitle => 'Ask anything';

  @override
  String get aiIntroBody =>
      'Circle AI answers from the app\'s own material: your cycle, pregnancy, recovery after birth, menopause and period care.';

  @override
  String get aiSuggestionsTitle => 'Where to start';

  @override
  String get aiInputHint => 'Your question…';

  @override
  String get aiSend => 'Send';

  @override
  String get aiThinking => 'Circle AI is typing…';

  @override
  String get aiAnswerDisclaimer =>
      'This is not a diagnosis. For a diagnosis, see a doctor.';

  @override
  String get aiReferencesTitle => 'More on this in the app';

  @override
  String get aiErrorBody =>
      'Could not get an answer. Check your connection and try again.';

  @override
  String get aiRetry => 'Try again';

  @override
  String aiMessagesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count questions left today',
      one: '$count question left today',
    );
    return '$_temp0';
  }

  @override
  String get aiUnlimited => 'Premium: unlimited';

  @override
  String get aiLimitTitle => 'You have used today’s questions';

  @override
  String get aiLimitBody =>
      'The free plan gives 5 questions a day. Premium makes them unlimited, and the counter resets at midnight.';

  @override
  String get aiLimitCta => 'See what premium gives';

  @override
  String get aiClear => 'Clear the chat';

  @override
  String get aiClearConfirmTitle => 'Clear the chat?';

  @override
  String get aiClearConfirmBody =>
      'The history is kept on this device only and will be deleted for good.';

  @override
  String get aiClearConfirmAction => 'Clear';

  @override
  String get aiCleared => 'Chat cleared';

  @override
  String get aiHistoryLocal => 'This chat is stored on your device only.';

  @override
  String get aiEmergencyTitle => 'This sounds like it needs urgent care';

  @override
  String get aiEmergencyBody =>
      'Circle AI cannot help with this. Call the ambulance on 103 or go to the nearest hospital. If someone is with you, ask them for help now.';

  @override
  String get aiEmergencyCall => 'Call 103';

  @override
  String get aiEmergencyCallFailed =>
      'Could not open the dialler. Please dial 103 yourself.';

  @override
  String get aiQuestionCycleLength => 'What cycle length is normal?';

  @override
  String get aiQuestionPeriodPain => 'What helps with period pain?';

  @override
  String get aiQuestionMoodSwings =>
      'Why does my mood change before my period?';

  @override
  String get aiQuestionFirstPeriod => 'When does a first period come?';

  @override
  String get aiQuestionPadsOrTampons =>
      'Pads, tampons or a cup — which should I use?';

  @override
  String get aiQuestionFertileDays => 'How do I find my fertile days?';

  @override
  String get aiQuestionConceiveFaster => 'What helps to conceive sooner?';

  @override
  String get aiQuestionPregnancySafeFood =>
      'What should I not eat while pregnant?';

  @override
  String get aiQuestionBabyMovements => 'When will I feel the baby move?';

  @override
  String get aiQuestionPostpartumRecovery =>
      'What does recovery after birth look like?';

  @override
  String get aiQuestionBreastfeedingPain => 'Why does breastfeeding hurt?';

  @override
  String get aiQuestionHotFlashes => 'What can I do about hot flashes?';

  @override
  String get aiQuestionMenopauseSleep => 'Why do I sleep badly in menopause?';

  @override
  String get aiQuestionIronFoods => 'Which foods have the most iron?';

  @override
  String get circleTitle => 'My circle';

  @override
  String get circleSubtitle => 'Partner and Moms & Daughters';

  @override
  String get partnerTitle => 'Partner';

  @override
  String get partnerIntroBody =>
      'Link your partner so he sees exactly what you choose to share, and knows how to support you today.';

  @override
  String get familyTitle => 'Moms & Daughters';

  @override
  String get familyIntroBody =>
      'A mother and daughter link up and get age-appropriate lessons together. The daughter\'s tracker stays private unless she shares it.';

  @override
  String get circleCreateInvite => 'Create an invite code';

  @override
  String get circleInviteTitle => 'Show this code';

  @override
  String get circleInviteBody =>
      'Read the code out or let them scan the QR. They enter it in Her Circle on their own phone.';

  @override
  String get circleCopyCode => 'Copy the code';

  @override
  String get circleCodeCopied => 'Code copied';

  @override
  String get circleQrHint => 'The QR can be scanned with a phone camera.';

  @override
  String get circleWaitingTitle => 'Waiting for them to join';

  @override
  String get circleWaitingBody => 'The code works until you unlink.';

  @override
  String get circleDemoAccept => 'Demo: mark as connected';

  @override
  String get circleDemoNote =>
      'Real pairing arrives with the backend. Until then this is a demo switch.';

  @override
  String get circleJoinCta => 'I have a code';

  @override
  String get circleJoinTitle => 'Enter a code';

  @override
  String get circleJoinBody => 'Enter the six-character code you were given.';

  @override
  String get circleJoinHint => 'For example ABC-D2F';

  @override
  String get circleJoinAction => 'Connect';

  @override
  String get circleJoinInvalid => 'A code is six characters long';

  @override
  String get circleJoinUnknown => 'No such code, or it has already been used';

  @override
  String get circleJoinOwnCode => 'That is your own code';

  @override
  String get circleJoinAlready => 'You already have a link like this';

  @override
  String get circleJoinNetwork => 'No connection. Please try again.';

  @override
  String get circleJoined => 'You are connected';

  @override
  String get circleSharingTitlePartner => 'What your partner sees';

  @override
  String get circleSharingTitleFamily => 'What you share';

  @override
  String get circleSharingBody =>
      'Nothing is shared until you turn a switch on, and you can turn any of them off at any time.';

  @override
  String get circleSharingOff => 'You are not sharing anything right now';

  @override
  String get circleStopSharing => 'Turn everything off';

  @override
  String get scopeLifeStage => 'Life stage';

  @override
  String get scopeCyclePhase => 'Cycle day and phase';

  @override
  String get scopeMood => 'Today\'s mood';

  @override
  String get scopePregnancy => 'Pregnancy week and due date';

  @override
  String get scopeSymptoms => 'Today\'s symptoms';

  @override
  String get circlePreviewCta => 'See what your partner sees';

  @override
  String get circlePreviewTitle => 'Through your partner\'s eyes';

  @override
  String get circlePreviewEmpty =>
      'For now they only see the tip of the day — nothing about you.';

  @override
  String get circleSupportTitle => 'How to support her today';

  @override
  String get circlePeerTitle => 'Her day';

  @override
  String get circlePeerDemoNote =>
      'This is sample data. The real thing arrives with the backend.';

  @override
  String get circlePeerNothing =>
      'She is not sharing anything yet. That is her decision.';

  @override
  String get circleUnlink => 'Unlink';

  @override
  String get circleUnlinkTitle => 'Unlink?';

  @override
  String get circleUnlinkBodySharer =>
      'They will stop seeing your data and the code will stop working.';

  @override
  String get circleUnlinkBodyViewer => 'You will no longer see her data.';

  @override
  String get circleUnlinked => 'Unlinked';

  @override
  String get circlePeerNameLabel => 'Their name';

  @override
  String get circlePeerNameHint => 'Optional';

  @override
  String circleLinkedOn(String date) {
    return 'Connected on $date';
  }

  @override
  String get familyRoleQuestion => 'Which are you?';

  @override
  String get familyRoleMother => 'I am the mother';

  @override
  String get familyRoleDaughter => 'I am the daughter';

  @override
  String get familyInviteMother => 'Invite your daughter';

  @override
  String get familyInviteDaughter => 'Invite your mother';

  @override
  String get familyPrivacyNote =>
      'The daughter\'s tracker stays private. Her mother sees only what the daughter turns on.';

  @override
  String get familyLessonsTitle => 'Lessons together';

  @override
  String get familyLessonsBody =>
      'Material that suits you both. The 18+ section never appears here.';

  @override
  String get supportTipPeriodComfort =>
      'Small things help today: a heat pad, a warm drink, and taking some of the chores off her.';

  @override
  String get supportTipPeriodPatience =>
      'Keep plans flexible and don\'t push for a busy day.';

  @override
  String get supportTipFollicularPlans =>
      'A good time for plans together: energy is usually higher.';

  @override
  String get supportTipFertileHonesty =>
      'Talk openly about intimacy and contraception — no hints needed.';

  @override
  String get supportTipLutealCalm =>
      'Fewer arguments over small things, more quiet evenings.';

  @override
  String get supportTipPregnancyChores =>
      'Take on the heavy things: bags, cleaning, night duty with an older child.';

  @override
  String get supportTipPregnancyAppointments =>
      'Ask when the next appointment is and offer to come along.';

  @override
  String get supportTipPostpartumNight =>
      'Let her sleep: take one night feed or one morning yourself.';

  @override
  String get supportTipPostpartumAsk =>
      'Ask \"what can I do?\" rather than \"how are you?\" — it is easier to answer.';

  @override
  String get supportTipMenopauseCool =>
      'Keep the room cooler, and don\'t joke about the heat.';

  @override
  String get supportTipLowMoodListen =>
      'Today, listen rather than advise. Ask what would help.';

  @override
  String get supportTipGreatMoodCelebrate =>
      'She is having a good day — say so out loud.';

  @override
  String get supportTipGeneral =>
      'Ask how her day went, and actually listen to the answer.';

  @override
  String get familyLinkWaiting =>
      'You asked to invite your mom — the code is here';

  @override
  String get premiumTitle => 'Her Circle Premium';

  @override
  String get premiumPitch =>
      'Every course in full, unlimited Circle AI, and priority answers from doctors.';

  @override
  String get premiumBenefitFullCourses => 'Every course in full';

  @override
  String get premiumBenefitFullCoursesDesc =>
      'All lessons, quizzes and certificates, with nothing held back.';

  @override
  String get premiumBenefitUnlimitedAi => 'Unlimited Circle AI';

  @override
  String get premiumBenefitUnlimitedAiDesc =>
      'Ask as much as you need — the five-a-day limit is lifted.';

  @override
  String get premiumBenefitPriorityQa => 'Priority in Q&A';

  @override
  String get premiumBenefitPriorityQaDesc =>
      'Doctors see your questions first.';

  @override
  String get premiumBenefitAdvancedInsights => 'Deeper insights';

  @override
  String get premiumBenefitAdvancedInsightsDesc =>
      'A year of mood and cycle charts, and how accurate your forecasts are.';

  @override
  String get premiumBenefitNoAds => 'No ads';

  @override
  String get premiumBenefitNoAdsDesc =>
      'No banners and no paid-for recommendations.';

  @override
  String get premiumPlanMonthly => 'Monthly';

  @override
  String get premiumPlanYearly => 'Yearly';

  @override
  String premiumPerMonth(String price) {
    return '≈ $price a month';
  }

  @override
  String premiumSave(int percent) {
    return 'Save $percent%';
  }

  @override
  String get premiumTrialCta => '7 days free';

  @override
  String premiumTrialNote(String price) {
    return 'Free for 7 days, then $price. Cancel any time.';
  }

  @override
  String premiumSubscribe(String price) {
    return 'Subscribe for $price';
  }

  @override
  String premiumTrialLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days left in your trial',
      one: '$days day left in your trial',
    );
    return '$_temp0';
  }

  @override
  String premiumActiveUntil(String date) {
    return 'Premium is active until $date';
  }

  @override
  String get premiumTrialUsed => 'You have already used the free trial.';

  @override
  String get premiumCancelPlan => 'Cancel renewal';

  @override
  String get premiumCancelTitle => 'Cancel renewal?';

  @override
  String get premiumCancelBody =>
      'Your access lasts until the end of the period you have paid for.';

  @override
  String get premiumCancelled => 'Renewal cancelled';

  @override
  String get premiumPayTitle => 'Pay for premium';

  @override
  String get premiumThanks => 'Premium is on. Thank you!';

  @override
  String premiumBonusMonths(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months bonus months are waiting for your first subscription',
      one: '$months bonus month is waiting for your first subscription',
    );
    return '$_temp0';
  }

  @override
  String get premiumOpen => 'More about premium';

  @override
  String get referralTitle => 'Invite a friend';

  @override
  String get referralBody =>
      'Share your code. When she signs up, you both get a month of premium.';

  @override
  String get referralCodeLabel => 'Your code';

  @override
  String referralShareText(String code) {
    return 'Join me on Her Circle: your cycle, courses and Circle AI. My code is $code — we both get a month of premium.';
  }

  @override
  String get referralShare => 'Share the code';

  @override
  String referralInvited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count friends have joined',
      one: '$count friend has joined',
      zero: 'No one has joined yet',
    );
    return '$_temp0';
  }

  @override
  String referralEarned(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months months of premium earned',
      one: '$months month of premium earned',
      zero: 'No premium months earned yet',
    );
    return '$_temp0';
  }

  @override
  String get referralDemoInvite => 'Demo: a friend signed up';

  @override
  String get referralDemoNote =>
      'The real credit arrives with the backend, which checks the code when your friend signs up.';

  @override
  String referralRewarded(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months months of premium added',
      one: '$months month of premium added',
    );
    return '$_temp0';
  }

  @override
  String get referralCapReached =>
      'You have earned the maximum number of bonus months.';

  @override
  String get profileMyLearning => 'Learning';

  @override
  String get profileSaved => 'Saved';

  @override
  String get profileCertificates => 'Certificates';

  @override
  String get profileChangeStage => 'Change life stage';

  @override
  String get profileStageSaved => 'Life stage updated';

  @override
  String get savedEmpty => 'Nothing saved yet. Tap Save on anything in Learn.';

  @override
  String get certificatesEmpty => 'Finish a course to earn a certificate.';

  @override
  String certificatesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count certificates',
      one: '$count certificate',
    );
    return '$_temp0';
  }

  @override
  String get referralCopied => 'Invite copied';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days to go',
      one: '$days day to go',
    );
    return '$_temp0';
  }

  @override
  String pregnancyOverdueDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days past the due date',
      one: '$days day past the due date',
    );
    return '$_temp0';
  }

  @override
  String get pregnancyNoDateTitle => 'Tell us your last period date';

  @override
  String get pregnancyNoDateBody =>
      'We use it to work out your week and your due date.';

  @override
  String get pregnancySetDate => 'Set the date';

  @override
  String get pregnancyToolsTitle => 'Tools';

  @override
  String get kickTitle => 'Kick counter';

  @override
  String get kickBody =>
      'The usual count is ten movements. Tap for each one — the count stops itself.';

  @override
  String get kickTap => 'Movement';

  @override
  String kickProgress(int count, int target) {
    return '$count of $target';
  }

  @override
  String kickElapsed(String time) {
    return '$time elapsed';
  }

  @override
  String get kickDone => 'Ten movements counted. All good.';

  @override
  String get kickSlow =>
      'Two hours have passed with fewer than ten movements. Call your doctor or your maternity hospital.';

  @override
  String get kickStop => 'Stop counting';

  @override
  String get kickHistoryTitle => 'Earlier sessions';

  @override
  String get kickEmpty => 'No sessions yet.';

  @override
  String kickSessionSummary(int count, String time) {
    return '$count movements in $time';
  }

  @override
  String get contractionTitle => 'Contraction timer';

  @override
  String get contractionBody =>
      'Tap when a contraction starts, and again when it ends.';

  @override
  String get contractionStart => 'Contraction started';

  @override
  String get contractionStop => 'Contraction ended';

  @override
  String contractionRunning(String time) {
    return 'Running $time';
  }

  @override
  String contractionAverageDuration(String time) {
    return 'Average length $time';
  }

  @override
  String contractionAverageInterval(String time) {
    return 'Average gap $time';
  }

  @override
  String contractionCountHour(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count contractions in the last hour',
      one: '$count contraction in the last hour',
    );
    return '$_temp0';
  }

  @override
  String get contractionCallNow =>
      'Contractions five minutes apart, a minute long, for an hour. Time to call your doctor or go to the hospital.';

  @override
  String get contractionEmpty => 'Nothing recorded yet.';

  @override
  String get contractionHistoryTitle => 'Recorded contractions';

  @override
  String get contractionClear => 'Clear the list';

  @override
  String get contractionCleared => 'List cleared';

  @override
  String get weightTitle => 'Weight';

  @override
  String get weightAdd => 'Record your weight';

  @override
  String get weightLabel => 'Weight in kg';

  @override
  String get weightSaved => 'Weight recorded';

  @override
  String get weightInvalid => 'Enter a weight between 30 and 250 kg';

  @override
  String weightCurrent(String kg) {
    return 'Now $kg kg';
  }

  @override
  String weightGain(String kg) {
    return '$kg kg gained';
  }

  @override
  String weightChange(String kg) {
    return '$kg kg since last time';
  }

  @override
  String get weightEmpty =>
      'Weigh yourself once a week: that shows the trend rather than the daily noise.';

  @override
  String get weightChartTitle => 'Weight by pregnancy week';

  @override
  String get weightDisclaimer =>
      'How much gain is healthy depends on your starting weight. Discuss it with your doctor.';

  @override
  String get menopauseIntro =>
      'Log hot flashes, sleep and mood: that shows what is changing, and what to raise with your doctor.';

  @override
  String get postpartumIntro =>
      'Log how you feel, your sleep and your mood. Your cycle may take a while to return, and that is normal.';

  @override
  String postpartumWeeks(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: '$weeks weeks since birth',
      one: '$weeks week since birth',
    );
    return '$_temp0';
  }

  @override
  String symptomsWindowTitle(int days) {
    return 'The last $days days';
  }

  @override
  String get symptomsEmpty =>
      'Nothing logged yet. Start with how you feel today.';

  @override
  String symptomsDaysCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '$days day',
    );
    return '$_temp0';
  }

  @override
  String symptomsAverageSleep(String hours) {
    return 'Sleep averages $hours h';
  }

  @override
  String symptomsAverageMood(String score) {
    return 'Mood averages $score out of 5';
  }

  @override
  String symptomsLoggedDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days logged',
      one: '$days day logged',
    );
    return '$_temp0';
  }

  @override
  String get trackerModeCycle => 'Cycle';

  @override
  String get trackerModePregnancy => 'Pregnancy';

  @override
  String get trackerModePostpartum => 'Postpartum';

  @override
  String get trackerModeMenopause => 'Menopause';

  @override
  String trackerBackToMode(String mode) {
    return 'Back to $mode';
  }

  @override
  String get trackerCycleCalendar => 'Cycle calendar';

  @override
  String weightKgValue(String kg) {
    return '$kg kg';
  }
}
