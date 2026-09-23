// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  uid: json['uid'] as String,
  method: $enumDecode(_$AuthMethodEnumMap, json['method']),
  phoneNumber: json['phoneNumber'] as String?,
  email: json['email'] as String?,
  displayName: json['displayName'] as String?,
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'uid': instance.uid,
  'method': _$AuthMethodEnumMap[instance.method]!,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
  'displayName': instance.displayName,
};

const _$AuthMethodEnumMap = {
  AuthMethod.phone: 'phone',
  AuthMethod.email: 'email',
  AuthMethod.google: 'google',
};
