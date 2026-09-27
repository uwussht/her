// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryAddress {

 String get fullName; String get phone; String get city; String get street; String? get apartment; String? get postalCode; String? get comment;
/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<DeliveryAddress> get copyWith => _$DeliveryAddressCopyWithImpl<DeliveryAddress>(this as DeliveryAddress, _$identity);

  /// Serializes this DeliveryAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DeliveryAddress;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAddress&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.street, _this.street) || other.street == _this.street)&&(identical(other.apartment, _this.apartment) || other.apartment == _this.apartment)&&(identical(other.postalCode, _this.postalCode) || other.postalCode == _this.postalCode)&&(identical(other.comment, _this.comment) || other.comment == _this.comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DeliveryAddress;
  return Object.hash(runtimeType,_this.fullName,_this.phone,_this.city,_this.street,_this.apartment,_this.postalCode,_this.comment);
}

@override
String toString() {
  final _this = this as DeliveryAddress;
  return 'DeliveryAddress(fullName: ${_this.fullName}, phone: ${_this.phone}, city: ${_this.city}, street: ${_this.street}, apartment: ${_this.apartment}, postalCode: ${_this.postalCode}, comment: ${_this.comment})';
}


}

/// @nodoc
abstract mixin class $DeliveryAddressCopyWith<$Res>  {
  factory $DeliveryAddressCopyWith(DeliveryAddress value, $Res Function(DeliveryAddress) _then) = _$DeliveryAddressCopyWithImpl;
@useResult
$Res call({
 String fullName, String phone, String city, String street, String? apartment, String? postalCode, String? comment
});




}
/// @nodoc
class _$DeliveryAddressCopyWithImpl<$Res>
    implements $DeliveryAddressCopyWith<$Res> {
  _$DeliveryAddressCopyWithImpl(this._self, this._then);

  final DeliveryAddress _self;
  final $Res Function(DeliveryAddress) _then;

/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? phone = null,Object? city = null,Object? street = null,Object? apartment = freezed,Object? postalCode = freezed,Object? comment = freezed,}) {
  return _then(DeliveryAddress(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,apartment: freezed == apartment ? _self.apartment : apartment // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryAddress].
extension DeliveryAddressPatterns on DeliveryAddress {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryAddress value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryAddress():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryAddress value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String phone,  String city,  String street,  String? apartment,  String? postalCode,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
return $default(_that.fullName,_that.phone,_that.city,_that.street,_that.apartment,_that.postalCode,_that.comment);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String phone,  String city,  String street,  String? apartment,  String? postalCode,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _DeliveryAddress():
return $default(_that.fullName,_that.phone,_that.city,_that.street,_that.apartment,_that.postalCode,_that.comment);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String phone,  String city,  String street,  String? apartment,  String? postalCode,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
return $default(_that.fullName,_that.phone,_that.city,_that.street,_that.apartment,_that.postalCode,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryAddress implements DeliveryAddress {
  const _DeliveryAddress({required this.fullName, required this.phone, required this.city, required this.street, this.apartment, this.postalCode, this.comment});
  factory _DeliveryAddress.fromJson(Map<String, dynamic> json) => _$DeliveryAddressFromJson(json);

@override final  String fullName;
@override final  String phone;
@override final  String city;
@override final  String street;
@override final  String? apartment;
@override final  String? postalCode;
@override final  String? comment;

/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryAddressCopyWith<_DeliveryAddress> get copyWith => __$DeliveryAddressCopyWithImpl<_DeliveryAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryAddressToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryAddress&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.city, city) || other.city == city)&&(identical(other.street, street) || other.street == street)&&(identical(other.apartment, apartment) || other.apartment == apartment)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fullName,phone,city,street,apartment,postalCode,comment);
}

@override
String toString() {
    return 'DeliveryAddress(fullName: $fullName, phone: $phone, city: $city, street: $street, apartment: $apartment, postalCode: $postalCode, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$DeliveryAddressCopyWith<$Res> implements $DeliveryAddressCopyWith<$Res> {
  factory _$DeliveryAddressCopyWith(_DeliveryAddress value, $Res Function(_DeliveryAddress) _then) = __$DeliveryAddressCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String phone, String city, String street, String? apartment, String? postalCode, String? comment
});




}
/// @nodoc
class __$DeliveryAddressCopyWithImpl<$Res>
    implements _$DeliveryAddressCopyWith<$Res> {
  __$DeliveryAddressCopyWithImpl(this._self, this._then);

  final _DeliveryAddress _self;
  final $Res Function(_DeliveryAddress) _then;

/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? phone = null,Object? city = null,Object? street = null,Object? apartment = freezed,Object? postalCode = freezed,Object? comment = freezed,}) {
  return _then(_DeliveryAddress(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,apartment: freezed == apartment ? _self.apartment : apartment // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderLine {

 String get productId;@LocalizedTextConverter() LocalizedText get title; int get unitPrice; int get quantity;
/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineCopyWith<OrderLine> get copyWith => _$OrderLineCopyWithImpl<OrderLine>(this as OrderLine, _$identity);

  /// Serializes this OrderLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLine&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderLine;
  return Object.hash(runtimeType,_this.productId,_this.title,_this.unitPrice,_this.quantity);
}

@override
String toString() {
  final _this = this as OrderLine;
  return 'OrderLine(productId: ${_this.productId}, title: ${_this.title}, unitPrice: ${_this.unitPrice}, quantity: ${_this.quantity})';
}


}

/// @nodoc
abstract mixin class $OrderLineCopyWith<$Res>  {
  factory $OrderLineCopyWith(OrderLine value, $Res Function(OrderLine) _then) = _$OrderLineCopyWithImpl;
@useResult
$Res call({
 String productId,@LocalizedTextConverter() LocalizedText title, int unitPrice, int quantity
});




}
/// @nodoc
class _$OrderLineCopyWithImpl<$Res>
    implements $OrderLineCopyWith<$Res> {
  _$OrderLineCopyWithImpl(this._self, this._then);

  final OrderLine _self;
  final $Res Function(OrderLine) _then;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? title = null,Object? unitPrice = null,Object? quantity = null,}) {
  return _then(OrderLine(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderLine].
extension OrderLinePatterns on OrderLine {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLine value)  $default,){
final _that = this;
switch (_that) {
case _OrderLine():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLine value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId, @LocalizedTextConverter()  LocalizedText title,  int unitPrice,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that.productId,_that.title,_that.unitPrice,_that.quantity);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId, @LocalizedTextConverter()  LocalizedText title,  int unitPrice,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _OrderLine():
return $default(_that.productId,_that.title,_that.unitPrice,_that.quantity);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId, @LocalizedTextConverter()  LocalizedText title,  int unitPrice,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that.productId,_that.title,_that.unitPrice,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderLine extends OrderLine {
  const _OrderLine({required this.productId, @LocalizedTextConverter() required this.title, required this.unitPrice, required this.quantity}): super._();
  factory _OrderLine.fromJson(Map<String, dynamic> json) => _$OrderLineFromJson(json);

@override final  String productId;
@override@LocalizedTextConverter() final  LocalizedText title;
@override final  int unitPrice;
@override final  int quantity;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineCopyWith<_OrderLine> get copyWith => __$OrderLineCopyWithImpl<_OrderLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLine&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.title, title) || other.title == title)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,productId,title,unitPrice,quantity);
}

