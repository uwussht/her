// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReminderTime {

 int get hour; int get minute;
/// Create a copy of ReminderTime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderTimeCopyWith<ReminderTime> get copyWith => _$ReminderTimeCopyWithImpl<ReminderTime>(this as ReminderTime, _$identity);

  /// Serializes this ReminderTime to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReminderTime;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderTime&&(identical(other.hour, _this.hour) || other.hour == _this.hour)&&(identical(other.minute, _this.minute) || other.minute == _this.minute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReminderTime;
  return Object.hash(runtimeType,_this.hour,_this.minute);
}

@override
String toString() {
  final _this = this as ReminderTime;
  return 'ReminderTime(hour: ${_this.hour}, minute: ${_this.minute})';
}


}

/// @nodoc
abstract mixin class $ReminderTimeCopyWith<$Res>  {
  factory $ReminderTimeCopyWith(ReminderTime value, $Res Function(ReminderTime) _then) = _$ReminderTimeCopyWithImpl;
@useResult
$Res call({
 int hour, int minute
});




}
/// @nodoc
class _$ReminderTimeCopyWithImpl<$Res>
    implements $ReminderTimeCopyWith<$Res> {
  _$ReminderTimeCopyWithImpl(this._self, this._then);

  final ReminderTime _self;
  final $Res Function(ReminderTime) _then;

/// Create a copy of ReminderTime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hour = null,Object? minute = null,}) {
  return _then(ReminderTime(
hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderTime].
extension ReminderTimePatterns on ReminderTime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderTime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderTime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderTime value)  $default,){
final _that = this;
switch (_that) {
case _ReminderTime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderTime value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderTime() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int hour,  int minute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderTime() when $default != null:
return $default(_that.hour,_that.minute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int hour,  int minute)  $default,) {final _that = this;
switch (_that) {
case _ReminderTime():
return $default(_that.hour,_that.minute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int hour,  int minute)?  $default,) {final _that = this;
switch (_that) {
case _ReminderTime() when $default != null:
return $default(_that.hour,_that.minute);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderTime extends ReminderTime {
  const _ReminderTime({required this.hour, required this.minute}): super._();
  factory _ReminderTime.fromJson(Map<String, dynamic> json) => _$ReminderTimeFromJson(json);

@override final  int hour;
@override final  int minute;

/// Create a copy of ReminderTime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderTimeCopyWith<_ReminderTime> get copyWith => __$ReminderTimeCopyWithImpl<_ReminderTime>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderTimeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderTime&&(identical(other.hour, hour) || other.hour == hour)&&(identical(other.minute, minute) || other.minute == minute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,hour,minute);
}

@override
String toString() {
    return 'ReminderTime(hour: $hour, minute: $minute)';
}


}

/// @nodoc
abstract mixin class _$ReminderTimeCopyWith<$Res> implements $ReminderTimeCopyWith<$Res> {
  factory _$ReminderTimeCopyWith(_ReminderTime value, $Res Function(_ReminderTime) _then) = __$ReminderTimeCopyWithImpl;
@override @useResult
$Res call({
 int hour, int minute
});




}
/// @nodoc
class __$ReminderTimeCopyWithImpl<$Res>
    implements _$ReminderTimeCopyWith<$Res> {
  __$ReminderTimeCopyWithImpl(this._self, this._then);

  final _ReminderTime _self;
  final $Res Function(_ReminderTime) _then;

/// Create a copy of ReminderTime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hour = null,Object? minute = null,}) {
  return _then(_ReminderTime(
hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Reminder {

 String get id; ReminderType get type; ReminderTime get time; bool get enabled;/// How many days ahead to warn, for [ReminderType.periodComing].
 int get daysBefore;/// Times per day, for [ReminderType.water].
 int get timesPerDay;/// Fixed date for one-off reminders (doctor visits, vaccinations).
 DateTime? get date;/// Free-text label shown instead of the default title.
 String? get label;/// Links a [ReminderType.vaccination] reminder to its schedule entry.
 String? get vaccinationId;
/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderCopyWith<Reminder> get copyWith => _$ReminderCopyWithImpl<Reminder>(this as Reminder, _$identity);

  /// Serializes this Reminder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Reminder;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reminder&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.time, _this.time) || other.time == _this.time)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled)&&(identical(other.daysBefore, _this.daysBefore) || other.daysBefore == _this.daysBefore)&&(identical(other.timesPerDay, _this.timesPerDay) || other.timesPerDay == _this.timesPerDay)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.vaccinationId, _this.vaccinationId) || other.vaccinationId == _this.vaccinationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Reminder;
  return Object.hash(runtimeType,_this.id,_this.type,_this.time,_this.enabled,_this.daysBefore,_this.timesPerDay,_this.date,_this.label,_this.vaccinationId);
}

@override
String toString() {
  final _this = this as Reminder;
  return 'Reminder(id: ${_this.id}, type: ${_this.type}, time: ${_this.time}, enabled: ${_this.enabled}, daysBefore: ${_this.daysBefore}, timesPerDay: ${_this.timesPerDay}, date: ${_this.date}, label: ${_this.label}, vaccinationId: ${_this.vaccinationId})';
}


}

/// @nodoc
abstract mixin class $ReminderCopyWith<$Res>  {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) _then) = _$ReminderCopyWithImpl;
@useResult
$Res call({
 String id, ReminderType type, ReminderTime time, bool enabled, int daysBefore, int timesPerDay, DateTime? date, String? label, String? vaccinationId
});


$ReminderTimeCopyWith<$Res> get time;

}
/// @nodoc
class _$ReminderCopyWithImpl<$Res>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._self, this._then);

  final Reminder _self;
  final $Res Function(Reminder) _then;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? time = null,Object? enabled = null,Object? daysBefore = null,Object? timesPerDay = null,Object? date = freezed,Object? label = freezed,Object? vaccinationId = freezed,}) {
  return _then(Reminder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReminderType,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as ReminderTime,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,daysBefore: null == daysBefore ? _self.daysBefore : daysBefore // ignore: cast_nullable_to_non_nullable
as int,timesPerDay: null == timesPerDay ? _self.timesPerDay : timesPerDay // ignore: cast_nullable_to_non_nullable
as int,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,vaccinationId: freezed == vaccinationId ? _self.vaccinationId : vaccinationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderTimeCopyWith<$Res> get time {
  
  return $ReminderTimeCopyWith<$Res>(_self.time, (value) {
    return _then(_self.copyWith(time: value));
  });
}
}


/// Adds pattern-matching-related methods to [Reminder].
extension ReminderPatterns on Reminder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reminder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reminder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reminder value)  $default,){
final _that = this;
switch (_that) {
case _Reminder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reminder value)?  $default,){
final _that = this;
switch (_that) {
case _Reminder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ReminderType type,  ReminderTime time,  bool enabled,  int daysBefore,  int timesPerDay,  DateTime? date,  String? label,  String? vaccinationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reminder() when $default != null:
return $default(_that.id,_that.type,_that.time,_that.enabled,_that.daysBefore,_that.timesPerDay,_that.date,_that.label,_that.vaccinationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ReminderType type,  ReminderTime time,  bool enabled,  int daysBefore,  int timesPerDay,  DateTime? date,  String? label,  String? vaccinationId)  $default,) {final _that = this;
switch (_that) {
case _Reminder():
return $default(_that.id,_that.type,_that.time,_that.enabled,_that.daysBefore,_that.timesPerDay,_that.date,_that.label,_that.vaccinationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ReminderType type,  ReminderTime time,  bool enabled,  int daysBefore,  int timesPerDay,  DateTime? date,  String? label,  String? vaccinationId)?  $default,) {final _that = this;
switch (_that) {
case _Reminder() when $default != null:
return $default(_that.id,_that.type,_that.time,_that.enabled,_that.daysBefore,_that.timesPerDay,_that.date,_that.label,_that.vaccinationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reminder extends Reminder {
  const _Reminder({required this.id, required this.type, required this.time, this.enabled = true, this.daysBefore = 3, this.timesPerDay = 4, this.date, this.label, this.vaccinationId}): super._();
  factory _Reminder.fromJson(Map<String, dynamic> json) => _$ReminderFromJson(json);

@override final  String id;
@override final  ReminderType type;
@override final  ReminderTime time;
@override@JsonKey() final  bool enabled;
/// How many days ahead to warn, for [ReminderType.periodComing].
@override@JsonKey() final  int daysBefore;
/// Times per day, for [ReminderType.water].
@override@JsonKey() final  int timesPerDay;
/// Fixed date for one-off reminders (doctor visits, vaccinations).
@override final  DateTime? date;
/// Free-text label shown instead of the default title.
@override final  String? label;
/// Links a [ReminderType.vaccination] reminder to its schedule entry.
@override final  String? vaccinationId;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderCopyWith<_Reminder> get copyWith => __$ReminderCopyWithImpl<_Reminder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reminder&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.time, time) || other.time == time)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.daysBefore, daysBefore) || other.daysBefore == daysBefore)&&(identical(other.timesPerDay, timesPerDay) || other.timesPerDay == timesPerDay)&&(identical(other.date, date) || other.date == date)&&(identical(other.label, label) || other.label == label)&&(identical(other.vaccinationId, vaccinationId) || other.vaccinationId == vaccinationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,time,enabled,daysBefore,timesPerDay,date,label,vaccinationId);
}

@override
String toString() {
    return 'Reminder(id: $id, type: $type, time: $time, enabled: $enabled, daysBefore: $daysBefore, timesPerDay: $timesPerDay, date: $date, label: $label, vaccinationId: $vaccinationId)';
}


}

