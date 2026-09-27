import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/core/l10n/localized_text.dart';
import 'package:her_circle/features/shop/domain/order.dart';
import 'package:her_circle/features/shop/domain/payment_service.dart';

void main() {
  group('CardValidator', () {
    test('accepts valid numbers and rejects bad ones', () {
      // Well-known test numbers, all Luhn-valid.
      expect(CardValidator.isValidNumber('4242 4242 4242 4242'), isTrue);
      expect(CardValidator.isValidNumber('5555555555554444'), isTrue);
      expect(CardValidator.isValidNumber(CardValidator.declineCard), isTrue);

      expect(CardValidator.isValidNumber('4242 4242 4242 4241'), isFalse);
      expect(CardValidator.isValidNumber('1234'), isFalse);
      expect(CardValidator.isValidNumber(''), isFalse);
      // Too long for a card.
      expect(CardValidator.isValidNumber('4' * 20), isFalse);
    });

    test('formats in groups of four', () {
      expect(CardValidator.format('4242424242424242'), '4242 4242 4242 4242');
      expect(CardValidator.format('42424'), '4242 4');
      expect(CardValidator.digitsOnly('4242-4242 4242'), '424242424242');
    });

    test('expiry is valid through the end of its month', () {
      final now = DateTime(2026, 9, 27);
      expect(CardValidator.isExpiryValid(9, 2026, now: now), isTrue);
      expect(CardValidator.isExpiryValid(8, 2026, now: now), isFalse);
      expect(CardValidator.isExpiryValid(1, 2027, now: now), isTrue);
      expect(CardValidator.isExpiryValid(13, 2027, now: now), isFalse);
      expect(CardValidator.isExpiryValid(0, 2027, now: now), isFalse);
    });

    test('CVC must be three or four digits', () {
      expect(CardValidator.isValidCvc('123'), isTrue);
      expect(CardValidator.isValidCvc('1234'), isTrue);
      expect(CardValidator.isValidCvc('12'), isFalse);
      expect(CardValidator.isValidCvc('12a'), isFalse);
    });
  });

  group('MockPaymentService', () {
    const service = MockPaymentService(latency: Duration.zero);

    const goodCard = CardDetails(
      number: '4242424242424242',
      expiryMonth: 12,
      expiryYear: 2030,
      cvc: '123',
      holder: 'ARUZHAN K',
    );

    test('Kaspi and cash succeed without card details', () async {
      for (final method in [
        PaymentMethod.kaspi,
        PaymentMethod.cashOnDelivery,
      ]) {
        final result = await service.pay(
          method: method,
          amount: 5000,
          orderId: 'o1',
        );
        expect(result, isA<PaymentSucceeded>());
        expect((result as PaymentSucceeded).reference, isNotEmpty);
      }
    });

    test('a card payment needs valid details', () async {
      final missing = await service.pay(
        method: PaymentMethod.card,
        amount: 5000,
        orderId: 'o1',
      );
      expect(
        missing,
        isA<PaymentFailed>().having(
          (f) => f.reason,
          'reason',
          PaymentFailureReason.invalidCard,
        ),
      );

      final good = await service.pay(
        method: PaymentMethod.card,
        amount: 5000,
        orderId: 'o1',
        card: goodCard,
      );
      expect(good, isA<PaymentSucceeded>());
    });

    test('the test card is declined', () async {
      final result = await service.pay(
        method: PaymentMethod.card,
        amount: 5000,
        orderId: 'o1',
        card: const CardDetails(
          number: CardValidator.declineCard,
          expiryMonth: 12,
          expiryYear: 2030,
          cvc: '123',
          holder: 'ARUZHAN K',
        ),
      );
      expect(
        result,
        isA<PaymentFailed>().having(
          (f) => f.reason,
          'reason',
          PaymentFailureReason.declined,
        ),
      );
    });

    test('an empty order is declined', () async {
      final result = await service.pay(
        method: PaymentMethod.kaspi,
        amount: 0,
        orderId: 'o1',
      );
      expect(result, isA<PaymentFailed>());
    });
  });

  group('KaspiPaymentService', () {
    const service = KaspiPaymentService();

    test('only claims to support Kaspi', () {
      expect(service.supports(PaymentMethod.kaspi), isTrue);
      expect(service.supports(PaymentMethod.card), isFalse);
    });

    test(
      'reports itself unimplemented rather than pretending to pay',
      () async {
        final result = await service.pay(
          method: PaymentMethod.kaspi,
          amount: 5000,
          orderId: 'o1',
        );
        expect(
          result,
          isA<PaymentFailed>().having(
            (f) => f.reason,
            'reason',
            PaymentFailureReason.notImplemented,
          ),
        );
      },
    );
  });

  group('Order', () {
    final order = Order(
      id: '4f2a91b8-0000-0000-0000-000000000000',
      lines: [
        const OrderLine(
          productId: 'a',
          title: LocalizedText({'ru': 'Прокладки', 'en': 'Pads'}),
          unitPrice: 2000,
          quantity: 2,
        ),
      ],
      address: const DeliveryAddress(
        fullName: 'Aruzhan',
        phone: '+77011234567',
        city: 'Almaty',
        street: 'Abay 10',
      ),
      paymentMethod: PaymentMethod.kaspi,
      subtotal: 4000,
      delivery: 990,
      placedAt: DateTime(2026, 9, 27),
    );

    test('totals and counts', () {
      expect(order.total, 4990);
      expect(order.itemCount, 2);
      expect(order.lines.single.lineTotal, 4000);
    });

    test('has a short human reference', () {
      expect(order.reference, 'HC-4F2A91');
    });

    test('the tracking timeline knows where it is', () {
      expect(OrderStatus.placed.step, 0);
      expect(OrderStatus.shipped.step, 2);
      expect(OrderStatus.delivered.step, 3);
      expect(OrderStatus.cancelled.step, isNull);
      expect(OrderStatus.placed.isOpen, isTrue);
      expect(OrderStatus.delivered.isOpen, isFalse);
    });

    test('survives a JSON round trip', () {
      expect(Order.fromJson(order.toJson()), order);
    });
  });
}