@override
String toString() {
    return 'OrderLine(productId: $productId, title: $title, unitPrice: $unitPrice, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$OrderLineCopyWith<$Res> implements $OrderLineCopyWith<$Res> {
  factory _$OrderLineCopyWith(_OrderLine value, $Res Function(_OrderLine) _then) = __$OrderLineCopyWithImpl;
@override @useResult
$Res call({
 String productId,@LocalizedTextConverter() LocalizedText title, int unitPrice, int quantity
});




}
/// @nodoc
class __$OrderLineCopyWithImpl<$Res>
    implements _$OrderLineCopyWith<$Res> {
  __$OrderLineCopyWithImpl(this._self, this._then);

  final _OrderLine _self;
  final $Res Function(_OrderLine) _then;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? title = null,Object? unitPrice = null,Object? quantity = null,}) {
  return _then(_OrderLine(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Order {

 String get id; List<OrderLine> get lines; DeliveryAddress get address; PaymentMethod get paymentMethod; int get subtotal; int get delivery; DateTime get placedAt; OrderStatus get status;/// Reference returned by the payment provider.
 String? get paymentReference; DateTime? get estimatedDelivery;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Order;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.paymentMethod, _this.paymentMethod) || other.paymentMethod == _this.paymentMethod)&&(identical(other.subtotal, _this.subtotal) || other.subtotal == _this.subtotal)&&(identical(other.delivery, _this.delivery) || other.delivery == _this.delivery)&&(identical(other.placedAt, _this.placedAt) || other.placedAt == _this.placedAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.paymentReference, _this.paymentReference) || other.paymentReference == _this.paymentReference)&&(identical(other.estimatedDelivery, _this.estimatedDelivery) || other.estimatedDelivery == _this.estimatedDelivery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Order;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.lines),_this.address,_this.paymentMethod,_this.subtotal,_this.delivery,_this.placedAt,_this.status,_this.paymentReference,_this.estimatedDelivery);
}

