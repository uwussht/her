// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Expert _$ExpertFromJson(Map<String, dynamic> json) => _Expert(
  id: json['id'] as String,
  name: json['name'] as String,
  specialty: const LocalizedTextConverter().fromJson(
    json['specialty'] as Map<String, dynamic>,
  ),
  verified: json['verified'] as bool? ?? true,
  photoUrl: json['photoUrl'] as String?,
  city: json['city'] as String?,
  yearsOfPractice: (json['yearsOfPractice'] as num?)?.toInt(),
);

Map<String, dynamic> _$ExpertToJson(_Expert instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'specialty': const LocalizedTextConverter().toJson(instance.specialty),
  'verified': instance.verified,
  'photoUrl': instance.photoUrl,
  'city': instance.city,
  'yearsOfPractice': instance.yearsOfPractice,
};
