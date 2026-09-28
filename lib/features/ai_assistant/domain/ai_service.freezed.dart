// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiChatRequest {

 String get message; AiUserContext get userContext;
/// Create a copy of AiChatRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiChatRequestCopyWith<AiChatRequest> get copyWith => _$AiChatRequestCopyWithImpl<AiChatRequest>(this as AiChatRequest, _$identity);

  /// Serializes this AiChatRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AiChatRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiChatRequest&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.userContext, _this.userContext) || other.userContext == _this.userContext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AiChatRequest;
  return Object.hash(runtimeType,_this.message,_this.userContext);
}

@override
String toString() {
  final _this = this as AiChatRequest;
  return 'AiChatRequest(message: ${_this.message}, userContext: ${_this.userContext})';
}


}

/// @nodoc
abstract mixin class $AiChatRequestCopyWith<$Res>  {
  factory $AiChatRequestCopyWith(AiChatRequest value, $Res Function(AiChatRequest) _then) = _$AiChatRequestCopyWithImpl;
@useResult
$Res call({
 String message, AiUserContext userContext
});


$AiUserContextCopyWith<$Res> get userContext;

}
/// @nodoc
class _$AiChatRequestCopyWithImpl<$Res>
    implements $AiChatRequestCopyWith<$Res> {
  _$AiChatRequestCopyWithImpl(this._self, this._then);

  final AiChatRequest _self;
  final $Res Function(AiChatRequest) _then;

/// Create a copy of AiChatRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? userContext = null,}) {
  return _then(AiChatRequest(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,userContext: null == userContext ? _self.userContext : userContext // ignore: cast_nullable_to_non_nullable
as AiUserContext,
  ));
}
/// Create a copy of AiChatRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiUserContextCopyWith<$Res> get userContext {
  
  return $AiUserContextCopyWith<$Res>(_self.userContext, (value) {
    return _then(_self.copyWith(userContext: value));
  });
}
}


/// Adds pattern-matching-related methods to [AiChatRequest].
extension AiChatRequestPatterns on AiChatRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiChatRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiChatRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiChatRequest value)  $default,){
final _that = this;
switch (_that) {
case _AiChatRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiChatRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AiChatRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  AiUserContext userContext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiChatRequest() when $default != null:
return $default(_that.message,_that.userContext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  AiUserContext userContext)  $default,) {final _that = this;
switch (_that) {
case _AiChatRequest():
return $default(_that.message,_that.userContext);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  AiUserContext userContext)?  $default,) {final _that = this;
switch (_that) {
case _AiChatRequest() when $default != null:
return $default(_that.message,_that.userContext);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiChatRequest implements AiChatRequest {
  const _AiChatRequest({required this.message, required this.userContext});
  factory _AiChatRequest.fromJson(Map<String, dynamic> json) => _$AiChatRequestFromJson(json);

@override final  String message;
@override final  AiUserContext userContext;

/// Create a copy of AiChatRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiChatRequestCopyWith<_AiChatRequest> get copyWith => __$AiChatRequestCopyWithImpl<_AiChatRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiChatRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiChatRequest&&(identical(other.message, message) || other.message == message)&&(identical(other.userContext, userContext) || other.userContext == userContext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,message,userContext);
}

@override
String toString() {
    return 'AiChatRequest(message: $message, userContext: $userContext)';
}


}

/// @nodoc
abstract mixin class _$AiChatRequestCopyWith<$Res> implements $AiChatRequestCopyWith<$Res> {
  factory _$AiChatRequestCopyWith(_AiChatRequest value, $Res Function(_AiChatRequest) _then) = __$AiChatRequestCopyWithImpl;
@override @useResult
$Res call({
 String message, AiUserContext userContext
});


@override $AiUserContextCopyWith<$Res> get userContext;

}
/// @nodoc
class __$AiChatRequestCopyWithImpl<$Res>
    implements _$AiChatRequestCopyWith<$Res> {
  __$AiChatRequestCopyWithImpl(this._self, this._then);

  final _AiChatRequest _self;
  final $Res Function(_AiChatRequest) _then;

/// Create a copy of AiChatRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? userContext = null,}) {
  return _then(_AiChatRequest(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,userContext: null == userContext ? _self.userContext : userContext // ignore: cast_nullable_to_non_nullable
as AiUserContext,
  ));
}

/// Create a copy of AiChatRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiUserContextCopyWith<$Res> get userContext {
  
  return $AiUserContextCopyWith<$Res>(_self.userContext, (value) {
    return _then(_self.copyWith(userContext: value));
  });
}
}


