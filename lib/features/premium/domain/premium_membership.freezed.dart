// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_membership.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PremiumMembership {

 PremiumStatus get status; PremiumPlan? get plan;/// When the trial or the subscription began.
 DateTime? get startedAt;/// End of the free trial, exclusive.
 DateTime? get trialEndsAt;/// When the current paid period runs out, exclusive.
 DateTime? get expiresAt;/// Months granted by referrals, already folded into [expiresAt] when she
/// is subscribed and held here until then.
 int get bonusMonths;/// True once she has used the free trial, so it is offered only once.
 bool get trialUsed;
/// Create a copy of PremiumMembership
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumMembershipCopyWith<PremiumMembership> get copyWith => _$PremiumMembershipCopyWithImpl<PremiumMembership>(this as PremiumMembership, _$identity);

  /// Serializes this PremiumMembership to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PremiumMembership;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumMembership&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.plan, _this.plan) || other.plan == _this.plan)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.trialEndsAt, _this.trialEndsAt) || other.trialEndsAt == _this.trialEndsAt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.bonusMonths, _this.bonusMonths) || other.bonusMonths == _this.bonusMonths)&&(identical(other.trialUsed, _this.trialUsed) || other.trialUsed == _this.trialUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PremiumMembership;
  return Object.hash(runtimeType,_this.status,_this.plan,_this.startedAt,_this.trialEndsAt,_this.expiresAt,_this.bonusMonths,_this.trialUsed);
}

@override
String toString() {
  final _this = this as PremiumMembership;
  return 'PremiumMembership(status: ${_this.status}, plan: ${_this.plan}, startedAt: ${_this.startedAt}, trialEndsAt: ${_this.trialEndsAt}, expiresAt: ${_this.expiresAt}, bonusMonths: ${_this.bonusMonths}, trialUsed: ${_this.trialUsed})';
}


}

