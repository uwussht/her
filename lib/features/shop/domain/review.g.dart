// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  id: json['id'] as String,
  productId: json['productId'] as String,
  author: json['author'] as String,
  rating: (json['rating'] as num).toInt(),
  text: json['text'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  language: json['language'] as String? ?? 'ru',
  verifiedPurchase: json['verifiedPurchase'] as bool? ?? true,
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'author': instance.author,
  'rating': instance.rating,
  'text': instance.text,
  'createdAt': instance.createdAt.toIso8601String(),
  'language': instance.language,
  'verifiedPurchase': instance.verifiedPurchase,
};
