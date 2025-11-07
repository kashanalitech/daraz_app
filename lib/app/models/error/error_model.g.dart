// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) =>
    ErrorResponseModel(
      successful: json['successful'] as bool?,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ErrorResponseModelToJson(ErrorResponseModel instance) =>
    <String, dynamic>{
      'successful': ?instance.successful,
      'errors': ?instance.errors,
    };
