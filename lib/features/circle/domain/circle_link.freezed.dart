// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circle_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CircleLink {

 String get id; LinkKind get kind; LinkSide get side; String get code; DateTime get createdAt; LinkStatus get status; String? get peerUid;/// What she calls him, so the screen does not just say "partner".
 String? get peerName;/// Scopes this account shares with the peer. Empty on the viewer side.
 Set<ShareScope> get shares; DateTime? get linkedAt;
/// Create a copy of CircleLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CircleLinkCopyWith<CircleLink> get copyWith => _$CircleLinkCopyWithImpl<CircleLink>(this as CircleLink, _$identity);

  /// Serializes this CircleLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CircleLink;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CircleLink&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.side, _this.side) || other.side == _this.side)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.peerUid, _this.peerUid) || other.peerUid == _this.peerUid)&&(identical(other.peerName, _this.peerName) || other.peerName == _this.peerName)&&const DeepCollectionEquality().equals(other.shares, _this.shares)&&(identical(other.linkedAt, _this.linkedAt) || other.linkedAt == _this.linkedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CircleLink;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.side,_this.code,_this.createdAt,_this.status,_this.peerUid,_this.peerName,const DeepCollectionEquality().hash(_this.shares),_this.linkedAt);
}

@override
String toString() {
  final _this = this as CircleLink;
  return 'CircleLink(id: ${_this.id}, kind: ${_this.kind}, side: ${_this.side}, code: ${_this.code}, createdAt: ${_this.createdAt}, status: ${_this.status}, peerUid: ${_this.peerUid}, peerName: ${_this.peerName}, shares: ${_this.shares}, linkedAt: ${_this.linkedAt})';
}


}

