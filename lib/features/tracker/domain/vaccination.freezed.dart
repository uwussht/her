// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vaccination {

 String get id; VaccineCode get code; DateTime get dueDate; VaccinationStatus get status;/// False once she has edited or added it by hand, so the schedule stops
/// overwriting it.
 bool get suggested; String? get notes;
/// Create a copy of Vaccination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaccinationCopyWith<Vaccination> get copyWith => _$VaccinationCopyWithImpl<Vaccination>(this as Vaccination, _$identity);

  /// Serializes this Vaccination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Vaccination;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vaccination&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.dueDate, _this.dueDate) || other.dueDate == _this.dueDate)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.suggested, _this.suggested) || other.suggested == _this.suggested)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Vaccination;
  return Object.hash(runtimeType,_this.id,_this.code,_this.dueDate,_this.status,_this.suggested,_this.notes);
}

@override
String toString() {
  final _this = this as Vaccination;
  return 'Vaccination(id: ${_this.id}, code: ${_this.code}, dueDate: ${_this.dueDate}, status: ${_this.status}, suggested: ${_this.suggested}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $VaccinationCopyWith<$Res>  {
  factory $VaccinationCopyWith(Vaccination value, $Res Function(Vaccination) _then) = _$VaccinationCopyWithImpl;
@useResult
$Res call({
 String id, VaccineCode code, DateTime dueDate, VaccinationStatus status, bool suggested, String? notes
});




}
/// @nodoc
class _$VaccinationCopyWithImpl<$Res>
    implements $VaccinationCopyWith<$Res> {
  _$VaccinationCopyWithImpl(this._self, this._then);

  final Vaccination _self;
  final $Res Function(Vaccination) _then;

/// Create a copy of Vaccination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? dueDate = null,Object? status = null,Object? suggested = null,Object? notes = freezed,}) {
  return _then(Vaccination(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as VaccineCode,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VaccinationStatus,suggested: null == suggested ? _self.suggested : suggested // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Vaccination].
extension VaccinationPatterns on Vaccination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vaccination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vaccination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vaccination value)  $default,){
final _that = this;
switch (_that) {
case _Vaccination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vaccination value)?  $default,){
final _that = this;
switch (_that) {
case _Vaccination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  VaccineCode code,  DateTime dueDate,  VaccinationStatus status,  bool suggested,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vaccination() when $default != null:
return $default(_that.id,_that.code,_that.dueDate,_that.status,_that.suggested,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  VaccineCode code,  DateTime dueDate,  VaccinationStatus status,  bool suggested,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _Vaccination():
return $default(_that.id,_that.code,_that.dueDate,_that.status,_that.suggested,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  VaccineCode code,  DateTime dueDate,  VaccinationStatus status,  bool suggested,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _Vaccination() when $default != null:
return $default(_that.id,_that.code,_that.dueDate,_that.status,_that.suggested,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vaccination extends Vaccination {
  const _Vaccination({required this.id, required this.code, required this.dueDate, this.status = VaccinationStatus.planned, this.suggested = true, this.notes}): super._();
  factory _Vaccination.fromJson(Map<String, dynamic> json) => _$VaccinationFromJson(json);

@override final  String id;
@override final  VaccineCode code;
@override final  DateTime dueDate;
@override@JsonKey() final  VaccinationStatus status;
/// False once she has edited or added it by hand, so the schedule stops
/// overwriting it.
@override@JsonKey() final  bool suggested;
@override final  String? notes;

/// Create a copy of Vaccination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VaccinationCopyWith<_Vaccination> get copyWith => __$VaccinationCopyWithImpl<_Vaccination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VaccinationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vaccination&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.suggested, suggested) || other.suggested == suggested)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,dueDate,status,suggested,notes);
}

@override
String toString() {
    return 'Vaccination(id: $id, code: $code, dueDate: $dueDate, status: $status, suggested: $suggested, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$VaccinationCopyWith<$Res> implements $VaccinationCopyWith<$Res> {
  factory _$VaccinationCopyWith(_Vaccination value, $Res Function(_Vaccination) _then) = __$VaccinationCopyWithImpl;
@override @useResult
$Res call({
 String id, VaccineCode code, DateTime dueDate, VaccinationStatus status, bool suggested, String? notes
});




}
/// @nodoc
class __$VaccinationCopyWithImpl<$Res>
    implements _$VaccinationCopyWith<$Res> {
  __$VaccinationCopyWithImpl(this._self, this._then);

  final _Vaccination _self;
  final $Res Function(_Vaccination) _then;

/// Create a copy of Vaccination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? dueDate = null,Object? status = null,Object? suggested = null,Object? notes = freezed,}) {
  return _then(_Vaccination(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as VaccineCode,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VaccinationStatus,suggested: null == suggested ? _self.suggested : suggested // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
