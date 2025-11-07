// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginBody _$LoginBodyFromJson(Map<String, dynamic> json) => LoginBody(
  email: json['email'] as String?,
  password: json['password'] as String?,
  rememberMe: json['rememberMe'] as bool?,
);

Map<String, dynamic> _$LoginBodyToJson(LoginBody instance) => <String, dynamic>{
  'email': ?instance.email,
  'password': ?instance.password,
  'rememberMe': ?instance.rememberMe,
};
