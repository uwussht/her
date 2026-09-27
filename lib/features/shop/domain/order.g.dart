// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryAddress _$DeliveryAddressFromJson(Map<String, dynamic> json) =>
    _DeliveryAddress(
      fullName: json['fullName'] as String,
      phone: json['phone'] as String,
      city: json['city'] as String,
      street: json['street'] as String,
      apartment: json['apartment'] as String?,
      postalCode: json['postalCode'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$DeliveryAddressToJson(_DeliveryAddress instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phone': instance.phone,
      'city': instance.city,
      'street': instance.street,
      'apartment': instance.apartment,
      'postalCode': instance.postalCode,
      'comment': instance.comment,
    };

_OrderLine _$OrderLineFromJson(Map<String, dynamic> json) => _OrderLine(
  productId: json['productId'] as String,
  title: const LocalizedTextConverter().fromJson(
    json['title'] as Map<String, dynamic>,
  ),
  unitPrice: (json['unitPrice'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$OrderLineToJson(_OrderLine instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'title': const LocalizedTextConverter().toJson(instance.title),
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
    };

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String,
  lines: (json['lines'] as List<dynamic>)
      .map((e) => OrderLine.fromJson(e as Map<String, dynamic>))
      .toList(),
  address: DeliveryAddress.fromJson(json['address'] as Map<String, dynamic>),
  paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
  subtotal: (json['subtotal'] as num).toInt(),
  delivery: (json['delivery'] as num).toInt(),
  placedAt: DateTime.parse(json['placedAt'] as String),
  status:
      $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
      OrderStatus.placed,
  paymentReference: json['paymentReference'] as String?,
  estimatedDelivery: json['estimatedDelivery'] == null
      ? null
      : DateTime.parse(json['estimatedDelivery'] as String),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'lines': instance.lines.map((e) => e.toJson()).toList(),
  'address': instance.address.toJson(),
  'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'subtotal': instance.subtotal,
  'delivery': instance.delivery,
  'placedAt': instance.placedAt.toIso8601String(),
  'status': _$OrderStatusEnumMap[instance.status]!,
  'paymentReference': instance.paymentReference,
  'estimatedDelivery': instance.estimatedDelivery?.toIso8601String(),
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.kaspi: 'kaspi',
  PaymentMethod.card: 'card',
  PaymentMethod.cashOnDelivery: 'cashOnDelivery',
};

const _$OrderStatusEnumMap = {
  OrderStatus.placed: 'placed',
  OrderStatus.packing: 'packing',
  OrderStatus.shipped: 'shipped',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};
