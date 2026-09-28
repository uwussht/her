// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kick_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KickSession {

 String get id; DateTime get startedAt;/// When each movement was tapped, oldest first.
 List<DateTime> get kicks;/// Set when she stopped counting, or when the target was reached.
 DateTime? get endedAt;
/// Create a copy of KickSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KickSessionCopyWith<KickSession> get copyWith => _$KickSessionCopyWithImpl<KickSession>(this as KickSession, _$identity);

  /// Serializes this KickSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as KickSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KickSession&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&const DeepCollectionEquality().equals(other.kicks, _this.kicks)&&(identical(other.endedAt, _this.endedAt) || other.endedAt == _this.endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as KickSession;
  return Object.hash(runtimeType,_this.id,_this.startedAt,const DeepCollectionEquality().hash(_this.kicks),_this.endedAt);
}

@override
String toString() {
  final _this = this as KickSession;
  return 'KickSession(id: ${_this.id}, startedAt: ${_this.startedAt}, kicks: ${_this.kicks}, endedAt: ${_this.endedAt})';
}


}

/// @nodoc
abstract mixin class $KickSessionCopyWith<$Res>  {
  factory $KickSessionCopyWith(KickSession value, $Res Function(KickSession) _then) = _$KickSessionCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startedAt, List<DateTime> kicks, DateTime? endedAt
});




}
/// @nodoc
class _$KickSessionCopyWithImpl<$Res>
    implements $KickSessionCopyWith<$Res> {
  _$KickSessionCopyWithImpl(this._self, this._then);

  final KickSession _self;
  final $Res Function(KickSession) _then;

/// Create a copy of KickSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startedAt = null,Object? kicks = null,Object? endedAt = freezed,}) {
  return _then(KickSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,kicks: null == kicks ? _self.kicks : kicks // ignore: cast_nullable_to_non_nullable
as List<DateTime>,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [KickSession].
extension KickSessionPatterns on KickSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KickSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KickSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KickSession value)  $default,){
final _that = this;
switch (_that) {
case _KickSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KickSession value)?  $default,){
final _that = this;
switch (_that) {
case _KickSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime startedAt,  List<DateTime> kicks,  DateTime? endedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KickSession() when $default != null:
return $default(_that.id,_that.startedAt,_that.kicks,_that.endedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime startedAt,  List<DateTime> kicks,  DateTime? endedAt)  $default,) {final _that = this;
switch (_that) {
case _KickSession():
return $default(_that.id,_that.startedAt,_that.kicks,_that.endedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime startedAt,  List<DateTime> kicks,  DateTime? endedAt)?  $default,) {final _that = this;
switch (_that) {
case _KickSession() when $default != null:
return $default(_that.id,_that.startedAt,_that.kicks,_that.endedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KickSession extends KickSession {
  const _KickSession({required this.id, required this.startedAt,  List<DateTime> kicks = const <DateTime>[], this.endedAt}): _kicks = kicks,super._();
  factory _KickSession.fromJson(Map<String, dynamic> json) => _$KickSessionFromJson(json);

@override final  String id;
@override final  DateTime startedAt;
/// When each movement was tapped, oldest first.
 final  List<DateTime> _kicks;
/// When each movement was tapped, oldest first.
@override@JsonKey() List<DateTime> get kicks {
  if (_kicks is EqualUnmodifiableListView) return _kicks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_kicks);
}

/// Set when she stopped counting, or when the target was reached.
@override final  DateTime? endedAt;

/// Create a copy of KickSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KickSessionCopyWith<_KickSession> get copyWith => __$KickSessionCopyWithImpl<_KickSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KickSessionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _KickSession&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&const DeepCollectionEquality().equals(other.kicks, _kicks)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startedAt,const DeepCollectionEquality().hash(_kicks),endedAt);
}

@override
String toString() {
    return 'KickSession(id: $id, startedAt: $startedAt, kicks: $kicks, endedAt: $endedAt)';
}


}

/// @nodoc
abstract mixin class _$KickSessionCopyWith<$Res> implements $KickSessionCopyWith<$Res> {
  factory _$KickSessionCopyWith(_KickSession value, $Res Function(_KickSession) _then) = __$KickSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startedAt, List<DateTime> kicks, DateTime? endedAt
});




}
/// @nodoc
class __$KickSessionCopyWithImpl<$Res>
    implements _$KickSessionCopyWith<$Res> {
  __$KickSessionCopyWithImpl(this._self, this._then);

  final _KickSession _self;
  final $Res Function(_KickSession) _then;

/// Create a copy of KickSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startedAt = null,Object? kicks = null,Object? endedAt = freezed,}) {
  return _then(_KickSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,kicks: null == kicks ? _self._kicks : kicks // ignore: cast_nullable_to_non_nullable
as List<DateTime>,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