@override
String toString() {
  final _this = this as Order;
  return 'Order(id: ${_this.id}, lines: ${_this.lines}, address: ${_this.address}, paymentMethod: ${_this.paymentMethod}, subtotal: ${_this.subtotal}, delivery: ${_this.delivery}, placedAt: ${_this.placedAt}, status: ${_this.status}, paymentReference: ${_this.paymentReference}, estimatedDelivery: ${_this.estimatedDelivery})';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, List<OrderLine> lines, DeliveryAddress address, PaymentMethod paymentMethod, int subtotal, int delivery, DateTime placedAt, OrderStatus status, String? paymentReference, DateTime? estimatedDelivery
});


$DeliveryAddressCopyWith<$Res> get address;

}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lines = null,Object? address = null,Object? paymentMethod = null,Object? subtotal = null,Object? delivery = null,Object? placedAt = null,Object? status = null,Object? paymentReference = freezed,Object? estimatedDelivery = freezed,}) {
  return _then(Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,paymentReference: freezed == paymentReference ? _self.paymentReference : paymentReference // ignore: cast_nullable_to_non_nullable
as String?,estimatedDelivery: freezed == estimatedDelivery ? _self.estimatedDelivery : estimatedDelivery // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res> get address {
  
  return $DeliveryAddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<OrderLine> lines,  DeliveryAddress address,  PaymentMethod paymentMethod,  int subtotal,  int delivery,  DateTime placedAt,  OrderStatus status,  String? paymentReference,  DateTime? estimatedDelivery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.lines,_that.address,_that.paymentMethod,_that.subtotal,_that.delivery,_that.placedAt,_that.status,_that.paymentReference,_that.estimatedDelivery);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<OrderLine> lines,  DeliveryAddress address,  PaymentMethod paymentMethod,  int subtotal,  int delivery,  DateTime placedAt,  OrderStatus status,  String? paymentReference,  DateTime? estimatedDelivery)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.lines,_that.address,_that.paymentMethod,_that.subtotal,_that.delivery,_that.placedAt,_that.status,_that.paymentReference,_that.estimatedDelivery);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<OrderLine> lines,  DeliveryAddress address,  PaymentMethod paymentMethod,  int subtotal,  int delivery,  DateTime placedAt,  OrderStatus status,  String? paymentReference,  DateTime? estimatedDelivery)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.lines,_that.address,_that.paymentMethod,_that.subtotal,_that.delivery,_that.placedAt,_that.status,_that.paymentReference,_that.estimatedDelivery);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order extends Order {
  const _Order({required this.id, required  List<OrderLine> lines, required this.address, required this.paymentMethod, required this.subtotal, required this.delivery, required this.placedAt, this.status = OrderStatus.placed, this.paymentReference, this.estimatedDelivery}): _lines = lines,super._();
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  String id;
 final  List<OrderLine> _lines;
@override List<OrderLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override final  DeliveryAddress address;
@override final  PaymentMethod paymentMethod;
@override final  int subtotal;
@override final  int delivery;
@override final  DateTime placedAt;
@override@JsonKey() final  OrderStatus status;
/// Reference returned by the payment provider.
@override final  String? paymentReference;
@override final  DateTime? estimatedDelivery;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.address, address) || other.address == address)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentReference, paymentReference) || other.paymentReference == paymentReference)&&(identical(other.estimatedDelivery, estimatedDelivery) || other.estimatedDelivery == estimatedDelivery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_lines),address,paymentMethod,subtotal,delivery,placedAt,status,paymentReference,estimatedDelivery);
}

@override
String toString() {
    return 'Order(id: $id, lines: $lines, address: $address, paymentMethod: $paymentMethod, subtotal: $subtotal, delivery: $delivery, placedAt: $placedAt, status: $status, paymentReference: $paymentReference, estimatedDelivery: $estimatedDelivery)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, List<OrderLine> lines, DeliveryAddress address, PaymentMethod paymentMethod, int subtotal, int delivery, DateTime placedAt, OrderStatus status, String? paymentReference, DateTime? estimatedDelivery
});


@override $DeliveryAddressCopyWith<$Res> get address;

}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lines = null,Object? address = null,Object? paymentMethod = null,Object? subtotal = null,Object? delivery = null,Object? placedAt = null,Object? status = null,Object? paymentReference = freezed,Object? estimatedDelivery = freezed,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,paymentReference: freezed == paymentReference ? _self.paymentReference : paymentReference // ignore: cast_nullable_to_non_nullable
as String?,estimatedDelivery: freezed == estimatedDelivery ? _self.estimatedDelivery : estimatedDelivery // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res> get address {
  
  return $DeliveryAddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
