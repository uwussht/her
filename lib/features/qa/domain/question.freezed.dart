// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Answer {

 String get id; String get questionId; String get expertId;@LocalizedTextConverter() LocalizedText get body; DateTime get answeredAt; int get upvotes;
/// Create a copy of Answer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnswerCopyWith<Answer> get copyWith => _$AnswerCopyWithImpl<Answer>(this as Answer, _$identity);

  /// Serializes this Answer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Answer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Answer&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.questionId, _this.questionId) || other.questionId == _this.questionId)&&(identical(other.expertId, _this.expertId) || other.expertId == _this.expertId)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.answeredAt, _this.answeredAt) || other.answeredAt == _this.answeredAt)&&(identical(other.upvotes, _this.upvotes) || other.upvotes == _this.upvotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Answer;
  return Object.hash(runtimeType,_this.id,_this.questionId,_this.expertId,_this.body,_this.answeredAt,_this.upvotes);
}

@override
String toString() {
  final _this = this as Answer;
  return 'Answer(id: ${_this.id}, questionId: ${_this.questionId}, expertId: ${_this.expertId}, body: ${_this.body}, answeredAt: ${_this.answeredAt}, upvotes: ${_this.upvotes})';
}


}

/// @nodoc
abstract mixin class $AnswerCopyWith<$Res>  {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) _then) = _$AnswerCopyWithImpl;
@useResult
$Res call({
 String id, String questionId, String expertId,@LocalizedTextConverter() LocalizedText body, DateTime answeredAt, int upvotes
});




}
/// @nodoc
class _$AnswerCopyWithImpl<$Res>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._self, this._then);

  final Answer _self;
  final $Res Function(Answer) _then;

