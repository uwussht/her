// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 String get uid; AgeGroup get ageGroup; LifeStage get lifeStage; DateTime? get lastPeriodStart; int? get cycleLength; List<Interest> get interests; DateTime get createdAt;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.uid, _this.uid) || other.uid == _this.uid)&&(identical(other.ageGroup, _this.ageGroup) || other.ageGroup == _this.ageGroup)&&(identical(other.lifeStage, _this.lifeStage) || other.lifeStage == _this.lifeStage)&&(identical(other.lastPeriodStart, _this.lastPeriodStart) || other.lastPeriodStart == _this.lastPeriodStart)&&(identical(other.cycleLength, _this.cycleLength) || other.cycleLength == _this.cycleLength)&&const DeepCollectionEquality().equals(other.interests, _this.interests)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserProfile;
  return Object.hash(runtimeType,_this.uid,_this.ageGroup,_this.lifeStage,_this.lastPeriodStart,_this.cycleLength,const DeepCollectionEquality().hash(_this.interests),_this.createdAt);
}

@override
String toString() {
  final _this = this as UserProfile;
  return 'UserProfile(uid: ${_this.uid}, ageGroup: ${_this.ageGroup}, lifeStage: ${_this.lifeStage}, lastPeriodStart: ${_this.lastPeriodStart}, cycleLength: ${_this.cycleLength}, interests: ${_this.interests}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String uid, AgeGroup ageGroup, LifeStage lifeStage, DateTime? lastPeriodStart, int? cycleLength, List<Interest> interests, DateTime createdAt
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? ageGroup = null,Object? lifeStage = null,Object? lastPeriodStart = freezed,Object? cycleLength = freezed,Object? interests = null,Object? createdAt = null,}) {
  return _then(UserProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup,lifeStage: null == lifeStage ? _self.lifeStage : lifeStage // ignore: cast_nullable_to_non_nullable
as LifeStage,lastPeriodStart: freezed == lastPeriodStart ? _self.lastPeriodStart : lastPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,cycleLength: freezed == cycleLength ? _self.cycleLength : cycleLength // ignore: cast_nullable_to_non_nullable
as int?,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<Interest>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  AgeGroup ageGroup,  LifeStage lifeStage,  DateTime? lastPeriodStart,  int? cycleLength,  List<Interest> interests,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.ageGroup,_that.lifeStage,_that.lastPeriodStart,_that.cycleLength,_that.interests,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  AgeGroup ageGroup,  LifeStage lifeStage,  DateTime? lastPeriodStart,  int? cycleLength,  List<Interest> interests,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.uid,_that.ageGroup,_that.lifeStage,_that.lastPeriodStart,_that.cycleLength,_that.interests,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  AgeGroup ageGroup,  LifeStage lifeStage,  DateTime? lastPeriodStart,  int? cycleLength,  List<Interest> interests,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.ageGroup,_that.lifeStage,_that.lastPeriodStart,_that.cycleLength,_that.interests,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.uid, required this.ageGroup, required this.lifeStage, this.lastPeriodStart, this.cycleLength,  List<Interest> interests = const <Interest>[], required this.createdAt}): _interests = interests;
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String uid;
@override final  AgeGroup ageGroup;
@override final  LifeStage lifeStage;
@override final  DateTime? lastPeriodStart;
@override final  int? cycleLength;
 final  List<Interest> _interests;
@override@JsonKey() List<Interest> get interests {
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interests);
}

@override final  DateTime createdAt;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.lifeStage, lifeStage) || other.lifeStage == lifeStage)&&(identical(other.lastPeriodStart, lastPeriodStart) || other.lastPeriodStart == lastPeriodStart)&&(identical(other.cycleLength, cycleLength) || other.cycleLength == cycleLength)&&const DeepCollectionEquality().equals(other.interests, _interests)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,uid,ageGroup,lifeStage,lastPeriodStart,cycleLength,const DeepCollectionEquality().hash(_interests),createdAt);
}

@override
String toString() {
    return 'UserProfile(uid: $uid, ageGroup: $ageGroup, lifeStage: $lifeStage, lastPeriodStart: $lastPeriodStart, cycleLength: $cycleLength, interests: $interests, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String uid, AgeGroup ageGroup, LifeStage lifeStage, DateTime? lastPeriodStart, int? cycleLength, List<Interest> interests, DateTime createdAt
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? ageGroup = null,Object? lifeStage = null,Object? lastPeriodStart = freezed,Object? cycleLength = freezed,Object? interests = null,Object? createdAt = null,}) {
  return _then(_UserProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup,lifeStage: null == lifeStage ? _self.lifeStage : lifeStage // ignore: cast_nullable_to_non_nullable
as LifeStage,lastPeriodStart: freezed == lastPeriodStart ? _self.lastPeriodStart : lastPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,cycleLength: freezed == cycleLength ? _self.cycleLength : cycleLength // ignore: cast_nullable_to_non_nullable
as int?,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<Interest>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
