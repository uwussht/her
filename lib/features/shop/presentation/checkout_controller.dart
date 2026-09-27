import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/utils/date_utils.dart';
import '../domain/cart.dart';
import '../domain/order.dart';
import '../domain/payment_service.dart';
import '../domain/product.dart';
import 'shop_providers.dart';

part 'checkout_controller.g.dart';

const _uuid = Uuid();

/// Where checkout has got to.
enum CheckoutStep { address, payment }

/// Checkout in progress.
@immutable
class CheckoutState {
  const CheckoutState({
    this.step = CheckoutStep.address,
    this.address,
    this.method = PaymentMethod.kaspi,
    this.isPaying = false,
    this.failure,
  });

  final CheckoutStep step;
  final DeliveryAddress? address;
  final PaymentMethod method;
  final bool isPaying;

  /// Set when the last attempt failed, so the UI can explain why.
  final PaymentFailureReason? failure;

  CheckoutState copyWith({
    CheckoutStep? step,
    DeliveryAddress? address,
    PaymentMethod? method,
    bool? isPaying,
    PaymentFailureReason? failure,
    bool clearFailure = false,
  }) {
    return CheckoutState(
      step: step ?? this.step,
      address: address ?? this.address,
      method: method ?? this.method,
      isPaying: isPaying ?? this.isPaying,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }
}

/// Drives checkout: address, payment method, then placing the order.
@riverpod
class CheckoutController extends _$CheckoutController {
  @override
  CheckoutState build() {
    // Prefill from the last order so she does not retype her address.
    final last = ref.watch(orderRepositoryProvider).readLastAddress();
    return CheckoutState(address: last);
  }

  void setAddress(DeliveryAddress address) => state = state.copyWith(
    address: address,
    step: CheckoutStep.payment,
    clearFailure: true,
  );

  void setMethod(PaymentMethod method) =>
      state = state.copyWith(method: method, clearFailure: true);

  /// Reports card details the app itself can reject, so tapping Pay never
  /// does nothing at all.
  void reportInvalidCard() =>
      state = state.copyWith(failure: PaymentFailureReason.invalidCard);

  void backToAddress() =>
      state = state.copyWith(step: CheckoutStep.address, clearFailure: true);

  /// Charges and places the order. Returns the order on success, or null
  /// when payment failed; the reason is in [CheckoutState.failure].
  Future<Order?> placeOrder({CardDetails? card}) async {
    final address = state.address;
    final cart = ref.read(cartControllerProvider);
    final catalogue = ref.read(productsByIdProvider);
    if (address == null || cart.isEmpty) return null;

    state = state.copyWith(isPaying: true, clearFailure: true);
    final orderId = _uuid.v4();
    final totals = ref.read(cartTotalsProvider);

    final result = await ref
        .read(paymentServiceProvider)
        .pay(
          method: state.method,
          amount: totals.total,
          orderId: orderId,
          card: card,
        );

    if (result case PaymentFailed(:final reason)) {
      state = state.copyWith(isPaying: false, failure: reason);
      return null;
    }

    final order = Order(
      id: orderId,
      lines: _linesFor(cart, catalogue),
      address: address,
      paymentMethod: state.method,
      subtotal: totals.subtotal,
      delivery: totals.delivery,
      placedAt: DateTime.now(),
      paymentReference: (result as PaymentSucceeded).reference,
      estimatedDelivery: today().addDays(Order.deliveryDays),
    );

    await ref.read(ordersControllerProvider.notifier).add(order);
    await ref.read(orderRepositoryProvider).saveLastAddress(address);
    await ref.read(cartControllerProvider.notifier).clear();
    state = state.copyWith(isPaying: false);
    return order;
  }

  /// Prices are snapshotted, so the receipt never changes with the catalogue.
  static List<OrderLine> _linesFor(Cart cart, Map<String, Product> catalogue) {
    return [
      for (final line in cart.lines)
        if (catalogue[line.productId] case final product?)
          OrderLine(
            productId: product.id,
            title: product.title,
            unitPrice: product.price,
            quantity: line.quantity,
          ),
    ];
  }
}