/// @nodoc
mixin _$AiChatResponse {

 String get reply; List<ChatReference> get references;/// The backend recognised an emergency and wants the urgent-care card
/// shown. The app also detects this on its own, before sending.
 bool get emergency;
/// Create a copy of AiChatResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiChatResponseCopyWith<AiChatResponse> get copyWith => _$AiChatResponseCopyWithImpl<AiChatResponse>(this as AiChatResponse, _$identity);

  /// Serializes this AiChatResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AiChatResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiChatResponse&&(identical(other.reply, _this.reply) || other.reply == _this.reply)&&const DeepCollectionEquality().equals(other.references, _this.references)&&(identical(other.emergency, _this.emergency) || other.emergency == _this.emergency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AiChatResponse;
  return Object.hash(runtimeType,_this.reply,const DeepCollectionEquality().hash(_this.references),_this.emergency);
}

@override
String toString() {
  final _this = this as AiChatResponse;
  return 'AiChatResponse(reply: ${_this.reply}, references: ${_this.references}, emergency: ${_this.emergency})';
}


}

/// @nodoc
abstract mixin class $AiChatResponseCopyWith<$Res>  {
  factory $AiChatResponseCopyWith(AiChatResponse value, $Res Function(AiChatResponse) _then) = _$AiChatResponseCopyWithImpl;
@useResult
$Res call({
 String reply, List<ChatReference> references, bool emergency
});




}
/// @nodoc
class _$AiChatResponseCopyWithImpl<$Res>
    implements $AiChatResponseCopyWith<$Res> {
  _$AiChatResponseCopyWithImpl(this._self, this._then);

  final AiChatResponse _self;
  final $Res Function(AiChatResponse) _then;

/// Create a copy of AiChatResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reply = null,Object? references = null,Object? emergency = null,}) {
  return _then(AiChatResponse(
reply: null == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as String,references: null == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as List<ChatReference>,emergency: null == emergency ? _self.emergency : emergency // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AiChatResponse].
extension AiChatResponsePatterns on AiChatResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiChatResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiChatResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiChatResponse value)  $default,){
final _that = this;
switch (_that) {
case _AiChatResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiChatResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AiChatResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reply,  List<ChatReference> references,  bool emergency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiChatResponse() when $default != null:
return $default(_that.reply,_that.references,_that.emergency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reply,  List<ChatReference> references,  bool emergency)  $default,) {final _that = this;
switch (_that) {
case _AiChatResponse():
return $default(_that.reply,_that.references,_that.emergency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reply,  List<ChatReference> references,  bool emergency)?  $default,) {final _that = this;
switch (_that) {
case _AiChatResponse() when $default != null:
return $default(_that.reply,_that.references,_that.emergency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiChatResponse implements AiChatResponse {
  const _AiChatResponse({required this.reply,  List<ChatReference> references = const <ChatReference>[], this.emergency = false}): _references = references;
  factory _AiChatResponse.fromJson(Map<String, dynamic> json) => _$AiChatResponseFromJson(json);

@override final  String reply;
 final  List<ChatReference> _references;
@override@JsonKey() List<ChatReference> get references {
  if (_references is EqualUnmodifiableListView) return _references;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_references);
}

/// The backend recognised an emergency and wants the urgent-care card
/// shown. The app also detects this on its own, before sending.
@override@JsonKey() final  bool emergency;

/// Create a copy of AiChatResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiChatResponseCopyWith<_AiChatResponse> get copyWith => __$AiChatResponseCopyWithImpl<_AiChatResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiChatResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiChatResponse&&(identical(other.reply, reply) || other.reply == reply)&&const DeepCollectionEquality().equals(other.references, _references)&&(identical(other.emergency, emergency) || other.emergency == emergency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,reply,const DeepCollectionEquality().hash(_references),emergency);
}

@override
String toString() {
    return 'AiChatResponse(reply: $reply, references: $references, emergency: $emergency)';
}


}

/// @nodoc
abstract mixin class _$AiChatResponseCopyWith<$Res> implements $AiChatResponseCopyWith<$Res> {
  factory _$AiChatResponseCopyWith(_AiChatResponse value, $Res Function(_AiChatResponse) _then) = __$AiChatResponseCopyWithImpl;
@override @useResult
$Res call({
 String reply, List<ChatReference> references, bool emergency
});




}
/// @nodoc
class __$AiChatResponseCopyWithImpl<$Res>
    implements _$AiChatResponseCopyWith<$Res> {
  __$AiChatResponseCopyWithImpl(this._self, this._then);

  final _AiChatResponse _self;
  final $Res Function(_AiChatResponse) _then;

/// Create a copy of AiChatResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reply = null,Object? references = null,Object? emergency = null,}) {
  return _then(_AiChatResponse(
reply: null == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as String,references: null == references ? _self._references : references // ignore: cast_nullable_to_non_nullable
as List<ChatReference>,emergency: null == emergency ? _self.emergency : emergency // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
