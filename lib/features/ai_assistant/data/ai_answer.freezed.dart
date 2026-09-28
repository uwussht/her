// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiAnswer {

 String get id;/// Phrases that select this answer, per language.
///
/// Stored as stems (lowercase, trailing vowels and soft signs trimmed:
/// `желез`, not `железо`), because they are matched as substrings and
/// Russian and Kazakh inflect the ending of almost every word.
 Map<String, List<String>> get keywords;@LocalizedTextConverter() LocalizedText get answer; List<ChatReference> get references;
/// Create a copy of AiAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiAnswerCopyWith<AiAnswer> get copyWith => _$AiAnswerCopyWithImpl<AiAnswer>(this as AiAnswer, _$identity);

  /// Serializes this AiAnswer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AiAnswer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiAnswer&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.keywords, _this.keywords)&&(identical(other.answer, _this.answer) || other.answer == _this.answer)&&const DeepCollectionEquality().equals(other.references, _this.references));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AiAnswer;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.keywords),_this.answer,const DeepCollectionEquality().hash(_this.references));
}

@override
String toString() {
  final _this = this as AiAnswer;
  return 'AiAnswer(id: ${_this.id}, keywords: ${_this.keywords}, answer: ${_this.answer}, references: ${_this.references})';
}


}

/// @nodoc
abstract mixin class $AiAnswerCopyWith<$Res>  {
  factory $AiAnswerCopyWith(AiAnswer value, $Res Function(AiAnswer) _then) = _$AiAnswerCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, List<String>> keywords,@LocalizedTextConverter() LocalizedText answer, List<ChatReference> references
});




}
/// @nodoc
class _$AiAnswerCopyWithImpl<$Res>
    implements $AiAnswerCopyWith<$Res> {
  _$AiAnswerCopyWithImpl(this._self, this._then);

  final AiAnswer _self;
  final $Res Function(AiAnswer) _then;

/// Create a copy of AiAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? keywords = null,Object? answer = null,Object? references = null,}) {
  return _then(AiAnswer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as LocalizedText,references: null == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as List<ChatReference>,
  ));
}

}


/// Adds pattern-matching-related methods to [AiAnswer].
extension AiAnswerPatterns on AiAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiAnswer value)  $default,){
final _that = this;
switch (_that) {
case _AiAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _AiAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Map<String, List<String>> keywords, @LocalizedTextConverter()  LocalizedText answer,  List<ChatReference> references)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiAnswer() when $default != null:
return $default(_that.id,_that.keywords,_that.answer,_that.references);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Map<String, List<String>> keywords, @LocalizedTextConverter()  LocalizedText answer,  List<ChatReference> references)  $default,) {final _that = this;
switch (_that) {
case _AiAnswer():
return $default(_that.id,_that.keywords,_that.answer,_that.references);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Map<String, List<String>> keywords, @LocalizedTextConverter()  LocalizedText answer,  List<ChatReference> references)?  $default,) {final _that = this;
switch (_that) {
case _AiAnswer() when $default != null:
return $default(_that.id,_that.keywords,_that.answer,_that.references);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiAnswer extends AiAnswer {
  const _AiAnswer({required this.id,  Map<String, List<String>> keywords = const <String, List<String>>{}, @LocalizedTextConverter() required this.answer,  List<ChatReference> references = const <ChatReference>[]}): _keywords = keywords,_references = references,super._();
  factory _AiAnswer.fromJson(Map<String, dynamic> json) => _$AiAnswerFromJson(json);

@override final  String id;
/// Phrases that select this answer, per language.
///
/// Stored as stems (lowercase, trailing vowels and soft signs trimmed:
/// `желез`, not `железо`), because they are matched as substrings and
/// Russian and Kazakh inflect the ending of almost every word.
 final  Map<String, List<String>> _keywords;
/// Phrases that select this answer, per language.
///
/// Stored as stems (lowercase, trailing vowels and soft signs trimmed:
/// `желез`, not `железо`), because they are matched as substrings and
/// Russian and Kazakh inflect the ending of almost every word.
@override@JsonKey() Map<String, List<String>> get keywords {
  if (_keywords is EqualUnmodifiableMapView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_keywords);
}

@override@LocalizedTextConverter() final  LocalizedText answer;
 final  List<ChatReference> _references;
@override@JsonKey() List<ChatReference> get references {
  if (_references is EqualUnmodifiableListView) return _references;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_references);
}


/// Create a copy of AiAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiAnswerCopyWith<_AiAnswer> get copyWith => __$AiAnswerCopyWithImpl<_AiAnswer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiAnswerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiAnswer&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.keywords, _keywords)&&(identical(other.answer, answer) || other.answer == answer)&&const DeepCollectionEquality().equals(other.references, _references));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_keywords),answer,const DeepCollectionEquality().hash(_references));
}

@override
String toString() {
    return 'AiAnswer(id: $id, keywords: $keywords, answer: $answer, references: $references)';
}


}

/// @nodoc
abstract mixin class _$AiAnswerCopyWith<$Res> implements $AiAnswerCopyWith<$Res> {
  factory _$AiAnswerCopyWith(_AiAnswer value, $Res Function(_AiAnswer) _then) = __$AiAnswerCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, List<String>> keywords,@LocalizedTextConverter() LocalizedText answer, List<ChatReference> references
});




}
/// @nodoc
class __$AiAnswerCopyWithImpl<$Res>
    implements _$AiAnswerCopyWith<$Res> {
  __$AiAnswerCopyWithImpl(this._self, this._then);

  final _AiAnswer _self;
  final $Res Function(_AiAnswer) _then;

/// Create a copy of AiAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? keywords = null,Object? answer = null,Object? references = null,}) {
  return _then(_AiAnswer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as LocalizedText,references: null == references ? _self._references : references // ignore: cast_nullable_to_non_nullable
as List<ChatReference>,
  ));
}


}

// dart format on
