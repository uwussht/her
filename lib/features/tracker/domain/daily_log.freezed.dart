// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyLog {

 DateTime get date; FlowLevel? get flow; List<Symptom> get symptoms; Mood? get mood; EnergyLevel? get energy; double? get sleepHours; String? get notes;
/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyLogCopyWith<DailyLog> get copyWith => _$DailyLogCopyWithImpl<DailyLog>(this as DailyLog, _$identity);

  /// Serializes this DailyLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyLog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyLog&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.flow, _this.flow) || other.flow == _this.flow)&&const DeepCollectionEquality().equals(other.symptoms, _this.symptoms)&&(identical(other.mood, _this.mood) || other.mood == _this.mood)&&(identical(other.energy, _this.energy) || other.energy == _this.energy)&&(identical(other.sleepHours, _this.sleepHours) || other.sleepHours == _this.sleepHours)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyLog;
  return Object.hash(runtimeType,_this.date,_this.flow,const DeepCollectionEquality().hash(_this.symptoms),_this.mood,_this.energy,_this.sleepHours,_this.notes);
}

@override
String toString() {
  final _this = this as DailyLog;
  return 'DailyLog(date: ${_this.date}, flow: ${_this.flow}, symptoms: ${_this.symptoms}, mood: ${_this.mood}, energy: ${_this.energy}, sleepHours: ${_this.sleepHours}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $DailyLogCopyWith<$Res>  {
  factory $DailyLogCopyWith(DailyLog value, $Res Function(DailyLog) _then) = _$DailyLogCopyWithImpl;
@useResult
$Res call({
 DateTime date, FlowLevel? flow, List<Symptom> symptoms, Mood? mood, EnergyLevel? energy, double? sleepHours, String? notes
});




}
/// @nodoc
class _$DailyLogCopyWithImpl<$Res>
    implements $DailyLogCopyWith<$Res> {
  _$DailyLogCopyWithImpl(this._self, this._then);

  final DailyLog _self;
  final $Res Function(DailyLog) _then;

/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? flow = freezed,Object? symptoms = null,Object? mood = freezed,Object? energy = freezed,Object? sleepHours = freezed,Object? notes = freezed,}) {
  return _then(DailyLog(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,flow: freezed == flow ? _self.flow : flow // ignore: cast_nullable_to_non_nullable
as FlowLevel?,symptoms: null == symptoms ? _self.symptoms : symptoms // ignore: cast_nullable_to_non_nullable
as List<Symptom>,mood: freezed == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as Mood?,energy: freezed == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as EnergyLevel?,sleepHours: freezed == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyLog].
extension DailyLogPatterns on DailyLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyLog value)  $default,){
final _that = this;
switch (_that) {
case _DailyLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyLog value)?  $default,){
final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  FlowLevel? flow,  List<Symptom> symptoms,  Mood? mood,  EnergyLevel? energy,  double? sleepHours,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
return $default(_that.date,_that.flow,_that.symptoms,_that.mood,_that.energy,_that.sleepHours,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  FlowLevel? flow,  List<Symptom> symptoms,  Mood? mood,  EnergyLevel? energy,  double? sleepHours,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _DailyLog():
return $default(_that.date,_that.flow,_that.symptoms,_that.mood,_that.energy,_that.sleepHours,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  FlowLevel? flow,  List<Symptom> symptoms,  Mood? mood,  EnergyLevel? energy,  double? sleepHours,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
return $default(_that.date,_that.flow,_that.symptoms,_that.mood,_that.energy,_that.sleepHours,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyLog extends DailyLog {
  const _DailyLog({required this.date, this.flow,  List<Symptom> symptoms = const <Symptom>[], this.mood, this.energy, this.sleepHours, this.notes}): _symptoms = symptoms,super._();
  factory _DailyLog.fromJson(Map<String, dynamic> json) => _$DailyLogFromJson(json);

@override final  DateTime date;
@override final  FlowLevel? flow;
 final  List<Symptom> _symptoms;
@override@JsonKey() List<Symptom> get symptoms {
  if (_symptoms is EqualUnmodifiableListView) return _symptoms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_symptoms);
}

@override final  Mood? mood;
@override final  EnergyLevel? energy;
@override final  double? sleepHours;
@override final  String? notes;

/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyLogCopyWith<_DailyLog> get copyWith => __$DailyLogCopyWithImpl<_DailyLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyLogToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyLog&&(identical(other.date, date) || other.date == date)&&(identical(other.flow, flow) || other.flow == flow)&&const DeepCollectionEquality().equals(other.symptoms, _symptoms)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,flow,const DeepCollectionEquality().hash(_symptoms),mood,energy,sleepHours,notes);
}

@override
String toString() {
    return 'DailyLog(date: $date, flow: $flow, symptoms: $symptoms, mood: $mood, energy: $energy, sleepHours: $sleepHours, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$DailyLogCopyWith<$Res> implements $DailyLogCopyWith<$Res> {
  factory _$DailyLogCopyWith(_DailyLog value, $Res Function(_DailyLog) _then) = __$DailyLogCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, FlowLevel? flow, List<Symptom> symptoms, Mood? mood, EnergyLevel? energy, double? sleepHours, String? notes
});




}
/// @nodoc
class __$DailyLogCopyWithImpl<$Res>
    implements _$DailyLogCopyWith<$Res> {
  __$DailyLogCopyWithImpl(this._self, this._then);

  final _DailyLog _self;
  final $Res Function(_DailyLog) _then;

/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? flow = freezed,Object? symptoms = null,Object? mood = freezed,Object? energy = freezed,Object? sleepHours = freezed,Object? notes = freezed,}) {
  return _then(_DailyLog(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,flow: freezed == flow ? _self.flow : flow // ignore: cast_nullable_to_non_nullable
as FlowLevel?,symptoms: null == symptoms ? _self._symptoms : symptoms // ignore: cast_nullable_to_non_nullable
as List<Symptom>,mood: freezed == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as Mood?,energy: freezed == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as EnergyLevel?,sleepHours: freezed == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
