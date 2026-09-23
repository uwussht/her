/// Route paths and names. Always navigate with these, never with literals.
abstract final class AppRoutes {
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
}
