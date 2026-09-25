// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

 String get id; ProductCategory get category;@LocalizedTextConverter() LocalizedText get title;@LocalizedTextConverter() LocalizedText get description;/// Price in KZT.
 int get price;/// Original price when discounted, always higher than [price].
 int? get oldPrice; String get sellerId; List<String> get imageUrls; double get rating; int get reviewCount; bool get inStock;/// Cycle phases this is useful in, used for timed offers.
 List<CyclePhase> get phases; List<LifeStage> get stages; List<Interest> get interests;/// Bundle contents, e.g. the Hospital Bag Bundle.
 List<String> get bundleProductIds;/// Links a bundle to the article that recommends it.
 String? get relatedContentId;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Product;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.oldPrice, _this.oldPrice) || other.oldPrice == _this.oldPrice)&&(identical(other.sellerId, _this.sellerId) || other.sellerId == _this.sellerId)&&const DeepCollectionEquality().equals(other.imageUrls, _this.imageUrls)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.reviewCount, _this.reviewCount) || other.reviewCount == _this.reviewCount)&&(identical(other.inStock, _this.inStock) || other.inStock == _this.inStock)&&const DeepCollectionEquality().equals(other.phases, _this.phases)&&const DeepCollectionEquality().equals(other.stages, _this.stages)&&const DeepCollectionEquality().equals(other.interests, _this.interests)&&const DeepCollectionEquality().equals(other.bundleProductIds, _this.bundleProductIds)&&(identical(other.relatedContentId, _this.relatedContentId) || other.relatedContentId == _this.relatedContentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Product;
  return Object.hash(runtimeType,_this.id,_this.category,_this.title,_this.description,_this.price,_this.oldPrice,_this.sellerId,const DeepCollectionEquality().hash(_this.imageUrls),_this.rating,_this.reviewCount,_this.inStock,const DeepCollectionEquality().hash(_this.phases),const DeepCollectionEquality().hash(_this.stages),const DeepCollectionEquality().hash(_this.interests),const DeepCollectionEquality().hash(_this.bundleProductIds),_this.relatedContentId);
}

@override
String toString() {
  final _this = this as Product;
  return 'Product(id: ${_this.id}, category: ${_this.category}, title: ${_this.title}, description: ${_this.description}, price: ${_this.price}, oldPrice: ${_this.oldPrice}, sellerId: ${_this.sellerId}, imageUrls: ${_this.imageUrls}, rating: ${_this.rating}, reviewCount: ${_this.reviewCount}, inStock: ${_this.inStock}, phases: ${_this.phases}, stages: ${_this.stages}, interests: ${_this.interests}, bundleProductIds: ${_this.bundleProductIds}, relatedContentId: ${_this.relatedContentId})';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String id, ProductCategory category,@LocalizedTextConverter() LocalizedText title,@LocalizedTextConverter() LocalizedText description, int price, int? oldPrice, String sellerId, List<String> imageUrls, double rating, int reviewCount, bool inStock, List<CyclePhase> phases, List<LifeStage> stages, List<Interest> interests, List<String> bundleProductIds, String? relatedContentId
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? category = null,Object? title = null,Object? description = null,Object? price = null,Object? oldPrice = freezed,Object? sellerId = null,Object? imageUrls = null,Object? rating = null,Object? reviewCount = null,Object? inStock = null,Object? phases = null,Object? stages = null,Object? interests = null,Object? bundleProductIds = null,Object? relatedContentId = freezed,}) {
  return _then(Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ProductCategory,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as LocalizedText,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,oldPrice: freezed == oldPrice ? _self.oldPrice : oldPrice // ignore: cast_nullable_to_non_nullable
as int?,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,phases: null == phases ? _self.phases : phases // ignore: cast_nullable_to_non_nullable
as List<CyclePhase>,stages: null == stages ? _self.stages : stages // ignore: cast_nullable_to_non_nullable
as List<LifeStage>,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<Interest>,bundleProductIds: null == bundleProductIds ? _self.bundleProductIds : bundleProductIds // ignore: cast_nullable_to_non_nullable
as List<String>,relatedContentId: freezed == relatedContentId ? _self.relatedContentId : relatedContentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ProductCategory category, @LocalizedTextConverter()  LocalizedText title, @LocalizedTextConverter()  LocalizedText description,  int price,  int? oldPrice,  String sellerId,  List<String> imageUrls,  double rating,  int reviewCount,  bool inStock,  List<CyclePhase> phases,  List<LifeStage> stages,  List<Interest> interests,  List<String> bundleProductIds,  String? relatedContentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.category,_that.title,_that.description,_that.price,_that.oldPrice,_that.sellerId,_that.imageUrls,_that.rating,_that.reviewCount,_that.inStock,_that.phases,_that.stages,_that.interests,_that.bundleProductIds,_that.relatedContentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ProductCategory category, @LocalizedTextConverter()  LocalizedText title, @LocalizedTextConverter()  LocalizedText description,  int price,  int? oldPrice,  String sellerId,  List<String> imageUrls,  double rating,  int reviewCount,  bool inStock,  List<CyclePhase> phases,  List<LifeStage> stages,  List<Interest> interests,  List<String> bundleProductIds,  String? relatedContentId)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.category,_that.title,_that.description,_that.price,_that.oldPrice,_that.sellerId,_that.imageUrls,_that.rating,_that.reviewCount,_that.inStock,_that.phases,_that.stages,_that.interests,_that.bundleProductIds,_that.relatedContentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ProductCategory category, @LocalizedTextConverter()  LocalizedText title, @LocalizedTextConverter()  LocalizedText description,  int price,  int? oldPrice,  String sellerId,  List<String> imageUrls,  double rating,  int reviewCount,  bool inStock,  List<CyclePhase> phases,  List<LifeStage> stages,  List<Interest> interests,  List<String> bundleProductIds,  String? relatedContentId)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.category,_that.title,_that.description,_that.price,_that.oldPrice,_that.sellerId,_that.imageUrls,_that.rating,_that.reviewCount,_that.inStock,_that.phases,_that.stages,_that.interests,_that.bundleProductIds,_that.relatedContentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product extends Product {
  const _Product({required this.id, required this.category, @LocalizedTextConverter() required this.title, @LocalizedTextConverter() required this.description, required this.price, this.oldPrice, required this.sellerId,  List<String> imageUrls = const <String>[], this.rating = 0, this.reviewCount = 0, this.inStock = true,  List<CyclePhase> phases = const <CyclePhase>[],  List<LifeStage> stages = const <LifeStage>[],  List<Interest> interests = const <Interest>[],  List<String> bundleProductIds = const <String>[], this.relatedContentId}): _imageUrls = imageUrls,_phases = phases,_stages = stages,_interests = interests,_bundleProductIds = bundleProductIds,super._();
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  String id;
@override final  ProductCategory category;
@override@LocalizedTextConverter() final  LocalizedText title;
@override@LocalizedTextConverter() final  LocalizedText description;
/// Price in KZT.
@override final  int price;
/// Original price when discounted, always higher than [price].
@override final  int? oldPrice;
@override final  String sellerId;
 final  List<String> _imageUrls;
@override@JsonKey() List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

@override@JsonKey() final  double rating;
@override@JsonKey() final  int reviewCount;
@override@JsonKey() final  bool inStock;
/// Cycle phases this is useful in, used for timed offers.
 final  List<CyclePhase> _phases;
/// Cycle phases this is useful in, used for timed offers.
@override@JsonKey() List<CyclePhase> get phases {
  if (_phases is EqualUnmodifiableListView) return _phases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phases);
}

 final  List<LifeStage> _stages;
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

