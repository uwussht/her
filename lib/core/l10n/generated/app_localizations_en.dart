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
}