/// @nodoc
abstract mixin class $PremiumMembershipCopyWith<$Res>  {
  factory $PremiumMembershipCopyWith(PremiumMembership value, $Res Function(PremiumMembership) _then) = _$PremiumMembershipCopyWithImpl;
@useResult
$Res call({
 PremiumStatus status, PremiumPlan? plan, DateTime? startedAt, DateTime? trialEndsAt, DateTime? expiresAt, int bonusMonths, bool trialUsed
});




}
/// @nodoc
class _$PremiumMembershipCopyWithImpl<$Res>
    implements $PremiumMembershipCopyWith<$Res> {
  _$PremiumMembershipCopyWithImpl(this._self, this._then);

  final PremiumMembership _self;
  final $Res Function(PremiumMembership) _then;

/// Create a copy of PremiumMembership
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? plan = freezed,Object? startedAt = freezed,Object? trialEndsAt = freezed,Object? expiresAt = freezed,Object? bonusMonths = null,Object? trialUsed = null,}) {
  return _then(PremiumMembership(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PremiumStatus,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PremiumPlan?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,trialEndsAt: freezed == trialEndsAt ? _self.trialEndsAt : trialEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,bonusMonths: null == bonusMonths ? _self.bonusMonths : bonusMonths // ignore: cast_nullable_to_non_nullable
as int,trialUsed: null == trialUsed ? _self.trialUsed : trialUsed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PremiumMembership].
extension PremiumMembershipPatterns on PremiumMembership {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PremiumMembership value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PremiumMembership() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PremiumMembership value)  $default,){
final _that = this;
switch (_that) {
case _PremiumMembership():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PremiumMembership value)?  $default,){
final _that = this;
switch (_that) {
case _PremiumMembership() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PremiumStatus status,  PremiumPlan? plan,  DateTime? startedAt,  DateTime? trialEndsAt,  DateTime? expiresAt,  int bonusMonths,  bool trialUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PremiumMembership() when $default != null:
return $default(_that.status,_that.plan,_that.startedAt,_that.trialEndsAt,_that.expiresAt,_that.bonusMonths,_that.trialUsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PremiumStatus status,  PremiumPlan? plan,  DateTime? startedAt,  DateTime? trialEndsAt,  DateTime? expiresAt,  int bonusMonths,  bool trialUsed)  $default,) {final _that = this;
switch (_that) {
case _PremiumMembership():
return $default(_that.status,_that.plan,_that.startedAt,_that.trialEndsAt,_that.expiresAt,_that.bonusMonths,_that.trialUsed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PremiumStatus status,  PremiumPlan? plan,  DateTime? startedAt,  DateTime? trialEndsAt,  DateTime? expiresAt,  int bonusMonths,  bool trialUsed)?  $default,) {final _that = this;
switch (_that) {
case _PremiumMembership() when $default != null:
return $default(_that.status,_that.plan,_that.startedAt,_that.trialEndsAt,_that.expiresAt,_that.bonusMonths,_that.trialUsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PremiumMembership extends PremiumMembership {
  const _PremiumMembership({this.status = PremiumStatus.free, this.plan, this.startedAt, this.trialEndsAt, this.expiresAt, this.bonusMonths = 0, this.trialUsed = false}): super._();
  factory _PremiumMembership.fromJson(Map<String, dynamic> json) => _$PremiumMembershipFromJson(json);

@override@JsonKey() final  PremiumStatus status;
@override final  PremiumPlan? plan;
/// When the trial or the subscription began.
@override final  DateTime? startedAt;
/// End of the free trial, exclusive.
@override final  DateTime? trialEndsAt;
/// When the current paid period runs out, exclusive.
@override final  DateTime? expiresAt;
/// Months granted by referrals, already folded into [expiresAt] when she
/// is subscribed and held here until then.
@override@JsonKey() final  int bonusMonths;
/// True once she has used the free trial, so it is offered only once.
@override@JsonKey() final  bool trialUsed;

/// Create a copy of PremiumMembership
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PremiumMembershipCopyWith<_PremiumMembership> get copyWith => __$PremiumMembershipCopyWithImpl<_PremiumMembership>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PremiumMembershipToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PremiumMembership&&(identical(other.status, status) || other.status == status)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.trialEndsAt, trialEndsAt) || other.trialEndsAt == trialEndsAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.bonusMonths, bonusMonths) || other.bonusMonths == bonusMonths)&&(identical(other.trialUsed, trialUsed) || other.trialUsed == trialUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,plan,startedAt,trialEndsAt,expiresAt,bonusMonths,trialUsed);
}

@override
String toString() {
    return 'PremiumMembership(status: $status, plan: $plan, startedAt: $startedAt, trialEndsAt: $trialEndsAt, expiresAt: $expiresAt, bonusMonths: $bonusMonths, trialUsed: $trialUsed)';
}


}

/// @nodoc
abstract mixin class _$PremiumMembershipCopyWith<$Res> implements $PremiumMembershipCopyWith<$Res> {
  factory _$PremiumMembershipCopyWith(_PremiumMembership value, $Res Function(_PremiumMembership) _then) = __$PremiumMembershipCopyWithImpl;
@override @useResult
$Res call({
 PremiumStatus status, PremiumPlan? plan, DateTime? startedAt, DateTime? trialEndsAt, DateTime? expiresAt, int bonusMonths, bool trialUsed
});




}
/// @nodoc
class __$PremiumMembershipCopyWithImpl<$Res>
    implements _$PremiumMembershipCopyWith<$Res> {
  __$PremiumMembershipCopyWithImpl(this._self, this._then);

  final _PremiumMembership _self;
  final $Res Function(_PremiumMembership) _then;

/// Create a copy of PremiumMembership
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? plan = freezed,Object? startedAt = freezed,Object? trialEndsAt = freezed,Object? expiresAt = freezed,Object? bonusMonths = null,Object? trialUsed = null,}) {
  return _then(_PremiumMembership(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PremiumStatus,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PremiumPlan?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,trialEndsAt: freezed == trialEndsAt ? _self.trialEndsAt : trialEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,bonusMonths: null == bonusMonths ? _self.bonusMonths : bonusMonths // ignore: cast_nullable_to_non_nullable
as int,trialUsed: null == trialUsed ? _self.trialUsed : trialUsed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
