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

  /// A product page.
  static String product(String id) => '$shop/$id';

  /// The cart and checkout.
  static const String cart = '$shop/cart';
  static const String checkout = '$shop/checkout';

  /// Order history and one order.
  static const String orders = '$shop/orders';

  static String order(String id) => '$orders/$id';

  /// Confirmation shown right after payment.
  static String orderPlaced(String id) => '$orders/$id/placed';

  // Expert Q&A.
  static const String qa = '/qa';
  static const String qaAsk = '$qa/ask';

  static String qaQuestion(String id) => '$qa/$id';

  // Her circle: partner and Moms & Daughters links.
  static const String circlePartner = '/circle/partner';
  static const String circleFamily = '/circle/family';

  /// What her partner sees, as she sees it.
  static const String circlePartnerPreview = '$circlePartner/preview';

  /// Accepting someone else's invite. [kind] is `partner` or `family`.
  static String circleJoin(String kind) => '/circle/join/$kind';

  /// Pregnancy tools (tracker, pregnancy mode).
  static const String kickCounter = '/tracker/kicks';
  static const String contractionTimer = '/tracker/contractions';
  static const String weightLog = '/tracker/weight';

  // Premium, referrals and her own library.
  static const String premium = '/premium';
  static const String referrals = '/premium/referrals';
  static const String saved = '/saved';
  static const String certificates = '/certificates';

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