/// Create a copy of Answer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? questionId = null,Object? expertId = null,Object? body = null,Object? answeredAt = null,Object? upvotes = null,}) {
  return _then(Answer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,expertId: null == expertId ? _self.expertId : expertId // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as LocalizedText,answeredAt: null == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Answer].
extension AnswerPatterns on Answer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Answer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Answer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Answer value)  $default,){
final _that = this;
switch (_that) {
case _Answer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Answer value)?  $default,){
final _that = this;
switch (_that) {
case _Answer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String questionId,  String expertId, @LocalizedTextConverter()  LocalizedText body,  DateTime answeredAt,  int upvotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Answer() when $default != null:
return $default(_that.id,_that.questionId,_that.expertId,_that.body,_that.answeredAt,_that.upvotes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String questionId,  String expertId, @LocalizedTextConverter()  LocalizedText body,  DateTime answeredAt,  int upvotes)  $default,) {final _that = this;
switch (_that) {
case _Answer():
return $default(_that.id,_that.questionId,_that.expertId,_that.body,_that.answeredAt,_that.upvotes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String questionId,  String expertId, @LocalizedTextConverter()  LocalizedText body,  DateTime answeredAt,  int upvotes)?  $default,) {final _that = this;
switch (_that) {
case _Answer() when $default != null:
return $default(_that.id,_that.questionId,_that.expertId,_that.body,_that.answeredAt,_that.upvotes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Answer implements Answer {
  const _Answer({required this.id, required this.questionId, required this.expertId, @LocalizedTextConverter() required this.body, required this.answeredAt, this.upvotes = 0});
  factory _Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

@override final  String id;
@override final  String questionId;
@override final  String expertId;
@override@LocalizedTextConverter() final  LocalizedText body;
@override final  DateTime answeredAt;
@override@JsonKey() final  int upvotes;

/// Create a copy of Answer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerCopyWith<_Answer> get copyWith => __$AnswerCopyWithImpl<_Answer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnswerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Answer&&(identical(other.id, id) || other.id == id)&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.expertId, expertId) || other.expertId == expertId)&&(identical(other.body, body) || other.body == body)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,questionId,expertId,body,answeredAt,upvotes);
}

@override
String toString() {
    return 'Answer(id: $id, questionId: $questionId, expertId: $expertId, body: $body, answeredAt: $answeredAt, upvotes: $upvotes)';
}


}

/// @nodoc
abstract mixin class _$AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$AnswerCopyWith(_Answer value, $Res Function(_Answer) _then) = __$AnswerCopyWithImpl;
@override @useResult
$Res call({
 String id, String questionId, String expertId,@LocalizedTextConverter() LocalizedText body, DateTime answeredAt, int upvotes
});




}
/// @nodoc
class __$AnswerCopyWithImpl<$Res>
    implements _$AnswerCopyWith<$Res> {
  __$AnswerCopyWithImpl(this._self, this._then);

  final _Answer _self;
  final $Res Function(_Answer) _then;

/// Create a copy of Answer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? questionId = null,Object? expertId = null,Object? body = null,Object? answeredAt = null,Object? upvotes = null,}) {
  return _then(_Answer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,expertId: null == expertId ? _self.expertId : expertId // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as LocalizedText,answeredAt: null == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Question {

 String get id;@LocalizedTextConverter() LocalizedText get body; ContentCategory get category; DateTime get askedAt;/// Display name of the asker, or null when asked anonymously.
 String? get askedBy; int get upvotes; List<Answer> get answers;/// Premium askers are answered first.
 bool get priority;
/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionCopyWith<Question> get copyWith => _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Question;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Question&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.askedAt, _this.askedAt) || other.askedAt == _this.askedAt)&&(identical(other.askedBy, _this.askedBy) || other.askedBy == _this.askedBy)&&(identical(other.upvotes, _this.upvotes) || other.upvotes == _this.upvotes)&&const DeepCollectionEquality().equals(other.answers, _this.answers)&&(identical(other.priority, _this.priority) || other.priority == _this.priority));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Question;
  return Object.hash(runtimeType,_this.id,_this.body,_this.category,_this.askedAt,_this.askedBy,_this.upvotes,const DeepCollectionEquality().hash(_this.answers),_this.priority);
}

@override
String toString() {
  final _this = this as Question;
  return 'Question(id: ${_this.id}, body: ${_this.body}, category: ${_this.category}, askedAt: ${_this.askedAt}, askedBy: ${_this.askedBy}, upvotes: ${_this.upvotes}, answers: ${_this.answers}, priority: ${_this.priority})';
}


}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res>  {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) = _$QuestionCopyWithImpl;
@useResult
$Res call({
 String id,@LocalizedTextConverter() LocalizedText body, ContentCategory category, DateTime askedAt, String? askedBy, int upvotes, List<Answer> answers, bool priority
});




}
/// @nodoc
class _$QuestionCopyWithImpl<$Res>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._self, this._then);

  final Question _self;
  final $Res Function(Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? body = null,Object? category = null,Object? askedAt = null,Object? askedBy = freezed,Object? upvotes = null,Object? answers = null,Object? priority = null,}) {
  return _then(Question(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as LocalizedText,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ContentCategory,askedAt: null == askedAt ? _self.askedAt : askedAt // ignore: cast_nullable_to_non_nullable
as DateTime,askedBy: freezed == askedBy ? _self.askedBy : askedBy // ignore: cast_nullable_to_non_nullable
as String?,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<Answer>,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Question].
extension QuestionPatterns on Question {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Question value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Question() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Question value)  $default,){
final _that = this;
switch (_that) {
case _Question():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Question value)?  $default,){
final _that = this;
switch (_that) {
case _Question() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @LocalizedTextConverter()  LocalizedText body,  ContentCategory category,  DateTime askedAt,  String? askedBy,  int upvotes,  List<Answer> answers,  bool priority)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.id,_that.body,_that.category,_that.askedAt,_that.askedBy,_that.upvotes,_that.answers,_that.priority);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @LocalizedTextConverter()  LocalizedText body,  ContentCategory category,  DateTime askedAt,  String? askedBy,  int upvotes,  List<Answer> answers,  bool priority)  $default,) {final _that = this;
switch (_that) {
case _Question():
return $default(_that.id,_that.body,_that.category,_that.askedAt,_that.askedBy,_that.upvotes,_that.answers,_that.priority);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @LocalizedTextConverter()  LocalizedText body,  ContentCategory category,  DateTime askedAt,  String? askedBy,  int upvotes,  List<Answer> answers,  bool priority)?  $default,) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.id,_that.body,_that.category,_that.askedAt,_that.askedBy,_that.upvotes,_that.answers,_that.priority);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Question extends Question {
  const _Question({required this.id, @LocalizedTextConverter() required this.body, required this.category, required this.askedAt, this.askedBy, this.upvotes = 0,  List<Answer> answers = const <Answer>[], this.priority = false}): _answers = answers,super._();
  factory _Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

@override final  String id;
@override@LocalizedTextConverter() final  LocalizedText body;
@override final  ContentCategory category;
@override final  DateTime askedAt;
/// Display name of the asker, or null when asked anonymously.
@override final  String? askedBy;
@override@JsonKey() final  int upvotes;
 final  List<Answer> _answers;
@override@JsonKey() List<Answer> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

/// Premium askers are answered first.
@override@JsonKey() final  bool priority;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionCopyWith<_Question> get copyWith => __$QuestionCopyWithImpl<_Question>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Question&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.category, category) || other.category == category)&&(identical(other.askedAt, askedAt) || other.askedAt == askedAt)&&(identical(other.askedBy, askedBy) || other.askedBy == askedBy)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&const DeepCollectionEquality().equals(other.answers, _answers)&&(identical(other.priority, priority) || other.priority == priority));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,body,category,askedAt,askedBy,upvotes,const DeepCollectionEquality().hash(_answers),priority);
}

@override
String toString() {
    return 'Question(id: $id, body: $body, category: $category, askedAt: $askedAt, askedBy: $askedBy, upvotes: $upvotes, answers: $answers, priority: $priority)';
}


}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) = __$QuestionCopyWithImpl;
@override @useResult
$Res call({
 String id,@LocalizedTextConverter() LocalizedText body, ContentCategory category, DateTime askedAt, String? askedBy, int upvotes, List<Answer> answers, bool priority
});




}
/// @nodoc
class __$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(this._self, this._then);

  final _Question _self;
  final $Res Function(_Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? body = null,Object? category = null,Object? askedAt = null,Object? askedBy = freezed,Object? upvotes = null,Object? answers = null,Object? priority = null,}) {
  return _then(_Question(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as LocalizedText,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ContentCategory,askedAt: null == askedAt ? _self.askedAt : askedAt // ignore: cast_nullable_to_non_nullable
as DateTime,askedBy: freezed == askedBy ? _self.askedBy : askedBy // ignore: cast_nullable_to_non_nullable
as String?,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<Answer>,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
