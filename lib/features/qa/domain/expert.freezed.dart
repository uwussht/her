// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Expert {

 String get id; String get name;@LocalizedTextConverter() LocalizedText get specialty;/// Credentials checked by the Her Circle team: shows the verified badge.
 bool get verified; String? get photoUrl; String? get city; int? get yearsOfPractice;
/// Create a copy of Expert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpertCopyWith<Expert> get copyWith => _$ExpertCopyWithImpl<Expert>(this as Expert, _$identity);

  /// Serializes this Expert to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Expert;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Expert&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.specialty, _this.specialty) || other.specialty == _this.specialty)&&(identical(other.verified, _this.verified) || other.verified == _this.verified)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.yearsOfPractice, _this.yearsOfPractice) || other.yearsOfPractice == _this.yearsOfPractice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Expert;
  return Object.hash(runtimeType,_this.id,_this.name,_this.specialty,_this.verified,_this.photoUrl,_this.city,_this.yearsOfPractice);
}

@override
String toString() {
  final _this = this as Expert;
  return 'Expert(id: ${_this.id}, name: ${_this.name}, specialty: ${_this.specialty}, verified: ${_this.verified}, photoUrl: ${_this.photoUrl}, city: ${_this.city}, yearsOfPractice: ${_this.yearsOfPractice})';
}


}

/// @nodoc
abstract mixin class $ExpertCopyWith<$Res>  {
  factory $ExpertCopyWith(Expert value, $Res Function(Expert) _then) = _$ExpertCopyWithImpl;
@useResult
$Res call({
 String id, String name,@LocalizedTextConverter() LocalizedText specialty, bool verified, String? photoUrl, String? city, int? yearsOfPractice
});




}
/// @nodoc
class _$ExpertCopyWithImpl<$Res>
    implements $ExpertCopyWith<$Res> {
  _$ExpertCopyWithImpl(this._self, this._then);

  final Expert _self;
  final $Res Function(Expert) _then;

/// Create a copy of Expert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? specialty = null,Object? verified = null,Object? photoUrl = freezed,Object? city = freezed,Object? yearsOfPractice = freezed,}) {
  return _then(Expert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as LocalizedText,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,yearsOfPractice: freezed == yearsOfPractice ? _self.yearsOfPractice : yearsOfPractice // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Expert].
extension ExpertPatterns on Expert {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Expert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Expert() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Expert value)  $default,){
final _that = this;
switch (_that) {
case _Expert():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Expert value)?  $default,){
final _that = this;
switch (_that) {
case _Expert() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @LocalizedTextConverter()  LocalizedText specialty,  bool verified,  String? photoUrl,  String? city,  int? yearsOfPractice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Expert() when $default != null:
return $default(_that.id,_that.name,_that.specialty,_that.verified,_that.photoUrl,_that.city,_that.yearsOfPractice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @LocalizedTextConverter()  LocalizedText specialty,  bool verified,  String? photoUrl,  String? city,  int? yearsOfPractice)  $default,) {final _that = this;
switch (_that) {
case _Expert():
return $default(_that.id,_that.name,_that.specialty,_that.verified,_that.photoUrl,_that.city,_that.yearsOfPractice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @LocalizedTextConverter()  LocalizedText specialty,  bool verified,  String? photoUrl,  String? city,  int? yearsOfPractice)?  $default,) {final _that = this;
switch (_that) {
case _Expert() when $default != null:
return $default(_that.id,_that.name,_that.specialty,_that.verified,_that.photoUrl,_that.city,_that.yearsOfPractice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Expert implements Expert {
  const _Expert({required this.id, required this.name, @LocalizedTextConverter() required this.specialty, this.verified = true, this.photoUrl, this.city, this.yearsOfPractice});
  factory _Expert.fromJson(Map<String, dynamic> json) => _$ExpertFromJson(json);

@override final  String id;
@override final  String name;
@override@LocalizedTextConverter() final  LocalizedText specialty;
/// Credentials checked by the Her Circle team: shows the verified badge.
@override@JsonKey() final  bool verified;
@override final  String? photoUrl;
@override final  String? city;
@override final  int? yearsOfPractice;

/// Create a copy of Expert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpertCopyWith<_Expert> get copyWith => __$ExpertCopyWithImpl<_Expert>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpertToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Expert&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.city, city) || other.city == city)&&(identical(other.yearsOfPractice, yearsOfPractice) || other.yearsOfPractice == yearsOfPractice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,specialty,verified,photoUrl,city,yearsOfPractice);
}

@override
String toString() {
    return 'Expert(id: $id, name: $name, specialty: $specialty, verified: $verified, photoUrl: $photoUrl, city: $city, yearsOfPractice: $yearsOfPractice)';
}


}

/// @nodoc
abstract mixin class _$ExpertCopyWith<$Res> implements $ExpertCopyWith<$Res> {
  factory _$ExpertCopyWith(_Expert value, $Res Function(_Expert) _then) = __$ExpertCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@LocalizedTextConverter() LocalizedText specialty, bool verified, String? photoUrl, String? city, int? yearsOfPractice
});




}
/// @nodoc
class __$ExpertCopyWithImpl<$Res>
    implements _$ExpertCopyWith<$Res> {
  __$ExpertCopyWithImpl(this._self, this._then);

  final _Expert _self;
  final $Res Function(_Expert) _then;

/// Create a copy of Expert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? specialty = null,Object? verified = null,Object? photoUrl = freezed,Object? city = freezed,Object? yearsOfPractice = freezed,}) {
  return _then(_Expert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as LocalizedText,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,yearsOfPractice: freezed == yearsOfPractice ? _self.yearsOfPractice : yearsOfPractice // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
