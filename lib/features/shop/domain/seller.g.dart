// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Seller _$SellerFromJson(Map<String, dynamic> json) => _Seller(
  id: json['id'] as String,
  name: json['name'] as String,
  isLocalBrand: json['isLocalBrand'] as bool? ?? false,
  rating: (json['rating'] as num?)?.toDouble() ?? 0,
  city: json['city'] as String?,
);

Map<String, dynamic> _$SellerToJson(_Seller instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'isLocalBrand': instance.isLocalBrand,
  'rating': instance.rating,
  'city': instance.city,
};
