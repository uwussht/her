import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/l10n/localized_text.dart';

part 'order.freezed.dart';
part 'order.g.dart';

/// How she pays. Kaspi is the dominant wallet in Kazakhstan.
enum PaymentMethod {
  kaspi,
  card,
  cashOnDelivery;

  /// Whether card details have to be collected.
  bool get needsCardDetails => this == PaymentMethod.card;
}

/// Where the order goes.
@freezed
abstract class DeliveryAddress with _$DeliveryAddress {
  const factory DeliveryAddress({
    required String fullName,
    required String phone,
    required String city,
    required String street,
    String? apartment,
    String? postalCode,
    String? comment,
  }) = _DeliveryAddress;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressFromJson(json);
}

/// Where an order has got to.
enum OrderStatus {
  placed,
  packing,
  shipped,
  delivered,
  cancelled;

  /// The tracking timeline, in order. Cancelled is not part of it.
  static const List<OrderStatus> timeline = [
    OrderStatus.placed,
    OrderStatus.packing,
    OrderStatus.shipped,
    OrderStatus.delivered,
  ];

  bool get isOpen =>
      this != OrderStatus.delivered && this != OrderStatus.cancelled;

  /// 0-based position in [timeline], or null when cancelled.
  int? get step =>
      this == OrderStatus.cancelled ? null : timeline.indexOf(this);
}

/// A priced line, snapshotted at checkout so the receipt never changes when
/// the catalogue does.
@freezed
abstract class OrderLine with _$OrderLine {
  const factory OrderLine({
    required String productId,
    @LocalizedTextConverter() required LocalizedText title,
    required int unitPrice,
    required int quantity,
  }) = _OrderLine;

  const OrderLine._();

  factory OrderLine.fromJson(Map<String, dynamic> json) =>
      _$OrderLineFromJson(json);

  int get lineTotal => unitPrice * quantity;
}

/// A placed order.
@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    required List<OrderLine> lines,
    required DeliveryAddress address,
    required PaymentMethod paymentMethod,
    required int subtotal,
    required int delivery,
    required DateTime placedAt,
    @Default(OrderStatus.placed) OrderStatus status,

    /// Reference returned by the payment provider.
    String? paymentReference,
    DateTime? estimatedDelivery,
  }) = _Order;

  const Order._();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  /// Working days the courier usually takes in Kazakhstan.
  static const int deliveryDays = 3;

  int get total => subtotal + delivery;

  int get itemCount => lines.fold(0, (sum, line) => sum + line.quantity);

  /// Short human reference, e.g. `HC-4F2A91`.
  String get reference =>
      'HC-${id.replaceAll('-', '').substring(0, 6).toUpperCase()}';
}

abstract interface class OrderRepository {
  List<Order> readAll();

  Future<void> save(Order order);

  /// Last address used, to prefill checkout.
  DeliveryAddress? readLastAddress();

  Future<void> saveLastAddress(DeliveryAddress address);
}
