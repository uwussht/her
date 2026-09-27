// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Subscription {

 String get id; String get productId; BoxCadence get cadence; DateTime get startedAt; DateTime get nextDelivery; bool get active; int get deliveriesMade;
/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionCopyWith<Subscription> get copyWith => _$SubscriptionCopyWithImpl<Subscription>(this as Subscription, _$identity);

  /// Serializes this Subscription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Subscription;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subscription&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.cadence, _this.cadence) || other.cadence == _this.cadence)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.nextDelivery, _this.nextDelivery) || other.nextDelivery == _this.nextDelivery)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.deliveriesMade, _this.deliveriesMade) || other.deliveriesMade == _this.deliveriesMade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Subscription;
  return Object.hash(runtimeType,_this.id,_this.productId,_this.cadence,_this.startedAt,_this.nextDelivery,_this.active,_this.deliveriesMade);
}

@override
String toString() {
  final _this = this as Subscription;
  return 'Subscription(id: ${_this.id}, productId: ${_this.productId}, cadence: ${_this.cadence}, startedAt: ${_this.startedAt}, nextDelivery: ${_this.nextDelivery}, active: ${_this.active}, deliveriesMade: ${_this.deliveriesMade})';
}


}

/// @nodoc
abstract mixin class $SubscriptionCopyWith<$Res>  {
  factory $SubscriptionCopyWith(Subscription value, $Res Function(Subscription) _then) = _$SubscriptionCopyWithImpl;
@useResult
$Res call({
 String id, String productId, BoxCadence cadence, DateTime startedAt, DateTime nextDelivery, bool active, int deliveriesMade
});




}
/// @nodoc
class _$SubscriptionCopyWithImpl<$Res>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._self, this._then);

  final Subscription _self;
  final $Res Function(Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? cadence = null,Object? startedAt = null,Object? nextDelivery = null,Object? active = null,Object? deliveriesMade = null,}) {
  return _then(Subscription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,cadence: null == cadence ? _self.cadence : cadence // ignore: cast_nullable_to_non_nullable
as BoxCadence,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,nextDelivery: null == nextDelivery ? _self.nextDelivery : nextDelivery // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,deliveriesMade: null == deliveriesMade ? _self.deliveriesMade : deliveriesMade // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Subscription].
extension SubscriptionPatterns on Subscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Subscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Subscription value)  $default,){
final _that = this;
switch (_that) {
case _Subscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Subscription value)?  $default,){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  BoxCadence cadence,  DateTime startedAt,  DateTime nextDelivery,  bool active,  int deliveriesMade)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.id,_that.productId,_that.cadence,_that.startedAt,_that.nextDelivery,_that.active,_that.deliveriesMade);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  BoxCadence cadence,  DateTime startedAt,  DateTime nextDelivery,  bool active,  int deliveriesMade)  $default,) {final _that = this;
switch (_that) {
case _Subscription():
return $default(_that.id,_that.productId,_that.cadence,_that.startedAt,_that.nextDelivery,_that.active,_that.deliveriesMade);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  BoxCadence cadence,  DateTime startedAt,  DateTime nextDelivery,  bool active,  int deliveriesMade)?  $default,) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.id,_that.productId,_that.cadence,_that.startedAt,_that.nextDelivery,_that.active,_that.deliveriesMade);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Subscription extends Subscription {
  const _Subscription({required this.id, required this.productId, required this.cadence, required this.startedAt, required this.nextDelivery, this.active = true, this.deliveriesMade = 0}): super._();
  factory _Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);

@override final  String id;
@override final  String productId;
@override final  BoxCadence cadence;
@override final  DateTime startedAt;
@override final  DateTime nextDelivery;
@override@JsonKey() final  bool active;
@override@JsonKey() final  int deliveriesMade;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionCopyWith<_Subscription> get copyWith => __$SubscriptionCopyWithImpl<_Subscription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscription&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.cadence, cadence) || other.cadence == cadence)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.nextDelivery, nextDelivery) || other.nextDelivery == nextDelivery)&&(identical(other.active, active) || other.active == active)&&(identical(other.deliveriesMade, deliveriesMade) || other.deliveriesMade == deliveriesMade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,productId,cadence,startedAt,nextDelivery,active,deliveriesMade);
}

@override
String toString() {
    return 'Subscription(id: $id, productId: $productId, cadence: $cadence, startedAt: $startedAt, nextDelivery: $nextDelivery, active: $active, deliveriesMade: $deliveriesMade)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionCopyWith<$Res> implements $SubscriptionCopyWith<$Res> {
  factory _$SubscriptionCopyWith(_Subscription value, $Res Function(_Subscription) _then) = __$SubscriptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, BoxCadence cadence, DateTime startedAt, DateTime nextDelivery, bool active, int deliveriesMade
});




}
/// @nodoc
class __$SubscriptionCopyWithImpl<$Res>
    implements _$SubscriptionCopyWith<$Res> {
  __$SubscriptionCopyWithImpl(this._self, this._then);

  final _Subscription _self;
  final $Res Function(_Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? cadence = null,Object? startedAt = null,Object? nextDelivery = null,Object? active = null,Object? deliveriesMade = null,}) {
  return _then(_Subscription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,cadence: null == cadence ? _self.cadence : cadence // ignore: cast_nullable_to_non_nullable
as BoxCadence,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,nextDelivery: null == nextDelivery ? _self.nextDelivery : nextDelivery // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,deliveriesMade: null == deliveriesMade ? _self.deliveriesMade : deliveriesMade // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
