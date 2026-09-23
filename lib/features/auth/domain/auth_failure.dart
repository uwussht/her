/// Why an auth action failed. Mapped to localized messages in the UI.
enum AuthFailureReason {
  invalidPhone,
  invalidCode,
  codeExpired,
  invalidEmail,
  wrongCredentials,
  emailInUse,
  weakPassword,
  tooManyRequests,
  network,

  /// The user backed out, e.g. closed the Google account picker. Not shown.
  cancelled,
  unknown,
}

class AuthFailure implements Exception {
  const AuthFailure(this.reason, [this.debugMessage]);

  final AuthFailureReason reason;
  final String? debugMessage;

  @override
  String toString() =>
      'AuthFailure($reason${debugMessage == null ? '' : ': $debugMessage'})';
}
