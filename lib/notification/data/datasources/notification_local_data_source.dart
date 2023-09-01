import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/error/exceptions.dart';
import '../models/notification_model.dart';

abstract class NotificationLocalDataSource {
  Future<List<NotificationModel>> getCachedNotifications();
  Future<Unit> cacheNotifications(List<NotificationModel> notificationModels);
  Future<List<NotificationModel>> getCacheNotificationsToParent();
  Future<Unit> cacheNotificationsToParent(List<NotificationModel> notificationModels);
}

const CACHED_NOTIFICATIONS = "CACHED_NOTIFICATION";
const CACHED_NOTIFICATIONS_TO_PARENT = "CACHED_NOTIFICATION_TO_PARENT";

class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  final SharedPreferences sharedPreferences;

  NotificationLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheNotifications(List<NotificationModel> notificationModels) {
 
    List notificationModelsToJson = notificationModels
        .map<Map<String, dynamic>>((notificationModel) => notificationModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_NOTIFICATIONS, json.encode(notificationModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<NotificationModel>> getCachedNotifications() {
 
    final jsonString = sharedPreferences.getString(CACHED_NOTIFICATIONS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<NotificationModel> jsonToNotificationModels = decodeJsonData
          .map<NotificationModel>((jsonNotificationModel) => NotificationModel.fromJson(jsonNotificationModel))
          .toList();
      return Future.value(jsonToNotificationModels);
    } else {
      throw EmptyCacheException();
    }
  }



  @override
  Future<Unit> cacheNotificationsToParent(List<NotificationModel> notificationModels) {
 
    List notificationModelsToJson = notificationModels
        .map<Map<String, dynamic>>((notificationModel) => notificationModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_NOTIFICATIONS_TO_PARENT, json.encode(notificationModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<NotificationModel>> getCacheNotificationsToParent() {
 
    final jsonString = sharedPreferences.getString(CACHED_NOTIFICATIONS_TO_PARENT);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<NotificationModel> jsonToNotificationModels = decodeJsonData
          .map<NotificationModel>((jsonNotificationModel) => NotificationModel.fromJson(jsonNotificationModel))
          .toList();
      return Future.value(jsonToNotificationModels);
    } else {
      throw EmptyCacheException();
    }
  }


}
