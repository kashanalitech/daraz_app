import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(explicitToJson: true,includeIfNull: false)
class ErrorResponseModel {
  final bool? successful;
  final List<String>? errors;

  ErrorResponseModel({
    this.successful,
    this.errors,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);
}