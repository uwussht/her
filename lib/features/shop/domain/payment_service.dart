import 'order.dart';

/// Why a payment failed. Mapped to localized messages in the UI.
enum PaymentFailureReason {
  declined,
  insufficientFunds,
  invalidCard,
  network,
  cancelled,
  notImplemented,
}

/// The outcome of a payment attempt.
sealed class PaymentResult {
  const PaymentResult();
}

class PaymentSucceeded extends PaymentResult {
  const PaymentSucceeded({required this.reference});

  /// Provider reference, shown on the receipt.
  final String reference;
}

class PaymentFailed extends PaymentResult {
  const PaymentFailed(this.reason, [this.debugMessage]);

  final PaymentFailureReason reason;
  final String? debugMessage;
}

/// Card details, only ever held in memory during checkout.
class CardDetails {
  const CardDetails({
    required this.number,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvc,
    required this.holder,
  });

  /// Digits only.
  final String number;
  final int expiryMonth;

  /// Four digits.
  final int expiryYear;
  final String cvc;
  final String holder;
}

/// Payment provider.
///
/// Implementations must never be called with card details that the app has
/// stored: Her Circle keeps none. Today the mock implementation runs; Kaspi
/// Pay is stubbed out below.
abstract interface class PaymentService {
  /// Whether this provider can take [method].
  bool supports(PaymentMethod method);

  Future<PaymentResult> pay({
    required PaymentMethod method,
    required int amount,
    required String orderId,
    CardDetails? card,
  });
}

/// Card number checks that do not need a provider.
abstract final class CardValidator {
  /// Test card that always declines, so the failure path can be exercised.
  static const String declineCard = '4000000000000002';

  static String digitsOnly(String input) => input.replaceAll(RegExp(r'\D'), '');

  /// Luhn checksum, the standard card-number sanity check.
  static bool isValidNumber(String input) {
    final digits = digitsOnly(input);
    if (digits.length < 13 || digits.length > 19) return false;
    var sum = 0;
    var double = false;
    for (var i = digits.length - 1; i >= 0; i--) {
      var digit = int.parse(digits[i]);
      if (double) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }
      sum += digit;
      double = !double;
    }
    return sum % 10 == 0;
  }

  /// Groups a number as `4000 0000 0000 0002` while typing.
  static String format(String input) {
    final digits = digitsOnly(input);
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(digits[i]);
    }
    return buffer.toString();
  }

  /// True when the card is still valid at the end of its expiry month.
  static bool isExpiryValid(int month, int year, {DateTime? now}) {
    if (month < 1 || month > 12) return false;
    final today = now ?? DateTime.now();
    // Valid through the last day of the expiry month.
    final expires = DateTime(year, month + 1);
    return expires.isAfter(DateTime(today.year, today.month, today.day));
  }

  static bool isValidCvc(String cvc) =>
      RegExp(r'^\d{3,4}$').hasMatch(cvc.trim());
}

/// Offline payment provider for development and tests.
///
/// Accepts everything except [CardValidator.declineCard], so the failure
/// path is reachable without a backend.
class MockPaymentService implements PaymentService {
  const MockPaymentService({this.latency = const Duration(milliseconds: 900)});

  final Duration latency;

  @override
  bool supports(PaymentMethod method) => true;

  @override
  Future<PaymentResult> pay({
    required PaymentMethod method,
    required int amount,
    required String orderId,
    CardDetails? card,
  }) async {
    if (latency != Duration.zero) await Future<void>.delayed(latency);

    if (amount <= 0) {
      return const PaymentFailed(PaymentFailureReason.declined, 'empty order');
    }
    if (method == PaymentMethod.cashOnDelivery) {
      return PaymentSucceeded(reference: 'COD-$orderId');
    }
    if (method.needsCardDetails) {
      if (card == null || !CardValidator.isValidNumber(card.number)) {
        return const PaymentFailed(PaymentFailureReason.invalidCard);
      }
      if (CardValidator.digitsOnly(card.number) == CardValidator.declineCard) {
        return const PaymentFailed(PaymentFailureReason.declined);
      }
    }
    return PaymentSucceeded(
      reference:
          '${method.name.toUpperCase()}-'
          '${DateTime.now().millisecondsSinceEpoch.toRadixString(36).toUpperCase()}',
    );
  }
}

/// Kaspi Pay integration point.
///
/// Kaspi requires a merchant account and a server-side callback: the app asks
/// our backend to create a payment, opens the Kaspi app via deep link, and
/// the backend receives the result webhook and marks the order paid. None of
/// that can live in the client, so this stub stays unimplemented until the
/// backend exists — wire it up in `paymentServiceProvider`.
class KaspiPaymentService implements PaymentService {
  const KaspiPaymentService();

  @override
  bool supports(PaymentMethod method) => method == PaymentMethod.kaspi;

  @override
  Future<PaymentResult> pay({
    required PaymentMethod method,
    required int amount,
    required String orderId,
    CardDetails? card,
  }) async {
    // TODO(backend): POST /payments/kaspi to create the payment, open the
    // returned deep link, then poll or await the push telling us it settled.
    return const PaymentFailed(
      PaymentFailureReason.notImplemented,
      'Kaspi Pay needs the merchant backend',
    );
  }
}
