// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiUserContext {

 String? get ageGroup; String? get stage;/// Day of her current cycle, 1-based.
 int? get cycleDay;/// Week of pregnancy, when that is her stage.
 int? get pregWeek; String get language;
/// Create a copy of AiUserContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiUserContextCopyWith<AiUserContext> get copyWith => _$AiUserContextCopyWithImpl<AiUserContext>(this as AiUserContext, _$identity);

  /// Serializes this AiUserContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AiUserContext;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiUserContext&&(identical(other.ageGroup, _this.ageGroup) || other.ageGroup == _this.ageGroup)&&(identical(other.stage, _this.stage) || other.stage == _this.stage)&&(identical(other.cycleDay, _this.cycleDay) || other.cycleDay == _this.cycleDay)&&(identical(other.pregWeek, _this.pregWeek) || other.pregWeek == _this.pregWeek)&&(identical(other.language, _this.language) || other.language == _this.language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AiUserContext;
  return Object.hash(runtimeType,_this.ageGroup,_this.stage,_this.cycleDay,_this.pregWeek,_this.language);
}

@override
String toString() {
  final _this = this as AiUserContext;
  return 'AiUserContext(ageGroup: ${_this.ageGroup}, stage: ${_this.stage}, cycleDay: ${_this.cycleDay}, pregWeek: ${_this.pregWeek}, language: ${_this.language})';
}


}

/// @nodoc
abstract mixin class $AiUserContextCopyWith<$Res>  {
  factory $AiUserContextCopyWith(AiUserContext value, $Res Function(AiUserContext) _then) = _$AiUserContextCopyWithImpl;
@useResult
$Res call({
 String? ageGroup, String? stage, int? cycleDay, int? pregWeek, String language
});




}
/// @nodoc
class _$AiUserContextCopyWithImpl<$Res>
    implements $AiUserContextCopyWith<$Res> {
  _$AiUserContextCopyWithImpl(this._self, this._then);

  final AiUserContext _self;
  final $Res Function(AiUserContext) _then;

/// Create a copy of AiUserContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ageGroup = freezed,Object? stage = freezed,Object? cycleDay = freezed,Object? pregWeek = freezed,Object? language = null,}) {
  return _then(AiUserContext(
ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as String?,stage: freezed == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as String?,cycleDay: freezed == cycleDay ? _self.cycleDay : cycleDay // ignore: cast_nullable_to_non_nullable
as int?,pregWeek: freezed == pregWeek ? _self.pregWeek : pregWeek // ignore: cast_nullable_to_non_nullable
as int?,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AiUserContext].
extension AiUserContextPatterns on AiUserContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiUserContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiUserContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiUserContext value)  $default,){
final _that = this;
switch (_that) {
case _AiUserContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiUserContext value)?  $default,){
final _that = this;
switch (_that) {
case _AiUserContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? ageGroup,  String? stage,  int? cycleDay,  int? pregWeek,  String language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiUserContext() when $default != null:
return $default(_that.ageGroup,_that.stage,_that.cycleDay,_that.pregWeek,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? ageGroup,  String? stage,  int? cycleDay,  int? pregWeek,  String language)  $default,) {final _that = this;
switch (_that) {
case _AiUserContext():
return $default(_that.ageGroup,_that.stage,_that.cycleDay,_that.pregWeek,_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? ageGroup,  String? stage,  int? cycleDay,  int? pregWeek,  String language)?  $default,) {final _that = this;
switch (_that) {
case _AiUserContext() when $default != null:
return $default(_that.ageGroup,_that.stage,_that.cycleDay,_that.pregWeek,_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiUserContext extends AiUserContext {
  const _AiUserContext({this.ageGroup, this.stage, this.cycleDay, this.pregWeek, required this.language}): super._();
  factory _AiUserContext.fromJson(Map<String, dynamic> json) => _$AiUserContextFromJson(json);

@override final  String? ageGroup;
@override final  String? stage;
/// Day of her current cycle, 1-based.
@override final  int? cycleDay;
/// Week of pregnancy, when that is her stage.
@override final  int? pregWeek;
@override final  String language;

/// Create a copy of AiUserContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiUserContextCopyWith<_AiUserContext> get copyWith => __$AiUserContextCopyWithImpl<_AiUserContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiUserContextToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiUserContext&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.cycleDay, cycleDay) || other.cycleDay == cycleDay)&&(identical(other.pregWeek, pregWeek) || other.pregWeek == pregWeek)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,ageGroup,stage,cycleDay,pregWeek,language);
}

@override
String toString() {
    return 'AiUserContext(ageGroup: $ageGroup, stage: $stage, cycleDay: $cycleDay, pregWeek: $pregWeek, language: $language)';
}


}

/// @nodoc
abstract mixin class _$AiUserContextCopyWith<$Res> implements $AiUserContextCopyWith<$Res> {
  factory _$AiUserContextCopyWith(_AiUserContext value, $Res Function(_AiUserContext) _then) = __$AiUserContextCopyWithImpl;
@override @useResult
$Res call({
 String? ageGroup, String? stage, int? cycleDay, int? pregWeek, String language
});




}
/// @nodoc
class __$AiUserContextCopyWithImpl<$Res>
    implements _$AiUserContextCopyWith<$Res> {
  __$AiUserContextCopyWithImpl(this._self, this._then);

  final _AiUserContext _self;
  final $Res Function(_AiUserContext) _then;

/// Create a copy of AiUserContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ageGroup = freezed,Object? stage = freezed,Object? cycleDay = freezed,Object? pregWeek = freezed,Object? language = null,}) {
  return _then(_AiUserContext(
ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as String?,stage: freezed == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as String?,cycleDay: freezed == cycleDay ? _self.cycleDay : cycleDay // ignore: cast_nullable_to_non_nullable
as int?,pregWeek: freezed == pregWeek ? _self.pregWeek : pregWeek // ignore: cast_nullable_to_non_nullable
as int?,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
