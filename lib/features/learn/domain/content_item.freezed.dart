// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentItem {

 String get id; ContentType get type; ContentCategory get category;@LocalizedTextConverter() LocalizedText get title;@LocalizedTextConverter() LocalizedText get summary;/// Article body, one entry per paragraph. Empty for videos and courses.
@LocalizedTextListConverter() List<LocalizedText> get body; AccessTier get tier;/// Reading or watching time, in minutes.
 int get durationMinutes;/// Life stages this is written for. Empty means it suits everyone.
 List<LifeStage> get stages; List<Interest> get interests;/// Pregnancy School items are pinned to a week of pregnancy.
 int? get pregnancyWeek;/// Set for [ContentType.course]; points at the course's modules.
 String? get courseId;/// Verified expert who wrote or presented it.
 String? get expertId; String? get imageUrl; String? get videoUrl; int get viewCount; DateTime? get publishedAt;
/// Create a copy of ContentItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentItemCopyWith<ContentItem> get copyWith => _$ContentItemCopyWithImpl<ContentItem>(this as ContentItem, _$identity);

  /// Serializes this ContentItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ContentItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&const DeepCollectionEquality().equals(other.body, _this.body)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.durationMinutes, _this.durationMinutes) || other.durationMinutes == _this.durationMinutes)&&const DeepCollectionEquality().equals(other.stages, _this.stages)&&const DeepCollectionEquality().equals(other.interests, _this.interests)&&(identical(other.pregnancyWeek, _this.pregnancyWeek) || other.pregnancyWeek == _this.pregnancyWeek)&&(identical(other.courseId, _this.courseId) || other.courseId == _this.courseId)&&(identical(other.expertId, _this.expertId) || other.expertId == _this.expertId)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.videoUrl, _this.videoUrl) || other.videoUrl == _this.videoUrl)&&(identical(other.viewCount, _this.viewCount) || other.viewCount == _this.viewCount)&&(identical(other.publishedAt, _this.publishedAt) || other.publishedAt == _this.publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ContentItem;
  return Object.hash(runtimeType,_this.id,_this.type,_this.category,_this.title,_this.summary,const DeepCollectionEquality().hash(_this.body),_this.tier,_this.durationMinutes,const DeepCollectionEquality().hash(_this.stages),const DeepCollectionEquality().hash(_this.interests),_this.pregnancyWeek,_this.courseId,_this.expertId,_this.imageUrl,_this.videoUrl,_this.viewCount,_this.publishedAt);
}

@override
String toString() {
  final _this = this as ContentItem;
  return 'ContentItem(id: ${_this.id}, type: ${_this.type}, category: ${_this.category}, title: ${_this.title}, summary: ${_this.summary}, body: ${_this.body}, tier: ${_this.tier}, durationMinutes: ${_this.durationMinutes}, stages: ${_this.stages}, interests: ${_this.interests}, pregnancyWeek: ${_this.pregnancyWeek}, courseId: ${_this.courseId}, expertId: ${_this.expertId}, imageUrl: ${_this.imageUrl}, videoUrl: ${_this.videoUrl}, viewCount: ${_this.viewCount}, publishedAt: ${_this.publishedAt})';
}


}