/// @nodoc
abstract mixin class _$ReminderCopyWith<$Res> implements $ReminderCopyWith<$Res> {
  factory _$ReminderCopyWith(_Reminder value, $Res Function(_Reminder) _then) = __$ReminderCopyWithImpl;
@override @useResult
$Res call({
 String id, ReminderType type, ReminderTime time, bool enabled, int daysBefore, int timesPerDay, DateTime? date, String? label, String? vaccinationId
});


@override $ReminderTimeCopyWith<$Res> get time;

}
/// @nodoc
class __$ReminderCopyWithImpl<$Res>
    implements _$ReminderCopyWith<$Res> {
  __$ReminderCopyWithImpl(this._self, this._then);

  final _Reminder _self;
  final $Res Function(_Reminder) _then;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? time = null,Object? enabled = null,Object? daysBefore = null,Object? timesPerDay = null,Object? date = freezed,Object? label = freezed,Object? vaccinationId = freezed,}) {
  return _then(_Reminder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReminderType,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as ReminderTime,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,daysBefore: null == daysBefore ? _self.daysBefore : daysBefore // ignore: cast_nullable_to_non_nullable
as int,timesPerDay: null == timesPerDay ? _self.timesPerDay : timesPerDay // ignore: cast_nullable_to_non_nullable
as int,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,vaccinationId: freezed == vaccinationId ? _self.vaccinationId : vaccinationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderTimeCopyWith<$Res> get time {
  
  return $ReminderTimeCopyWith<$Res>(_self.time, (value) {
    return _then(_self.copyWith(time: value));
  });
}
}

// dart format on
