/// Build-time configuration passed with `--dart-define`.
///
/// Secrets never go here. AI provider keys live only on the FastAPI proxy.
abstract final class AppEnv {
  /// Base URL of the FastAPI proxy that serves `POST /ai/chat`.
  static const String aiBaseUrl = String.fromEnvironment(
    'AI_BASE_URL',
    defaultValue: 'http://10.0.2.2:8000',
  );

  /// Use mock repositories (assets/mock/) instead of Firebase and the AI
  /// proxy. Stays on until the backend is connected.
  static const bool useMocks = bool.fromEnvironment(
    'USE_MOCKS',
    defaultValue: true,
  );

  /// Initialise Firebase at startup. Requires
  /// `android/app/google-services.json`.
  static const bool firebaseEnabled = bool.fromEnvironment('FIREBASE_ENABLED');
}
