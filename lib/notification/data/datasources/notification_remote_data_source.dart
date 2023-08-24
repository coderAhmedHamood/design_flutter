import 'dart:convert';

import '../../../../base/error/exceptions.dart';
import '../models/notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getAllNotifications();
  Future<Unit> readAllNotification(int notificationId);
  Future<Unit> addNotification(NotificationModel notificationModel);
}
   List<NotificationModel> notifications = [
   NotificationModel(
    title: 'إشعاربب جديد',
    message:
        ' تمت إضافة منشور جديد في صفحتك  تمت إضافة منشور جديد في صفحتك تمت إضافة منشور جديد في صفحتك تمت إضافة منشور جديد في صفحتك',
    date: '١٥ أغسطس ٢٠٢٣',
    image: 'assets/notification1.png',
  ),
  NotificationModel(
    title: 'تم الإعجاب بمنشورك',
    message: 'أحد الأصدقاء قام بالإعجاب بمنشورك',
    date: '١٤ أغسطس ٢٠٢٣',
    image: 'assets/notification2.png',
  ),
  NotificationModel(
    title: 'إشعار جديد',
    message: 'تمت إضافة منشور جديد في صفحتك',
    date: '١٥ أغسطس ٢٠٢٣',
    image: 'assets/notification3.png',
  ),
  NotificationModel(
    title: 'تم الإعجاب بمنشورك',
    message: 'أحد الأصدقاء قام بالإعجاب بمنشورك',
    date: '١٤ أغسطس ٢٠٢٣',
    image: 'assets/notification2.png',
  ),
  NotificationModel(
    title: 'إشعار جديد',
    message: 'تمت إضافة منشور جديد في صفحتك',
    date: '١٥ أغسطس ٢٠٢٣',
    image: 'assets/notification1.png',
  ),
  NotificationModel(
    title: 'تم الإعجاب بمنشورك',
    message: 'أحد الأصدقاء قام بالإعجاب بمنشورك',
    date: '١٤ أغسطس ٢٠٢٣',
    image: 'assets/notification2.png',
  ),
  NotificationModel(
    title: 'إشعار جديد',
    message: 'تمت إضافة منشور جديد في صفحتك',
    date: '١٥ أغسطس ٢٠٢٣',
    image: 'assets/notification3.png',
  ),
  NotificationModel(
    title: 'تم الإعجاب بمنشورك',
    message: 'أحد الأصدقاء قام بالإعجاب بمنشورك',
    date: '١٤ أغسطس ٢٠٢٣',
    image: 'assets/notification2.png',
  ),
  NotificationModel(
    title: 'إشعار جديد',
    message: 'تمت إضافة منشور جديد في صفحتك',
    date: '١٥ أغسطس ٢٠٢٣',
    image: 'assets/notification1.png',
  ),
  NotificationModel(
    title: 'تم الإعجاب بمنشورك',
    message: 'أحد الأصدقاء قام بالإعجاب بمنشورك',
    date: '١٤ أغسطس ٢٠٢٣',
    image: 'assets/notification2.png',
  ),
  NotificationModel(
    title: 'إشعار جديد',
    message: 'تمت إضافة منشور جديد في صفحتك',
    date: '١٥ أغسطس ٢٠٢٣',
    image: 'assets/notification1.png',
  ),

  NotificationModel(
    title: 'إشعار جديد',
    message: 'تمت إضافة منشور جديد في صفحتك',
    date: '١٥ أغسطس ٢٠٢٣',
    image: 'assets/notification3.png',
  ),
  NotificationModel(
    title: 'تم الإعجاب بمنشورك',
    message: 'أحد الأصدقاء قام بالإعجاب بمنشورك',
    date: '١٤ أغسطس ٢٠٢٣',
    image: 'assets/notification2.png',
  ),
];


const BASE_URL = "https://monitor-health-services.shopingsoft.com/php/";

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final http.Client client;

  NotificationRemoteDataSourceImpl({required this.client});
  @override
  Future<List<NotificationModel>> getAllNotifications() async {
 
    
    // final response = await client.get(
    //   Uri.parse(BASE_URL + "city.php?city=GetCity"),
    //   // headers: {"Content-Type": "application/json"},
    // );

    if (200 == 200) {
    // if (response.statusCode == 200) {
      //   final body = json.decode(response.body);
      // final error = body['error'];
      //  final List decodedJson = body['city'] as List;
      //  print(body['city']);
      //  print(error.toString());

      // final List<NotificationModel> notificationModels = notifications
          // .map<NotificationModel>((jsonNotificationModel) => NotificationModel.fromJson(jsonNotificationModel))
          // .toList();
          final List<NotificationModel> notificationModels = notifications.toList();
          
          // print(notificationModels);

      return notificationModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addNotification(NotificationModel notificationModel) async {
    
    final body = {
      "city_name": notificationModel.title,
          // "username": notificationModel.username,
        // "time": notificationModel.time,
        // "notificationText": notificationModel.notificationText,
        // "notificationImage": notificationModel.notificationImage,
        // "likes": notificationModel.likes,
        // "islikes": notificationModel.islikes,
    };

    final response =
        await client.post(Uri.parse(BASE_URL + "city.php?city=AddCity"), body: body);

    // if (response.statusCode == 201) {
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }


@override
Future<Unit> readAllNotification(int notificationId) async {
 
  // final response = await http.notification(
    
  //     Uri.parse(BASE_URL + "delete.php?delete=DeleteCity"),
  //     body: {
  //       'id': notificationId.toString(),
  //     },
  //   );


  // if (response.statusCode == 200) {
  if (200 == 200) {
    return Future.value(unit);
  } else {
    throw ServerException();
  }
}


}
