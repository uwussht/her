// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizDraft {

 int get step; AgeGroup? get ageGroup; LifeStage? get lifeStage; DateTime? get lastPeriodStart; int get cycleLength; bool get cycleSkipped; Set<Interest> get interests;
/// Create a copy of QuizDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizDraftCopyWith<QuizDraft> get copyWith => _$QuizDraftCopyWithImpl<QuizDraft>(this as QuizDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as QuizDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizDraft&&(identical(other.step, _this.step) || other.step == _this.step)&&(identical(other.ageGroup, _this.ageGroup) || other.ageGroup == _this.ageGroup)&&(identical(other.lifeStage, _this.lifeStage) || other.lifeStage == _this.lifeStage)&&(identical(other.lastPeriodStart, _this.lastPeriodStart) || other.lastPeriodStart == _this.lastPeriodStart)&&(identical(other.cycleLength, _this.cycleLength) || other.cycleLength == _this.cycleLength)&&(identical(other.cycleSkipped, _this.cycleSkipped) || other.cycleSkipped == _this.cycleSkipped)&&const DeepCollectionEquality().equals(other.interests, _this.interests));
}


@override
int get hashCode {
  final _this = this as QuizDraft;
  return Object.hash(runtimeType,_this.step,_this.ageGroup,_this.lifeStage,_this.lastPeriodStart,_this.cycleLength,_this.cycleSkipped,const DeepCollectionEquality().hash(_this.interests));
}

@override
String toString() {
  final _this = this as QuizDraft;
  return 'QuizDraft(step: ${_this.step}, ageGroup: ${_this.ageGroup}, lifeStage: ${_this.lifeStage}, lastPeriodStart: ${_this.lastPeriodStart}, cycleLength: ${_this.cycleLength}, cycleSkipped: ${_this.cycleSkipped}, interests: ${_this.interests})';
}


}