/// @nodoc
abstract mixin class $ContentItemCopyWith<$Res>  {
  factory $ContentItemCopyWith(ContentItem value, $Res Function(ContentItem) _then) = _$ContentItemCopyWithImpl;
@useResult
$Res call({
 String id, ContentType type, ContentCategory category,@LocalizedTextConverter() LocalizedText title,@LocalizedTextConverter() LocalizedText summary,@LocalizedTextListConverter() List<LocalizedText> body, AccessTier tier, int durationMinutes, List<LifeStage> stages, List<Interest> interests, int? pregnancyWeek, String? courseId, String? expertId, String? imageUrl, String? videoUrl, int viewCount, DateTime? publishedAt
});




}
/// @nodoc
class _$ContentItemCopyWithImpl<$Res>
    implements $ContentItemCopyWith<$Res> {
  _$ContentItemCopyWithImpl(this._self, this._then);

  final ContentItem _self;
  final $Res Function(ContentItem) _then;

/// Create a copy of ContentItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? category = null,Object? title = null,Object? summary = null,Object? body = null,Object? tier = null,Object? durationMinutes = null,Object? stages = null,Object? interests = null,Object? pregnancyWeek = freezed,Object? courseId = freezed,Object? expertId = freezed,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? viewCount = null,Object? publishedAt = freezed,}) {
  return _then(ContentItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ContentType,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ContentCategory,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as LocalizedText,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as List<LocalizedText>,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as AccessTier,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,stages: null == stages ? _self.stages : stages // ignore: cast_nullable_to_non_nullable
as List<LifeStage>,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<Interest>,pregnancyWeek: freezed == pregnancyWeek ? _self.pregnancyWeek : pregnancyWeek // ignore: cast_nullable_to_non_nullable
as int?,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,expertId: freezed == expertId ? _self.expertId : expertId // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentItem].
extension ContentItemPatterns on ContentItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentItem value)  $default,){
final _that = this;
switch (_that) {
case _ContentItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentItem value)?  $default,){
final _that = this;
switch (_that) {
case _ContentItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ContentType type,  ContentCategory category, @LocalizedTextConverter()  LocalizedText title, @LocalizedTextConverter()  LocalizedText summary, @LocalizedTextListConverter()  List<LocalizedText> body,  AccessTier tier,  int durationMinutes,  List<LifeStage> stages,  List<Interest> interests,  int? pregnancyWeek,  String? courseId,  String? expertId,  String? imageUrl,  String? videoUrl,  int viewCount,  DateTime? publishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentItem() when $default != null:
return $default(_that.id,_that.type,_that.category,_that.title,_that.summary,_that.body,_that.tier,_that.durationMinutes,_that.stages,_that.interests,_that.pregnancyWeek,_that.courseId,_that.expertId,_that.imageUrl,_that.videoUrl,_that.viewCount,_that.publishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ContentType type,  ContentCategory category, @LocalizedTextConverter()  LocalizedText title, @LocalizedTextConverter()  LocalizedText summary, @LocalizedTextListConverter()  List<LocalizedText> body,  AccessTier tier,  int durationMinutes,  List<LifeStage> stages,  List<Interest> interests,  int? pregnancyWeek,  String? courseId,  String? expertId,  String? imageUrl,  String? videoUrl,  int viewCount,  DateTime? publishedAt)  $default,) {final _that = this;
switch (_that) {
case _ContentItem():
return $default(_that.id,_that.type,_that.category,_that.title,_that.summary,_that.body,_that.tier,_that.durationMinutes,_that.stages,_that.interests,_that.pregnancyWeek,_that.courseId,_that.expertId,_that.imageUrl,_that.videoUrl,_that.viewCount,_that.publishedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ContentType type,  ContentCategory category, @LocalizedTextConverter()  LocalizedText title, @LocalizedTextConverter()  LocalizedText summary, @LocalizedTextListConverter()  List<LocalizedText> body,  AccessTier tier,  int durationMinutes,  List<LifeStage> stages,  List<Interest> interests,  int? pregnancyWeek,  String? courseId,  String? expertId,  String? imageUrl,  String? videoUrl,  int viewCount,  DateTime? publishedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContentItem() when $default != null:
return $default(_that.id,_that.type,_that.category,_that.title,_that.summary,_that.body,_that.tier,_that.durationMinutes,_that.stages,_that.interests,_that.pregnancyWeek,_that.courseId,_that.expertId,_that.imageUrl,_that.videoUrl,_that.viewCount,_that.publishedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentItem extends ContentItem {
  const _ContentItem({required this.id, required this.type, required this.category, @LocalizedTextConverter() required this.title, @LocalizedTextConverter() required this.summary, @LocalizedTextListConverter()  List<LocalizedText> body = const <LocalizedText>[], this.tier = AccessTier.free, required this.durationMinutes,  List<LifeStage> stages = const <LifeStage>[],  List<Interest> interests = const <Interest>[], this.pregnancyWeek, this.courseId, this.expertId, this.imageUrl, this.videoUrl, this.viewCount = 0, this.publishedAt}): _body = body,_stages = stages,_interests = interests,super._();
  factory _ContentItem.fromJson(Map<String, dynamic> json) => _$ContentItemFromJson(json);

@override final  String id;
@override final  ContentType type;
@override final  ContentCategory category;
@override@LocalizedTextConverter() final  LocalizedText title;
@override@LocalizedTextConverter() final  LocalizedText summary;
/// Article body, one entry per paragraph. Empty for videos and courses.
 final  List<LocalizedText> _body;
/// Article body, one entry per paragraph. Empty for videos and courses.
@override@JsonKey()@LocalizedTextListConverter() List<LocalizedText> get body {
  if (_body is EqualUnmodifiableListView) return _body;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_body);
}

@override@JsonKey() final  AccessTier tier;
/// Reading or watching time, in minutes.
@override final  int durationMinutes;
/// Life stages this is written for. Empty means it suits everyone.
 final  List<LifeStage> _stages;
/// Life stages this is written for. Empty means it suits everyone.
@override@JsonKey() List<LifeStage> get stages {
  if (_stages is EqualUnmodifiableListView) return _stages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stages);
}

 final  List<Interest> _interests;
@override@JsonKey() List<Interest> get interests {
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interests);
}

/// Pregnancy School items are pinned to a week of pregnancy.
@override final  int? pregnancyWeek;
/// Set for [ContentType.course]; points at the course's modules.
@override final  String? courseId;
/// Verified expert who wrote or presented it.
@override final  String? expertId;
@override final  String? imageUrl;
@override final  String? videoUrl;
@override@JsonKey() final  int viewCount;
@override final  DateTime? publishedAt;

/// Create a copy of ContentItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentItemCopyWith<_ContentItem> get copyWith => __$ContentItemCopyWithImpl<_ContentItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.body, _body)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&const DeepCollectionEquality().equals(other.stages, _stages)&&const DeepCollectionEquality().equals(other.interests, _interests)&&(identical(other.pregnancyWeek, pregnancyWeek) || other.pregnancyWeek == pregnancyWeek)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.expertId, expertId) || other.expertId == expertId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,category,title,summary,const DeepCollectionEquality().hash(_body),tier,durationMinutes,const DeepCollectionEquality().hash(_stages),const DeepCollectionEquality().hash(_interests),pregnancyWeek,courseId,expertId,imageUrl,videoUrl,viewCount,publishedAt);
}

@override
String toString() {
    return 'ContentItem(id: $id, type: $type, category: $category, title: $title, summary: $summary, body: $body, tier: $tier, durationMinutes: $durationMinutes, stages: $stages, interests: $interests, pregnancyWeek: $pregnancyWeek, courseId: $courseId, expertId: $expertId, imageUrl: $imageUrl, videoUrl: $videoUrl, viewCount: $viewCount, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class _$ContentItemCopyWith<$Res> implements $ContentItemCopyWith<$Res> {
  factory _$ContentItemCopyWith(_ContentItem value, $Res Function(_ContentItem) _then) = __$ContentItemCopyWithImpl;
@override @useResult
$Res call({
 String id, ContentType type, ContentCategory category,@LocalizedTextConverter() LocalizedText title,@LocalizedTextConverter() LocalizedText summary,@LocalizedTextListConverter() List<LocalizedText> body, AccessTier tier, int durationMinutes, List<LifeStage> stages, List<Interest> interests, int? pregnancyWeek, String? courseId, String? expertId, String? imageUrl, String? videoUrl, int viewCount, DateTime? publishedAt
});




}
/// @nodoc
class __$ContentItemCopyWithImpl<$Res>
    implements _$ContentItemCopyWith<$Res> {
  __$ContentItemCopyWithImpl(this._self, this._then);

  final _ContentItem _self;
  final $Res Function(_ContentItem) _then;

/// Create a copy of ContentItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? category = null,Object? title = null,Object? summary = null,Object? body = null,Object? tier = null,Object? durationMinutes = null,Object? stages = null,Object? interests = null,Object? pregnancyWeek = freezed,Object? courseId = freezed,Object? expertId = freezed,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? viewCount = null,Object? publishedAt = freezed,}) {
  return _then(_ContentItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ContentType,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ContentCategory,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as LocalizedText,body: null == body ? _self._body : body // ignore: cast_nullable_to_non_nullable
as List<LocalizedText>,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as AccessTier,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,stages: null == stages ? _self._stages : stages // ignore: cast_nullable_to_non_nullable
as List<LifeStage>,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<Interest>,pregnancyWeek: freezed == pregnancyWeek ? _self.pregnancyWeek : pregnancyWeek // ignore: cast_nullable_to_non_nullable
as int?,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,expertId: freezed == expertId ? _self.expertId : expertId // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
