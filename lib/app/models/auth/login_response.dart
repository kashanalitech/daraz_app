import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';


@JsonSerializable(explicitToJson: true,includeIfNull: false)
class LoginResponse {
  final bool? successful;
  final String? token;
  final List<String>? errors;

  LoginResponse({
    this.successful,
    this.token,
    this.errors,
  });

  /// A factory constructor to create a `LoginResponseModel` instance from a JSON map.
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  /// A method to convert the `LoginResponseModel` instance into a JSON map.
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
