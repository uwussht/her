// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Seller {

 String get id; String get name;/// Kazakhstan brand: surfaced with a "local brand" badge.
 bool get isLocalBrand; double get rating; String? get city;
/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerCopyWith<Seller> get copyWith => _$SellerCopyWithImpl<Seller>(this as Seller, _$identity);

  /// Serializes this Seller to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Seller;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seller&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.isLocalBrand, _this.isLocalBrand) || other.isLocalBrand == _this.isLocalBrand)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.city, _this.city) || other.city == _this.city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Seller;
  return Object.hash(runtimeType,_this.id,_this.name,_this.isLocalBrand,_this.rating,_this.city);
}

@override
String toString() {
  final _this = this as Seller;
  return 'Seller(id: ${_this.id}, name: ${_this.name}, isLocalBrand: ${_this.isLocalBrand}, rating: ${_this.rating}, city: ${_this.city})';
}


}

/// @nodoc
abstract mixin class $SellerCopyWith<$Res>  {
  factory $SellerCopyWith(Seller value, $Res Function(Seller) _then) = _$SellerCopyWithImpl;
@useResult
$Res call({
 String id, String name, bool isLocalBrand, double rating, String? city
});




}
/// @nodoc
class _$SellerCopyWithImpl<$Res>
    implements $SellerCopyWith<$Res> {
  _$SellerCopyWithImpl(this._self, this._then);

  final Seller _self;
  final $Res Function(Seller) _then;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? isLocalBrand = null,Object? rating = null,Object? city = freezed,}) {
  return _then(Seller(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isLocalBrand: null == isLocalBrand ? _self.isLocalBrand : isLocalBrand // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Seller].
extension SellerPatterns on Seller {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Seller value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Seller() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Seller value)  $default,){
final _that = this;
switch (_that) {
case _Seller():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Seller value)?  $default,){
final _that = this;
switch (_that) {
case _Seller() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  bool isLocalBrand,  double rating,  String? city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seller() when $default != null:
return $default(_that.id,_that.name,_that.isLocalBrand,_that.rating,_that.city);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  bool isLocalBrand,  double rating,  String? city)  $default,) {final _that = this;
switch (_that) {
case _Seller():
return $default(_that.id,_that.name,_that.isLocalBrand,_that.rating,_that.city);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  bool isLocalBrand,  double rating,  String? city)?  $default,) {final _that = this;
switch (_that) {
case _Seller() when $default != null:
return $default(_that.id,_that.name,_that.isLocalBrand,_that.rating,_that.city);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Seller implements Seller {
  const _Seller({required this.id, required this.name, this.isLocalBrand = false, this.rating = 0, this.city});
  factory _Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);

@override final  String id;
@override final  String name;
/// Kazakhstan brand: surfaced with a "local brand" badge.
@override@JsonKey() final  bool isLocalBrand;
@override@JsonKey() final  double rating;
@override final  String? city;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerCopyWith<_Seller> get copyWith => __$SellerCopyWithImpl<_Seller>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isLocalBrand, isLocalBrand) || other.isLocalBrand == isLocalBrand)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,isLocalBrand,rating,city);
}

@override
String toString() {
    return 'Seller(id: $id, name: $name, isLocalBrand: $isLocalBrand, rating: $rating, city: $city)';
}


}

/// @nodoc
abstract mixin class _$SellerCopyWith<$Res> implements $SellerCopyWith<$Res> {
  factory _$SellerCopyWith(_Seller value, $Res Function(_Seller) _then) = __$SellerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, bool isLocalBrand, double rating, String? city
});




}
/// @nodoc
class __$SellerCopyWithImpl<$Res>
    implements _$SellerCopyWith<$Res> {
  __$SellerCopyWithImpl(this._self, this._then);

  final _Seller _self;
  final $Res Function(_Seller) _then;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? isLocalBrand = null,Object? rating = null,Object? city = freezed,}) {
  return _then(_Seller(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isLocalBrand: null == isLocalBrand ? _self.isLocalBrand : isLocalBrand // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
