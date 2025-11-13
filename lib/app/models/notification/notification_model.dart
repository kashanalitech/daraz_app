import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
   int? id;
   String? title;
   String? description;
   String? icon;
   DateTime? dateTime;
   bool? isRead;

  NotificationModel({
    this.id,
    this.title,
    this.description,
    this.icon,
    this.dateTime,
    this.isRead = false,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