/// @nodoc
abstract mixin class $CircleLinkCopyWith<$Res>  {
  factory $CircleLinkCopyWith(CircleLink value, $Res Function(CircleLink) _then) = _$CircleLinkCopyWithImpl;
@useResult
$Res call({
 String id, LinkKind kind, LinkSide side, String code, DateTime createdAt, LinkStatus status, String? peerUid, String? peerName, Set<ShareScope> shares, DateTime? linkedAt
});




}
/// @nodoc
class _$CircleLinkCopyWithImpl<$Res>
    implements $CircleLinkCopyWith<$Res> {
  _$CircleLinkCopyWithImpl(this._self, this._then);

  final CircleLink _self;
  final $Res Function(CircleLink) _then;

/// Create a copy of CircleLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? side = null,Object? code = null,Object? createdAt = null,Object? status = null,Object? peerUid = freezed,Object? peerName = freezed,Object? shares = null,Object? linkedAt = freezed,}) {
  return _then(CircleLink(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as LinkKind,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as LinkSide,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LinkStatus,peerUid: freezed == peerUid ? _self.peerUid : peerUid // ignore: cast_nullable_to_non_nullable
as String?,peerName: freezed == peerName ? _self.peerName : peerName // ignore: cast_nullable_to_non_nullable
as String?,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as Set<ShareScope>,linkedAt: freezed == linkedAt ? _self.linkedAt : linkedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CircleLink].
extension CircleLinkPatterns on CircleLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CircleLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CircleLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CircleLink value)  $default,){
final _that = this;
switch (_that) {
case _CircleLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CircleLink value)?  $default,){
final _that = this;
switch (_that) {
case _CircleLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LinkKind kind,  LinkSide side,  String code,  DateTime createdAt,  LinkStatus status,  String? peerUid,  String? peerName,  Set<ShareScope> shares,  DateTime? linkedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CircleLink() when $default != null:
return $default(_that.id,_that.kind,_that.side,_that.code,_that.createdAt,_that.status,_that.peerUid,_that.peerName,_that.shares,_that.linkedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LinkKind kind,  LinkSide side,  String code,  DateTime createdAt,  LinkStatus status,  String? peerUid,  String? peerName,  Set<ShareScope> shares,  DateTime? linkedAt)  $default,) {final _that = this;
switch (_that) {
case _CircleLink():
return $default(_that.id,_that.kind,_that.side,_that.code,_that.createdAt,_that.status,_that.peerUid,_that.peerName,_that.shares,_that.linkedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LinkKind kind,  LinkSide side,  String code,  DateTime createdAt,  LinkStatus status,  String? peerUid,  String? peerName,  Set<ShareScope> shares,  DateTime? linkedAt)?  $default,) {final _that = this;
switch (_that) {
case _CircleLink() when $default != null:
return $default(_that.id,_that.kind,_that.side,_that.code,_that.createdAt,_that.status,_that.peerUid,_that.peerName,_that.shares,_that.linkedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CircleLink extends CircleLink {
  const _CircleLink({required this.id, required this.kind, required this.side, required this.code, required this.createdAt, this.status = LinkStatus.pending, this.peerUid, this.peerName,  Set<ShareScope> shares = const <ShareScope>{}, this.linkedAt}): _shares = shares,super._();
  factory _CircleLink.fromJson(Map<String, dynamic> json) => _$CircleLinkFromJson(json);

@override final  String id;
@override final  LinkKind kind;
@override final  LinkSide side;
@override final  String code;
@override final  DateTime createdAt;
@override@JsonKey() final  LinkStatus status;
@override final  String? peerUid;
/// What she calls him, so the screen does not just say "partner".
@override final  String? peerName;
/// Scopes this account shares with the peer. Empty on the viewer side.
 final  Set<ShareScope> _shares;
/// Scopes this account shares with the peer. Empty on the viewer side.
@override@JsonKey() Set<ShareScope> get shares {
  if (_shares is EqualUnmodifiableSetView) return _shares;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_shares);
}

@override final  DateTime? linkedAt;

/// Create a copy of CircleLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CircleLinkCopyWith<_CircleLink> get copyWith => __$CircleLinkCopyWithImpl<_CircleLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CircleLinkToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CircleLink&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.side, side) || other.side == side)&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.peerUid, peerUid) || other.peerUid == peerUid)&&(identical(other.peerName, peerName) || other.peerName == peerName)&&const DeepCollectionEquality().equals(other.shares, _shares)&&(identical(other.linkedAt, linkedAt) || other.linkedAt == linkedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,side,code,createdAt,status,peerUid,peerName,const DeepCollectionEquality().hash(_shares),linkedAt);
}

@override
String toString() {
    return 'CircleLink(id: $id, kind: $kind, side: $side, code: $code, createdAt: $createdAt, status: $status, peerUid: $peerUid, peerName: $peerName, shares: $shares, linkedAt: $linkedAt)';
}


}

/// @nodoc
abstract mixin class _$CircleLinkCopyWith<$Res> implements $CircleLinkCopyWith<$Res> {
  factory _$CircleLinkCopyWith(_CircleLink value, $Res Function(_CircleLink) _then) = __$CircleLinkCopyWithImpl;
@override @useResult
$Res call({
 String id, LinkKind kind, LinkSide side, String code, DateTime createdAt, LinkStatus status, String? peerUid, String? peerName, Set<ShareScope> shares, DateTime? linkedAt
});




}
/// @nodoc
class __$CircleLinkCopyWithImpl<$Res>
    implements _$CircleLinkCopyWith<$Res> {
  __$CircleLinkCopyWithImpl(this._self, this._then);

  final _CircleLink _self;
  final $Res Function(_CircleLink) _then;

/// Create a copy of CircleLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? side = null,Object? code = null,Object? createdAt = null,Object? status = null,Object? peerUid = freezed,Object? peerName = freezed,Object? shares = null,Object? linkedAt = freezed,}) {
  return _then(_CircleLink(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as LinkKind,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as LinkSide,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LinkStatus,peerUid: freezed == peerUid ? _self.peerUid : peerUid // ignore: cast_nullable_to_non_nullable
as String?,peerName: freezed == peerName ? _self.peerName : peerName // ignore: cast_nullable_to_non_nullable
as String?,shares: null == shares ? _self._shares : shares // ignore: cast_nullable_to_non_nullable
as Set<ShareScope>,linkedAt: freezed == linkedAt ? _self.linkedAt : linkedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
