// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle_prediction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DateRange {

 DateTime get start; DateTime get end;
/// Create a copy of DateRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DateRangeCopyWith<DateRange> get copyWith => _$DateRangeCopyWithImpl<DateRange>(this as DateRange, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DateRange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DateRange&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.end, _this.end) || other.end == _this.end));
}


@override
int get hashCode {
  final _this = this as DateRange;
  return Object.hash(runtimeType,_this.start,_this.end);
}

@override
String toString() {
  final _this = this as DateRange;
  return 'DateRange(start: ${_this.start}, end: ${_this.end})';
}


}

/// @nodoc
abstract mixin class $DateRangeCopyWith<$Res>  {
  factory $DateRangeCopyWith(DateRange value, $Res Function(DateRange) _then) = _$DateRangeCopyWithImpl;
@useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class _$DateRangeCopyWithImpl<$Res>
    implements $DateRangeCopyWith<$Res> {
  _$DateRangeCopyWithImpl(this._self, this._then);

  final DateRange _self;
  final $Res Function(DateRange) _then;

/// Create a copy of DateRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(DateRange(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DateRange].
extension DateRangePatterns on DateRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DateRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DateRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DateRange value)  $default,){
final _that = this;
switch (_that) {
case _DateRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DateRange value)?  $default,){
final _that = this;
switch (_that) {
case _DateRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime start,  DateTime end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DateRange() when $default != null:
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime start,  DateTime end)  $default,) {final _that = this;
switch (_that) {
case _DateRange():
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime start,  DateTime end)?  $default,) {final _that = this;
switch (_that) {
case _DateRange() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc


class _DateRange extends DateRange {
  const _DateRange({required this.start, required this.end}): super._();
  

@override final  DateTime start;
@override final  DateTime end;

/// Create a copy of DateRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DateRangeCopyWith<_DateRange> get copyWith => __$DateRangeCopyWithImpl<_DateRange>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DateRange&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode {
    return Object.hash(runtimeType,start,end);
}

@override
String toString() {
    return 'DateRange(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$DateRangeCopyWith<$Res> implements $DateRangeCopyWith<$Res> {
  factory _$DateRangeCopyWith(_DateRange value, $Res Function(_DateRange) _then) = __$DateRangeCopyWithImpl;
@override @useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class __$DateRangeCopyWithImpl<$Res>
    implements _$DateRangeCopyWith<$Res> {
  __$DateRangeCopyWithImpl(this._self, this._then);

  final _DateRange _self;
  final $Res Function(_DateRange) _then;

/// Create a copy of DateRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_DateRange(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$CyclePrediction {

/// Start of the cycle this forecast is anchored to.
 DateTime get currentCycleStart; int get averageCycleLength; int get averagePeriodLength; DateTime get nextPeriodStart; DateRange get nextPeriod; DateTime get ovulationDate; DateRange get fertileWindow; PredictionConfidence get confidence;/// How many past cycles the averages came from.
 int get basedOnCycles;/// Spread between the shortest and longest cycle used, in days.
 int get variationInDays;
/// Create a copy of CyclePrediction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CyclePredictionCopyWith<CyclePrediction> get copyWith => _$CyclePredictionCopyWithImpl<CyclePrediction>(this as CyclePrediction, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CyclePrediction;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CyclePrediction&&(identical(other.currentCycleStart, _this.currentCycleStart) || other.currentCycleStart == _this.currentCycleStart)&&(identical(other.averageCycleLength, _this.averageCycleLength) || other.averageCycleLength == _this.averageCycleLength)&&(identical(other.averagePeriodLength, _this.averagePeriodLength) || other.averagePeriodLength == _this.averagePeriodLength)&&(identical(other.nextPeriodStart, _this.nextPeriodStart) || other.nextPeriodStart == _this.nextPeriodStart)&&(identical(other.nextPeriod, _this.nextPeriod) || other.nextPeriod == _this.nextPeriod)&&(identical(other.ovulationDate, _this.ovulationDate) || other.ovulationDate == _this.ovulationDate)&&(identical(other.fertileWindow, _this.fertileWindow) || other.fertileWindow == _this.fertileWindow)&&(identical(other.confidence, _this.confidence) || other.confidence == _this.confidence)&&(identical(other.basedOnCycles, _this.basedOnCycles) || other.basedOnCycles == _this.basedOnCycles)&&(identical(other.variationInDays, _this.variationInDays) || other.variationInDays == _this.variationInDays));
}


@override
int get hashCode {
  final _this = this as CyclePrediction;
  return Object.hash(runtimeType,_this.currentCycleStart,_this.averageCycleLength,_this.averagePeriodLength,_this.nextPeriodStart,_this.nextPeriod,_this.ovulationDate,_this.fertileWindow,_this.confidence,_this.basedOnCycles,_this.variationInDays);
}

@override
String toString() {
  final _this = this as CyclePrediction;
  return 'CyclePrediction(currentCycleStart: ${_this.currentCycleStart}, averageCycleLength: ${_this.averageCycleLength}, averagePeriodLength: ${_this.averagePeriodLength}, nextPeriodStart: ${_this.nextPeriodStart}, nextPeriod: ${_this.nextPeriod}, ovulationDate: ${_this.ovulationDate}, fertileWindow: ${_this.fertileWindow}, confidence: ${_this.confidence}, basedOnCycles: ${_this.basedOnCycles}, variationInDays: ${_this.variationInDays})';
}


}

/// @nodoc
abstract mixin class $CyclePredictionCopyWith<$Res>  {
  factory $CyclePredictionCopyWith(CyclePrediction value, $Res Function(CyclePrediction) _then) = _$CyclePredictionCopyWithImpl;
@useResult
$Res call({
 DateTime currentCycleStart, int averageCycleLength, int averagePeriodLength, DateTime nextPeriodStart, DateRange nextPeriod, DateTime ovulationDate, DateRange fertileWindow, PredictionConfidence confidence, int basedOnCycles, int variationInDays
});


$DateRangeCopyWith<$Res> get nextPeriod;$DateRangeCopyWith<$Res> get fertileWindow;

}
/// @nodoc
class _$CyclePredictionCopyWithImpl<$Res>
    implements $CyclePredictionCopyWith<$Res> {
  _$CyclePredictionCopyWithImpl(this._self, this._then);

  final CyclePrediction _self;
  final $Res Function(CyclePrediction) _then;

/// Create a copy of CyclePrediction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentCycleStart = null,Object? averageCycleLength = null,Object? averagePeriodLength = null,Object? nextPeriodStart = null,Object? nextPeriod = null,Object? ovulationDate = null,Object? fertileWindow = null,Object? confidence = null,Object? basedOnCycles = null,Object? variationInDays = null,}) {
  return _then(CyclePrediction(
currentCycleStart: null == currentCycleStart ? _self.currentCycleStart : currentCycleStart // ignore: cast_nullable_to_non_nullable
as DateTime,averageCycleLength: null == averageCycleLength ? _self.averageCycleLength : averageCycleLength // ignore: cast_nullable_to_non_nullable
as int,averagePeriodLength: null == averagePeriodLength ? _self.averagePeriodLength : averagePeriodLength // ignore: cast_nullable_to_non_nullable
as int,nextPeriodStart: null == nextPeriodStart ? _self.nextPeriodStart : nextPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime,nextPeriod: null == nextPeriod ? _self.nextPeriod : nextPeriod // ignore: cast_nullable_to_non_nullable
as DateRange,ovulationDate: null == ovulationDate ? _self.ovulationDate : ovulationDate // ignore: cast_nullable_to_non_nullable
as DateTime,fertileWindow: null == fertileWindow ? _self.fertileWindow : fertileWindow // ignore: cast_nullable_to_non_nullable
as DateRange,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as PredictionConfidence,basedOnCycles: null == basedOnCycles ? _self.basedOnCycles : basedOnCycles // ignore: cast_nullable_to_non_nullable
as int,variationInDays: null == variationInDays ? _self.variationInDays : variationInDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CyclePrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateRangeCopyWith<$Res> get nextPeriod {
  
  return $DateRangeCopyWith<$Res>(_self.nextPeriod, (value) {
    return _then(_self.copyWith(nextPeriod: value));
  });
}/// Create a copy of CyclePrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateRangeCopyWith<$Res> get fertileWindow {
  
  return $DateRangeCopyWith<$Res>(_self.fertileWindow, (value) {
    return _then(_self.copyWith(fertileWindow: value));
  });
}
}


/// Adds pattern-matching-related methods to [CyclePrediction].
extension CyclePredictionPatterns on CyclePrediction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CyclePrediction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CyclePrediction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CyclePrediction value)  $default,){
final _that = this;
switch (_that) {
case _CyclePrediction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CyclePrediction value)?  $default,){
final _that = this;
switch (_that) {
case _CyclePrediction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime currentCycleStart,  int averageCycleLength,  int averagePeriodLength,  DateTime nextPeriodStart,  DateRange nextPeriod,  DateTime ovulationDate,  DateRange fertileWindow,  PredictionConfidence confidence,  int basedOnCycles,  int variationInDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CyclePrediction() when $default != null:
return $default(_that.currentCycleStart,_that.averageCycleLength,_that.averagePeriodLength,_that.nextPeriodStart,_that.nextPeriod,_that.ovulationDate,_that.fertileWindow,_that.confidence,_that.basedOnCycles,_that.variationInDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime currentCycleStart,  int averageCycleLength,  int averagePeriodLength,  DateTime nextPeriodStart,  DateRange nextPeriod,  DateTime ovulationDate,  DateRange fertileWindow,  PredictionConfidence confidence,  int basedOnCycles,  int variationInDays)  $default,) {final _that = this;
switch (_that) {
case _CyclePrediction():
return $default(_that.currentCycleStart,_that.averageCycleLength,_that.averagePeriodLength,_that.nextPeriodStart,_that.nextPeriod,_that.ovulationDate,_that.fertileWindow,_that.confidence,_that.basedOnCycles,_that.variationInDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime currentCycleStart,  int averageCycleLength,  int averagePeriodLength,  DateTime nextPeriodStart,  DateRange nextPeriod,  DateTime ovulationDate,  DateRange fertileWindow,  PredictionConfidence confidence,  int basedOnCycles,  int variationInDays)?  $default,) {final _that = this;
switch (_that) {
case _CyclePrediction() when $default != null:
return $default(_that.currentCycleStart,_that.averageCycleLength,_that.averagePeriodLength,_that.nextPeriodStart,_that.nextPeriod,_that.ovulationDate,_that.fertileWindow,_that.confidence,_that.basedOnCycles,_that.variationInDays);case _:
  return null;

}
}

}

/// @nodoc


class _CyclePrediction extends CyclePrediction {
  const _CyclePrediction({required this.currentCycleStart, required this.averageCycleLength, required this.averagePeriodLength, required this.nextPeriodStart, required this.nextPeriod, required this.ovulationDate, required this.fertileWindow, required this.confidence, required this.basedOnCycles, required this.variationInDays}): super._();
  

/// Start of the cycle this forecast is anchored to.
@override final  DateTime currentCycleStart;
@override final  int averageCycleLength;
@override final  int averagePeriodLength;
@override final  DateTime nextPeriodStart;
@override final  DateRange nextPeriod;
@override final  DateTime ovulationDate;
@override final  DateRange fertileWindow;
@override final  PredictionConfidence confidence;
/// How many past cycles the averages came from.
@override final  int basedOnCycles;
/// Spread between the shortest and longest cycle used, in days.
@override final  int variationInDays;

/// Create a copy of CyclePrediction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CyclePredictionCopyWith<_CyclePrediction> get copyWith => __$CyclePredictionCopyWithImpl<_CyclePrediction>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CyclePrediction&&(identical(other.currentCycleStart, currentCycleStart) || other.currentCycleStart == currentCycleStart)&&(identical(other.averageCycleLength, averageCycleLength) || other.averageCycleLength == averageCycleLength)&&(identical(other.averagePeriodLength, averagePeriodLength) || other.averagePeriodLength == averagePeriodLength)&&(identical(other.nextPeriodStart, nextPeriodStart) || other.nextPeriodStart == nextPeriodStart)&&(identical(other.nextPeriod, nextPeriod) || other.nextPeriod == nextPeriod)&&(identical(other.ovulationDate, ovulationDate) || other.ovulationDate == ovulationDate)&&(identical(other.fertileWindow, fertileWindow) || other.fertileWindow == fertileWindow)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.basedOnCycles, basedOnCycles) || other.basedOnCycles == basedOnCycles)&&(identical(other.variationInDays, variationInDays) || other.variationInDays == variationInDays));
}


@override
int get hashCode {
    return Object.hash(runtimeType,currentCycleStart,averageCycleLength,averagePeriodLength,nextPeriodStart,nextPeriod,ovulationDate,fertileWindow,confidence,basedOnCycles,variationInDays);
}

@override
String toString() {
    return 'CyclePrediction(currentCycleStart: $currentCycleStart, averageCycleLength: $averageCycleLength, averagePeriodLength: $averagePeriodLength, nextPeriodStart: $nextPeriodStart, nextPeriod: $nextPeriod, ovulationDate: $ovulationDate, fertileWindow: $fertileWindow, confidence: $confidence, basedOnCycles: $basedOnCycles, variationInDays: $variationInDays)';
}


}

/// @nodoc
abstract mixin class _$CyclePredictionCopyWith<$Res> implements $CyclePredictionCopyWith<$Res> {
  factory _$CyclePredictionCopyWith(_CyclePrediction value, $Res Function(_CyclePrediction) _then) = __$CyclePredictionCopyWithImpl;
@override @useResult
$Res call({
 DateTime currentCycleStart, int averageCycleLength, int averagePeriodLength, DateTime nextPeriodStart, DateRange nextPeriod, DateTime ovulationDate, DateRange fertileWindow, PredictionConfidence confidence, int basedOnCycles, int variationInDays
});


@override $DateRangeCopyWith<$Res> get nextPeriod;@override $DateRangeCopyWith<$Res> get fertileWindow;

}
/// @nodoc
class __$CyclePredictionCopyWithImpl<$Res>
    implements _$CyclePredictionCopyWith<$Res> {
  __$CyclePredictionCopyWithImpl(this._self, this._then);

  final _CyclePrediction _self;
  final $Res Function(_CyclePrediction) _then;

/// Create a copy of CyclePrediction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentCycleStart = null,Object? averageCycleLength = null,Object? averagePeriodLength = null,Object? nextPeriodStart = null,Object? nextPeriod = null,Object? ovulationDate = null,Object? fertileWindow = null,Object? confidence = null,Object? basedOnCycles = null,Object? variationInDays = null,}) {
  return _then(_CyclePrediction(
currentCycleStart: null == currentCycleStart ? _self.currentCycleStart : currentCycleStart // ignore: cast_nullable_to_non_nullable
as DateTime,averageCycleLength: null == averageCycleLength ? _self.averageCycleLength : averageCycleLength // ignore: cast_nullable_to_non_nullable
as int,averagePeriodLength: null == averagePeriodLength ? _self.averagePeriodLength : averagePeriodLength // ignore: cast_nullable_to_non_nullable
as int,nextPeriodStart: null == nextPeriodStart ? _self.nextPeriodStart : nextPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime,nextPeriod: null == nextPeriod ? _self.nextPeriod : nextPeriod // ignore: cast_nullable_to_non_nullable
as DateRange,ovulationDate: null == ovulationDate ? _self.ovulationDate : ovulationDate // ignore: cast_nullable_to_non_nullable
as DateTime,fertileWindow: null == fertileWindow ? _self.fertileWindow : fertileWindow // ignore: cast_nullable_to_non_nullable
as DateRange,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as PredictionConfidence,basedOnCycles: null == basedOnCycles ? _self.basedOnCycles : basedOnCycles // ignore: cast_nullable_to_non_nullable
as int,variationInDays: null == variationInDays ? _self.variationInDays : variationInDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CyclePrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateRangeCopyWith<$Res> get nextPeriod {
  
  return $DateRangeCopyWith<$Res>(_self.nextPeriod, (value) {
    return _then(_self.copyWith(nextPeriod: value));
  });
}/// Create a copy of CyclePrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateRangeCopyWith<$Res> get fertileWindow {
  
  return $DateRangeCopyWith<$Res>(_self.fertileWindow, (value) {
    return _then(_self.copyWith(fertileWindow: value));
  });
}
}

// dart format on
