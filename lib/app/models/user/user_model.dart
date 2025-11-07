import 'package:json_annotation/json_annotation.dart';

import '../../utils/enums/user_role.dart';

part 'user_model.g.dart';



@JsonSerializable()
class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? profileImage;
  UserRole? role;
  DateTime? createdAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.profileImage,
    this.role,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);


}