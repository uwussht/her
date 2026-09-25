/// Route paths. Always navigate with these, never with literals.
abstract final class AppRoutes {
  // Onboarding and auth.
  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String language = '/language';
  static const String auth = '/auth';
  static const String authPhone = '/auth/phone';
  static const String authOtp = '/auth/otp';
  static const String authEmail = '/auth/email';
  static const String quiz = '/quiz';
  static const String familyOffer = '/family-offer';

  // Bottom navigation tabs (shell branches).
  static const String home = '/home';
  static const String learn = '/learn';
  static const String tracker = '/tracker';
  static const String shop = '/shop';
  static const String profile = '/profile';

  /// A single Learn item: an article, a video lesson or a course intro.
  static String learnItem(String id) => '$learn/$id';

  /// Pregnancy School, week by week.
  static const String pregnancySchool = '$learn/pregnancy-school';

  /// Course contents.
  static String course(String courseId) => '$learn/course/$courseId';

  /// One lesson inside a course.
  static String lesson(String courseId, String lessonId) =>
      '$learn/course/$courseId/lesson/$lessonId';

  /// Course completion certificate.
  static String certificate(String courseId) =>
      '$learn/course/$courseId/certificate';

  // Expert Q&A.
  static const String qa = '/qa';
  static const String qaAsk = '$qa/ask';

  static String qaQuestion(String id) => '$qa/$id';

  // Full-screen routes above the shell.
  static const String reminders = '/reminders';
  static const String vaccinations = '/reminders/vaccinations';
  static const String settings = '/settings';
  static const String aiAssistant = '/ai';

  /// Branch root paths in bottom-bar order.
  static const List<String> tabs = [home, learn, tracker, shop, profile];

  /// Routes that only make sense while onboarding is unfinished.
  static const List<String> onboarding = [
    intro,
    language,
    auth,
    quiz,
    familyOffer,
  ];
}
