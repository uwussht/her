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

  // Full-screen routes above the shell.
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
