// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseProgress {

 String get courseId; List<String> get completedLessonIds;/// The lesson to resume from.
 String? get lastLessonId; DateTime get updatedAt; DateTime? get completedAt;
/// Create a copy of CourseProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseProgressCopyWith<CourseProgress> get copyWith => _$CourseProgressCopyWithImpl<CourseProgress>(this as CourseProgress, _$identity);

  /// Serializes this CourseProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CourseProgress;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseProgress&&(identical(other.courseId, _this.courseId) || other.courseId == _this.courseId)&&const DeepCollectionEquality().equals(other.completedLessonIds, _this.completedLessonIds)&&(identical(other.lastLessonId, _this.lastLessonId) || other.lastLessonId == _this.lastLessonId)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CourseProgress;
  return Object.hash(runtimeType,_this.courseId,const DeepCollectionEquality().hash(_this.completedLessonIds),_this.lastLessonId,_this.updatedAt,_this.completedAt);
}

@override
String toString() {
  final _this = this as CourseProgress;
  return 'CourseProgress(courseId: ${_this.courseId}, completedLessonIds: ${_this.completedLessonIds}, lastLessonId: ${_this.lastLessonId}, updatedAt: ${_this.updatedAt}, completedAt: ${_this.completedAt})';
}


}

/// @nodoc
abstract mixin class $CourseProgressCopyWith<$Res>  {
  factory $CourseProgressCopyWith(CourseProgress value, $Res Function(CourseProgress) _then) = _$CourseProgressCopyWithImpl;
@useResult
$Res call({
 String courseId, List<String> completedLessonIds, String? lastLessonId, DateTime updatedAt, DateTime? completedAt
});




}
/// @nodoc
class _$CourseProgressCopyWithImpl<$Res>
    implements $CourseProgressCopyWith<$Res> {
  _$CourseProgressCopyWithImpl(this._self, this._then);

  final CourseProgress _self;
  final $Res Function(CourseProgress) _then;

/// Create a copy of CourseProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? courseId = null,Object? completedLessonIds = null,Object? lastLessonId = freezed,Object? updatedAt = null,Object? completedAt = freezed,}) {
  return _then(CourseProgress(
courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,completedLessonIds: null == completedLessonIds ? _self.completedLessonIds : completedLessonIds // ignore: cast_nullable_to_non_nullable
as List<String>,lastLessonId: freezed == lastLessonId ? _self.lastLessonId : lastLessonId // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseProgress].
extension CourseProgressPatterns on CourseProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseProgress value)  $default,){
final _that = this;
switch (_that) {
case _CourseProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseProgress value)?  $default,){
final _that = this;
switch (_that) {
case _CourseProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String courseId,  List<String> completedLessonIds,  String? lastLessonId,  DateTime updatedAt,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseProgress() when $default != null:
return $default(_that.courseId,_that.completedLessonIds,_that.lastLessonId,_that.updatedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String courseId,  List<String> completedLessonIds,  String? lastLessonId,  DateTime updatedAt,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _CourseProgress():
return $default(_that.courseId,_that.completedLessonIds,_that.lastLessonId,_that.updatedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String courseId,  List<String> completedLessonIds,  String? lastLessonId,  DateTime updatedAt,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _CourseProgress() when $default != null:
return $default(_that.courseId,_that.completedLessonIds,_that.lastLessonId,_that.updatedAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseProgress extends CourseProgress {
  const _CourseProgress({required this.courseId,  List<String> completedLessonIds = const <String>[], this.lastLessonId, required this.updatedAt, this.completedAt}): _completedLessonIds = completedLessonIds,super._();
  factory _CourseProgress.fromJson(Map<String, dynamic> json) => _$CourseProgressFromJson(json);

@override final  String courseId;
 final  List<String> _completedLessonIds;
@override@JsonKey() List<String> get completedLessonIds {
  if (_completedLessonIds is EqualUnmodifiableListView) return _completedLessonIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedLessonIds);
}

/// The lesson to resume from.
@override final  String? lastLessonId;
@override final  DateTime updatedAt;
@override final  DateTime? completedAt;

/// Create a copy of CourseProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseProgressCopyWith<_CourseProgress> get copyWith => __$CourseProgressCopyWithImpl<_CourseProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseProgressToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseProgress&&(identical(other.courseId, courseId) || other.courseId == courseId)&&const DeepCollectionEquality().equals(other.completedLessonIds, _completedLessonIds)&&(identical(other.lastLessonId, lastLessonId) || other.lastLessonId == lastLessonId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,courseId,const DeepCollectionEquality().hash(_completedLessonIds),lastLessonId,updatedAt,completedAt);
}

@override
String toString() {
    return 'CourseProgress(courseId: $courseId, completedLessonIds: $completedLessonIds, lastLessonId: $lastLessonId, updatedAt: $updatedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$CourseProgressCopyWith<$Res> implements $CourseProgressCopyWith<$Res> {
  factory _$CourseProgressCopyWith(_CourseProgress value, $Res Function(_CourseProgress) _then) = __$CourseProgressCopyWithImpl;
@override @useResult
$Res call({
 String courseId, List<String> completedLessonIds, String? lastLessonId, DateTime updatedAt, DateTime? completedAt
});




}
/// @nodoc
class __$CourseProgressCopyWithImpl<$Res>
    implements _$CourseProgressCopyWith<$Res> {
  __$CourseProgressCopyWithImpl(this._self, this._then);

  final _CourseProgress _self;
  final $Res Function(_CourseProgress) _then;

/// Create a copy of CourseProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? courseId = null,Object? completedLessonIds = null,Object? lastLessonId = freezed,Object? updatedAt = null,Object? completedAt = freezed,}) {
  return _then(_CourseProgress(
courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,completedLessonIds: null == completedLessonIds ? _self._completedLessonIds : completedLessonIds // ignore: cast_nullable_to_non_nullable
as List<String>,lastLessonId: freezed == lastLessonId ? _self.lastLessonId : lastLessonId // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
