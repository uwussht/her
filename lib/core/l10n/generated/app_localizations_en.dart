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
  String get settingsAbout => 'About';

  @override
  String appVersion(String version) {
    return 'Version $version';
  }

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
}
