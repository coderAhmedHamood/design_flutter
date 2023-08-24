import 'package:flutter/material.dart';

import '../../domain/entities/notification.dart';

class NotificationModel extends NotificationClass {
  NotificationModel({
    int? id,
    required String title,
    required String message,
    required String date,
    required String image,
  }) : super(
          id: id,
          title: title,
          message: message,
          date: date,
          image: image,
        );

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      date: json['date'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'date': date,
      'image': image,
    };
  }
}