/// @nodoc
abstract mixin class $QuizDraftCopyWith<$Res>  {
  factory $QuizDraftCopyWith(QuizDraft value, $Res Function(QuizDraft) _then) = _$QuizDraftCopyWithImpl;
@useResult
$Res call({
 int step, AgeGroup? ageGroup, LifeStage? lifeStage, DateTime? lastPeriodStart, int cycleLength, bool cycleSkipped, Set<Interest> interests
});




}
/// @nodoc
class _$QuizDraftCopyWithImpl<$Res>
    implements $QuizDraftCopyWith<$Res> {
  _$QuizDraftCopyWithImpl(this._self, this._then);

  final QuizDraft _self;
  final $Res Function(QuizDraft) _then;

/// Create a copy of QuizDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? ageGroup = freezed,Object? lifeStage = freezed,Object? lastPeriodStart = freezed,Object? cycleLength = null,Object? cycleSkipped = null,Object? interests = null,}) {
  return _then(QuizDraft(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup?,lifeStage: freezed == lifeStage ? _self.lifeStage : lifeStage // ignore: cast_nullable_to_non_nullable
as LifeStage?,lastPeriodStart: freezed == lastPeriodStart ? _self.lastPeriodStart : lastPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,cycleLength: null == cycleLength ? _self.cycleLength : cycleLength // ignore: cast_nullable_to_non_nullable
as int,cycleSkipped: null == cycleSkipped ? _self.cycleSkipped : cycleSkipped // ignore: cast_nullable_to_non_nullable
as bool,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as Set<Interest>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizDraft].
extension QuizDraftPatterns on QuizDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizDraft value)  $default,){
final _that = this;
switch (_that) {
case _QuizDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizDraft value)?  $default,){
final _that = this;
switch (_that) {
case _QuizDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int step,  AgeGroup? ageGroup,  LifeStage? lifeStage,  DateTime? lastPeriodStart,  int cycleLength,  bool cycleSkipped,  Set<Interest> interests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizDraft() when $default != null:
return $default(_that.step,_that.ageGroup,_that.lifeStage,_that.lastPeriodStart,_that.cycleLength,_that.cycleSkipped,_that.interests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int step,  AgeGroup? ageGroup,  LifeStage? lifeStage,  DateTime? lastPeriodStart,  int cycleLength,  bool cycleSkipped,  Set<Interest> interests)  $default,) {final _that = this;
switch (_that) {
case _QuizDraft():
return $default(_that.step,_that.ageGroup,_that.lifeStage,_that.lastPeriodStart,_that.cycleLength,_that.cycleSkipped,_that.interests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int step,  AgeGroup? ageGroup,  LifeStage? lifeStage,  DateTime? lastPeriodStart,  int cycleLength,  bool cycleSkipped,  Set<Interest> interests)?  $default,) {final _that = this;
switch (_that) {
case _QuizDraft() when $default != null:
return $default(_that.step,_that.ageGroup,_that.lifeStage,_that.lastPeriodStart,_that.cycleLength,_that.cycleSkipped,_that.interests);case _:
  return null;

}
}

}

/// @nodoc


class _QuizDraft extends QuizDraft {
  const _QuizDraft({this.step = 0, this.ageGroup, this.lifeStage, this.lastPeriodStart, this.cycleLength = UserProfile.defaultCycleLength, this.cycleSkipped = false,  Set<Interest> interests = const <Interest>{}}): _interests = interests,super._();
  

@override@JsonKey() final  int step;
@override final  AgeGroup? ageGroup;
@override final  LifeStage? lifeStage;
@override final  DateTime? lastPeriodStart;
@override@JsonKey() final  int cycleLength;
@override@JsonKey() final  bool cycleSkipped;
 final  Set<Interest> _interests;
@override@JsonKey() Set<Interest> get interests {
  if (_interests is EqualUnmodifiableSetView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_interests);
}


/// Create a copy of QuizDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizDraftCopyWith<_QuizDraft> get copyWith => __$QuizDraftCopyWithImpl<_QuizDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizDraft&&(identical(other.step, step) || other.step == step)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.lifeStage, lifeStage) || other.lifeStage == lifeStage)&&(identical(other.lastPeriodStart, lastPeriodStart) || other.lastPeriodStart == lastPeriodStart)&&(identical(other.cycleLength, cycleLength) || other.cycleLength == cycleLength)&&(identical(other.cycleSkipped, cycleSkipped) || other.cycleSkipped == cycleSkipped)&&const DeepCollectionEquality().equals(other.interests, _interests));
}


@override
int get hashCode {
    return Object.hash(runtimeType,step,ageGroup,lifeStage,lastPeriodStart,cycleLength,cycleSkipped,const DeepCollectionEquality().hash(_interests));
}

@override
String toString() {
    return 'QuizDraft(step: $step, ageGroup: $ageGroup, lifeStage: $lifeStage, lastPeriodStart: $lastPeriodStart, cycleLength: $cycleLength, cycleSkipped: $cycleSkipped, interests: $interests)';
}


}

/// @nodoc
abstract mixin class _$QuizDraftCopyWith<$Res> implements $QuizDraftCopyWith<$Res> {
  factory _$QuizDraftCopyWith(_QuizDraft value, $Res Function(_QuizDraft) _then) = __$QuizDraftCopyWithImpl;
@override @useResult
$Res call({
 int step, AgeGroup? ageGroup, LifeStage? lifeStage, DateTime? lastPeriodStart, int cycleLength, bool cycleSkipped, Set<Interest> interests
});




}
/// @nodoc
class __$QuizDraftCopyWithImpl<$Res>
    implements _$QuizDraftCopyWith<$Res> {
  __$QuizDraftCopyWithImpl(this._self, this._then);

  final _QuizDraft _self;
  final $Res Function(_QuizDraft) _then;

/// Create a copy of QuizDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? ageGroup = freezed,Object? lifeStage = freezed,Object? lastPeriodStart = freezed,Object? cycleLength = null,Object? cycleSkipped = null,Object? interests = null,}) {
  return _then(_QuizDraft(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup?,lifeStage: freezed == lifeStage ? _self.lifeStage : lifeStage // ignore: cast_nullable_to_non_nullable
as LifeStage?,lastPeriodStart: freezed == lastPeriodStart ? _self.lastPeriodStart : lastPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,cycleLength: null == cycleLength ? _self.cycleLength : cycleLength // ignore: cast_nullable_to_non_nullable
as int,cycleSkipped: null == cycleSkipped ? _self.cycleSkipped : cycleSkipped // ignore: cast_nullable_to_non_nullable
as bool,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as Set<Interest>,
  ));
}


}

// dart format on
