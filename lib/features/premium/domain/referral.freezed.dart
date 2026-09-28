// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferralState {

/// Her own code, shown and shared. Derived from her uid so it is stable
/// across reinstalls.
 String get code;/// Friends who signed up with her code.
 int get invitedCount;/// Months already credited to her membership.
 int get rewardedMonths;
/// Create a copy of ReferralState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralStateCopyWith<ReferralState> get copyWith => _$ReferralStateCopyWithImpl<ReferralState>(this as ReferralState, _$identity);

  /// Serializes this ReferralState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReferralState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralState&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.invitedCount, _this.invitedCount) || other.invitedCount == _this.invitedCount)&&(identical(other.rewardedMonths, _this.rewardedMonths) || other.rewardedMonths == _this.rewardedMonths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReferralState;
  return Object.hash(runtimeType,_this.code,_this.invitedCount,_this.rewardedMonths);
}

@override
String toString() {
  final _this = this as ReferralState;
  return 'ReferralState(code: ${_this.code}, invitedCount: ${_this.invitedCount}, rewardedMonths: ${_this.rewardedMonths})';
}


}

/// @nodoc
abstract mixin class $ReferralStateCopyWith<$Res>  {
  factory $ReferralStateCopyWith(ReferralState value, $Res Function(ReferralState) _then) = _$ReferralStateCopyWithImpl;
@useResult
$Res call({
 String code, int invitedCount, int rewardedMonths
});




}
/// @nodoc
class _$ReferralStateCopyWithImpl<$Res>
    implements $ReferralStateCopyWith<$Res> {
  _$ReferralStateCopyWithImpl(this._self, this._then);

  final ReferralState _self;
  final $Res Function(ReferralState) _then;

/// Create a copy of ReferralState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? invitedCount = null,Object? rewardedMonths = null,}) {
  return _then(ReferralState(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,invitedCount: null == invitedCount ? _self.invitedCount : invitedCount // ignore: cast_nullable_to_non_nullable
as int,rewardedMonths: null == rewardedMonths ? _self.rewardedMonths : rewardedMonths // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralState].
extension ReferralStatePatterns on ReferralState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralState value)  $default,){
final _that = this;
switch (_that) {
case _ReferralState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralState value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  int invitedCount,  int rewardedMonths)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralState() when $default != null:
return $default(_that.code,_that.invitedCount,_that.rewardedMonths);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  int invitedCount,  int rewardedMonths)  $default,) {final _that = this;
switch (_that) {
case _ReferralState():
return $default(_that.code,_that.invitedCount,_that.rewardedMonths);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  int invitedCount,  int rewardedMonths)?  $default,) {final _that = this;
switch (_that) {
case _ReferralState() when $default != null:
return $default(_that.code,_that.invitedCount,_that.rewardedMonths);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralState extends ReferralState {
  const _ReferralState({required this.code, this.invitedCount = 0, this.rewardedMonths = 0}): super._();
  factory _ReferralState.fromJson(Map<String, dynamic> json) => _$ReferralStateFromJson(json);

/// Her own code, shown and shared. Derived from her uid so it is stable
/// across reinstalls.
@override final  String code;
/// Friends who signed up with her code.
@override@JsonKey() final  int invitedCount;
/// Months already credited to her membership.
@override@JsonKey() final  int rewardedMonths;

/// Create a copy of ReferralState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralStateCopyWith<_ReferralState> get copyWith => __$ReferralStateCopyWithImpl<_ReferralState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralStateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralState&&(identical(other.code, code) || other.code == code)&&(identical(other.invitedCount, invitedCount) || other.invitedCount == invitedCount)&&(identical(other.rewardedMonths, rewardedMonths) || other.rewardedMonths == rewardedMonths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,invitedCount,rewardedMonths);
}

@override
String toString() {
    return 'ReferralState(code: $code, invitedCount: $invitedCount, rewardedMonths: $rewardedMonths)';
}


}

/// @nodoc
abstract mixin class _$ReferralStateCopyWith<$Res> implements $ReferralStateCopyWith<$Res> {
  factory _$ReferralStateCopyWith(_ReferralState value, $Res Function(_ReferralState) _then) = __$ReferralStateCopyWithImpl;
@override @useResult
$Res call({
 String code, int invitedCount, int rewardedMonths
});




}
/// @nodoc
class __$ReferralStateCopyWithImpl<$Res>
    implements _$ReferralStateCopyWith<$Res> {
  __$ReferralStateCopyWithImpl(this._self, this._then);

  final _ReferralState _self;
  final $Res Function(_ReferralState) _then;

/// Create a copy of ReferralState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? invitedCount = null,Object? rewardedMonths = null,}) {
  return _then(_ReferralState(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,invitedCount: null == invitedCount ? _self.invitedCount : invitedCount // ignore: cast_nullable_to_non_nullable
as int,rewardedMonths: null == rewardedMonths ? _self.rewardedMonths : rewardedMonths // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
