// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weight_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeightEntry {

 DateTime get date; double get kg;
/// Create a copy of WeightEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeightEntryCopyWith<WeightEntry> get copyWith => _$WeightEntryCopyWithImpl<WeightEntry>(this as WeightEntry, _$identity);

  /// Serializes this WeightEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WeightEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeightEntry&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.kg, _this.kg) || other.kg == _this.kg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeightEntry;
  return Object.hash(runtimeType,_this.date,_this.kg);
}

@override
String toString() {
  final _this = this as WeightEntry;
  return 'WeightEntry(date: ${_this.date}, kg: ${_this.kg})';
}


}

/// @nodoc
abstract mixin class $WeightEntryCopyWith<$Res>  {
  factory $WeightEntryCopyWith(WeightEntry value, $Res Function(WeightEntry) _then) = _$WeightEntryCopyWithImpl;
@useResult
$Res call({
 DateTime date, double kg
});




}
/// @nodoc
class _$WeightEntryCopyWithImpl<$Res>
    implements $WeightEntryCopyWith<$Res> {
  _$WeightEntryCopyWithImpl(this._self, this._then);

  final WeightEntry _self;
  final $Res Function(WeightEntry) _then;

/// Create a copy of WeightEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? kg = null,}) {
  return _then(WeightEntry(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,kg: null == kg ? _self.kg : kg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [WeightEntry].
extension WeightEntryPatterns on WeightEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeightEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeightEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeightEntry value)  $default,){
final _that = this;
switch (_that) {
case _WeightEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeightEntry value)?  $default,){
final _that = this;
switch (_that) {
case _WeightEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double kg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeightEntry() when $default != null:
return $default(_that.date,_that.kg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double kg)  $default,) {final _that = this;
switch (_that) {
case _WeightEntry():
return $default(_that.date,_that.kg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double kg)?  $default,) {final _that = this;
switch (_that) {
case _WeightEntry() when $default != null:
return $default(_that.date,_that.kg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeightEntry extends WeightEntry {
  const _WeightEntry({required this.date, required this.kg}): super._();
  factory _WeightEntry.fromJson(Map<String, dynamic> json) => _$WeightEntryFromJson(json);

@override final  DateTime date;
@override final  double kg;

/// Create a copy of WeightEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeightEntryCopyWith<_WeightEntry> get copyWith => __$WeightEntryCopyWithImpl<_WeightEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeightEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeightEntry&&(identical(other.date, date) || other.date == date)&&(identical(other.kg, kg) || other.kg == kg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,kg);
}

@override
String toString() {
    return 'WeightEntry(date: $date, kg: $kg)';
}


}

/// @nodoc
abstract mixin class _$WeightEntryCopyWith<$Res> implements $WeightEntryCopyWith<$Res> {
  factory _$WeightEntryCopyWith(_WeightEntry value, $Res Function(_WeightEntry) _then) = __$WeightEntryCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double kg
});




}
/// @nodoc
class __$WeightEntryCopyWithImpl<$Res>
    implements _$WeightEntryCopyWith<$Res> {
  __$WeightEntryCopyWithImpl(this._self, this._then);

  final _WeightEntry _self;
  final $Res Function(_WeightEntry) _then;

/// Create a copy of WeightEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? kg = null,}) {
  return _then(_WeightEntry(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,kg: null == kg ? _self.kg : kg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
