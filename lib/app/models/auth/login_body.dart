import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable(explicitToJson: true,includeIfNull: false)
class LoginBody {
  final String? email;
  final String? password;
  final bool? rememberMe;

  LoginBody({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  /// A factory constructor to create a `LoginRequestModel` instance from a JSON map.
  factory LoginBody.fromJson(Map<String, dynamic> json) =>
      _$LoginBodyFromJson(json);

  /// A method to convert the `LoginRequestModel` instance into a JSON map.
  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);
}
