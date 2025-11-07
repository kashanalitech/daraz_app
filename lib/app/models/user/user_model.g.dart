// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  profileImage: json['profileImage'] as String?,
  role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'profileImage': instance.profileImage,
  'role': _$UserRoleEnumMap[instance.role],
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.seller: 'seller',
  UserRole.user: 'user',
};