/// Bundle contents, e.g. the Hospital Bag Bundle.
 final  List<String> _bundleProductIds;
/// Bundle contents, e.g. the Hospital Bag Bundle.
@override@JsonKey() List<String> get bundleProductIds {
  if (_bundleProductIds is EqualUnmodifiableListView) return _bundleProductIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bundleProductIds);
}

/// Links a bundle to the article that recommends it.
@override final  String? relatedContentId;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.oldPrice, oldPrice) || other.oldPrice == oldPrice)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&const DeepCollectionEquality().equals(other.imageUrls, _imageUrls)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&const DeepCollectionEquality().equals(other.phases, _phases)&&const DeepCollectionEquality().equals(other.stages, _stages)&&const DeepCollectionEquality().equals(other.interests, _interests)&&const DeepCollectionEquality().equals(other.bundleProductIds, _bundleProductIds)&&(identical(other.relatedContentId, relatedContentId) || other.relatedContentId == relatedContentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,category,title,description,price,oldPrice,sellerId,const DeepCollectionEquality().hash(_imageUrls),rating,reviewCount,inStock,const DeepCollectionEquality().hash(_phases),const DeepCollectionEquality().hash(_stages),const DeepCollectionEquality().hash(_interests),const DeepCollectionEquality().hash(_bundleProductIds),relatedContentId);
}

@override
String toString() {
    return 'Product(id: $id, category: $category, title: $title, description: $description, price: $price, oldPrice: $oldPrice, sellerId: $sellerId, imageUrls: $imageUrls, rating: $rating, reviewCount: $reviewCount, inStock: $inStock, phases: $phases, stages: $stages, interests: $interests, bundleProductIds: $bundleProductIds, relatedContentId: $relatedContentId)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String id, ProductCategory category,@LocalizedTextConverter() LocalizedText title,@LocalizedTextConverter() LocalizedText description, int price, int? oldPrice, String sellerId, List<String> imageUrls, double rating, int reviewCount, bool inStock, List<CyclePhase> phases, List<LifeStage> stages, List<Interest> interests, List<String> bundleProductIds, String? relatedContentId
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? title = null,Object? description = null,Object? price = null,Object? oldPrice = freezed,Object? sellerId = null,Object? imageUrls = null,Object? rating = null,Object? reviewCount = null,Object? inStock = null,Object? phases = null,Object? stages = null,Object? interests = null,Object? bundleProductIds = null,Object? relatedContentId = freezed,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ProductCategory,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as LocalizedText,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,oldPrice: freezed == oldPrice ? _self.oldPrice : oldPrice // ignore: cast_nullable_to_non_nullable
as int?,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,phases: null == phases ? _self._phases : phases // ignore: cast_nullable_to_non_nullable
as List<CyclePhase>,stages: null == stages ? _self._stages : stages // ignore: cast_nullable_to_non_nullable
as List<LifeStage>,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<Interest>,bundleProductIds: null == bundleProductIds ? _self._bundleProductIds : bundleProductIds // ignore: cast_nullable_to_non_nullable
as List<String>,relatedContentId: freezed == relatedContentId ? _self.relatedContentId : relatedContentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
