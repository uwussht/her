import '../../../core/l10n/l10n.dart';
import '../domain/auth_failure.dart';

/// Localized message for an auth error, or null when nothing should be
/// shown (e.g. the user cancelled).
String? authFailureMessage(AppLocalizations l10n, Object error) {
  final reason = error is AuthFailure
      ? error.reason
      : AuthFailureReason.unknown;
  return switch (reason) {
    AuthFailureReason.cancelled => null,
    AuthFailureReason.invalidPhone => l10n.authErrorInvalidPhone,
    AuthFailureReason.invalidCode => l10n.authErrorInvalidCode,
    AuthFailureReason.codeExpired => l10n.authErrorCodeExpired,
    AuthFailureReason.invalidEmail => l10n.authErrorInvalidEmail,
    AuthFailureReason.wrongCredentials => l10n.authErrorWrongCredentials,
    AuthFailureReason.emailInUse => l10n.authErrorEmailInUse,
    AuthFailureReason.weakPassword => l10n.authErrorWeakPassword,
    AuthFailureReason.tooManyRequests => l10n.authErrorTooManyRequests,
    AuthFailureReason.network => l10n.authErrorNetwork,
    AuthFailureReason.unknown => l10n.authErrorUnknown,
  };
}
