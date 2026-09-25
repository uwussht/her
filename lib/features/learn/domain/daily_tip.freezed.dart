// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_tip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyTip {

 String get id;@LocalizedTextConverter() LocalizedText get text; List<CyclePhase> get phases; List<LifeStage> get stages;/// Opens this Learn item when tapped.
 String? get contentId;
/// Create a copy of DailyTip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyTipCopyWith<DailyTip> get copyWith => _$DailyTipCopyWithImpl<DailyTip>(this as DailyTip, _$identity);

  /// Serializes this DailyTip to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyTip;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyTip&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.text, _this.text) || other.text == _this.text)&&const DeepCollectionEquality().equals(other.phases, _this.phases)&&const DeepCollectionEquality().equals(other.stages, _this.stages)&&(identical(other.contentId, _this.contentId) || other.contentId == _this.contentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyTip;
  return Object.hash(runtimeType,_this.id,_this.text,const DeepCollectionEquality().hash(_this.phases),const DeepCollectionEquality().hash(_this.stages),_this.contentId);
}

@override
String toString() {
  final _this = this as DailyTip;
  return 'DailyTip(id: ${_this.id}, text: ${_this.text}, phases: ${_this.phases}, stages: ${_this.stages}, contentId: ${_this.contentId})';
}


}

/// @nodoc
abstract mixin class $DailyTipCopyWith<$Res>  {
  factory $DailyTipCopyWith(DailyTip value, $Res Function(DailyTip) _then) = _$DailyTipCopyWithImpl;
@useResult
$Res call({
 String id,@LocalizedTextConverter() LocalizedText text, List<CyclePhase> phases, List<LifeStage> stages, String? contentId
});




}
/// @nodoc
class _$DailyTipCopyWithImpl<$Res>
    implements $DailyTipCopyWith<$Res> {
  _$DailyTipCopyWithImpl(this._self, this._then);

  final DailyTip _self;
  final $Res Function(DailyTip) _then;

/// Create a copy of DailyTip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? phases = null,Object? stages = null,Object? contentId = freezed,}) {
  return _then(DailyTip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as LocalizedText,phases: null == phases ? _self.phases : phases // ignore: cast_nullable_to_non_nullable
as List<CyclePhase>,stages: null == stages ? _self.stages : stages // ignore: cast_nullable_to_non_nullable
as List<LifeStage>,contentId: freezed == contentId ? _self.contentId : contentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyTip].
extension DailyTipPatterns on DailyTip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyTip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyTip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyTip value)  $default,){
final _that = this;
switch (_that) {
case _DailyTip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyTip value)?  $default,){
final _that = this;
switch (_that) {
case _DailyTip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @LocalizedTextConverter()  LocalizedText text,  List<CyclePhase> phases,  List<LifeStage> stages,  String? contentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyTip() when $default != null:
return $default(_that.id,_that.text,_that.phases,_that.stages,_that.contentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @LocalizedTextConverter()  LocalizedText text,  List<CyclePhase> phases,  List<LifeStage> stages,  String? contentId)  $default,) {final _that = this;
switch (_that) {
case _DailyTip():
return $default(_that.id,_that.text,_that.phases,_that.stages,_that.contentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @LocalizedTextConverter()  LocalizedText text,  List<CyclePhase> phases,  List<LifeStage> stages,  String? contentId)?  $default,) {final _that = this;
switch (_that) {
case _DailyTip() when $default != null:
return $default(_that.id,_that.text,_that.phases,_that.stages,_that.contentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyTip implements DailyTip {
  const _DailyTip({required this.id, @LocalizedTextConverter() required this.text,  List<CyclePhase> phases = const <CyclePhase>[],  List<LifeStage> stages = const <LifeStage>[], this.contentId}): _phases = phases,_stages = stages;
  factory _DailyTip.fromJson(Map<String, dynamic> json) => _$DailyTipFromJson(json);

@override final  String id;
@override@LocalizedTextConverter() final  LocalizedText text;
 final  List<CyclePhase> _phases;
@override@JsonKey() List<CyclePhase> get phases {
  if (_phases is EqualUnmodifiableListView) return _phases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phases);
}

 final  List<LifeStage> _stages;
@override@JsonKey() List<LifeStage> get stages {
  if (_stages is EqualUnmodifiableListView) return _stages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stages);
}

/// Opens this Learn item when tapped.
@override final  String? contentId;

/// Create a copy of DailyTip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyTipCopyWith<_DailyTip> get copyWith => __$DailyTipCopyWithImpl<_DailyTip>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyTipToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyTip&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.phases, _phases)&&const DeepCollectionEquality().equals(other.stages, _stages)&&(identical(other.contentId, contentId) || other.contentId == contentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,text,const DeepCollectionEquality().hash(_phases),const DeepCollectionEquality().hash(_stages),contentId);
}

@override
String toString() {
    return 'DailyTip(id: $id, text: $text, phases: $phases, stages: $stages, contentId: $contentId)';
}


}

/// @nodoc
abstract mixin class _$DailyTipCopyWith<$Res> implements $DailyTipCopyWith<$Res> {
  factory _$DailyTipCopyWith(_DailyTip value, $Res Function(_DailyTip) _then) = __$DailyTipCopyWithImpl;
@override @useResult
$Res call({
 String id,@LocalizedTextConverter() LocalizedText text, List<CyclePhase> phases, List<LifeStage> stages, String? contentId
});




}
/// @nodoc
class __$DailyTipCopyWithImpl<$Res>
    implements _$DailyTipCopyWith<$Res> {
  __$DailyTipCopyWithImpl(this._self, this._then);

  final _DailyTip _self;
  final $Res Function(_DailyTip) _then;

/// Create a copy of DailyTip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? phases = null,Object? stages = null,Object? contentId = freezed,}) {
  return _then(_DailyTip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as LocalizedText,phases: null == phases ? _self._phases : phases // ignore: cast_nullable_to_non_nullable
as List<CyclePhase>,stages: null == stages ? _self._stages : stages // ignore: cast_nullable_to_non_nullable
as List<LifeStage>,contentId: freezed == contentId ? _self.contentId : contentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
