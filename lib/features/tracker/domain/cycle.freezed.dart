// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cycle {

 String get id; DateTime get startDate; DateTime? get periodEndDate;
/// Create a copy of Cycle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CycleCopyWith<Cycle> get copyWith => _$CycleCopyWithImpl<Cycle>(this as Cycle, _$identity);

  /// Serializes this Cycle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Cycle;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cycle&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.periodEndDate, _this.periodEndDate) || other.periodEndDate == _this.periodEndDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Cycle;
  return Object.hash(runtimeType,_this.id,_this.startDate,_this.periodEndDate);
}

@override
String toString() {
  final _this = this as Cycle;
  return 'Cycle(id: ${_this.id}, startDate: ${_this.startDate}, periodEndDate: ${_this.periodEndDate})';
}


}

/// @nodoc
abstract mixin class $CycleCopyWith<$Res>  {
  factory $CycleCopyWith(Cycle value, $Res Function(Cycle) _then) = _$CycleCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startDate, DateTime? periodEndDate
});




}
/// @nodoc
class _$CycleCopyWithImpl<$Res>
    implements $CycleCopyWith<$Res> {
  _$CycleCopyWithImpl(this._self, this._then);

  final Cycle _self;
  final $Res Function(Cycle) _then;

/// Create a copy of Cycle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startDate = null,Object? periodEndDate = freezed,}) {
  return _then(Cycle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,periodEndDate: freezed == periodEndDate ? _self.periodEndDate : periodEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Cycle].
extension CyclePatterns on Cycle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cycle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cycle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cycle value)  $default,){
final _that = this;
switch (_that) {
case _Cycle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cycle value)?  $default,){
final _that = this;
switch (_that) {
case _Cycle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime startDate,  DateTime? periodEndDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cycle() when $default != null:
return $default(_that.id,_that.startDate,_that.periodEndDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime startDate,  DateTime? periodEndDate)  $default,) {final _that = this;
switch (_that) {
case _Cycle():
return $default(_that.id,_that.startDate,_that.periodEndDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime startDate,  DateTime? periodEndDate)?  $default,) {final _that = this;
switch (_that) {
case _Cycle() when $default != null:
return $default(_that.id,_that.startDate,_that.periodEndDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cycle extends Cycle {
  const _Cycle({required this.id, required this.startDate, this.periodEndDate}): super._();
  factory _Cycle.fromJson(Map<String, dynamic> json) => _$CycleFromJson(json);

@override final  String id;
@override final  DateTime startDate;
@override final  DateTime? periodEndDate;

/// Create a copy of Cycle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CycleCopyWith<_Cycle> get copyWith => __$CycleCopyWithImpl<_Cycle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CycleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cycle&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.periodEndDate, periodEndDate) || other.periodEndDate == periodEndDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startDate,periodEndDate);
}

@override
String toString() {
    return 'Cycle(id: $id, startDate: $startDate, periodEndDate: $periodEndDate)';
}


}

/// @nodoc
abstract mixin class _$CycleCopyWith<$Res> implements $CycleCopyWith<$Res> {
  factory _$CycleCopyWith(_Cycle value, $Res Function(_Cycle) _then) = __$CycleCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startDate, DateTime? periodEndDate
});




}
/// @nodoc
class __$CycleCopyWithImpl<$Res>
    implements _$CycleCopyWith<$Res> {
  __$CycleCopyWithImpl(this._self, this._then);

  final _Cycle _self;
  final $Res Function(_Cycle) _then;

/// Create a copy of Cycle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? periodEndDate = freezed,}) {
  return _then(_Cycle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,periodEndDate: freezed == periodEndDate ? _self.periodEndDate : periodEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
