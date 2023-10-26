
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationManager {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   // Initialize notification settings
//   Future<void> initialize() async {
//     const initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
//     final initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   // Show the notification
//   Future<void> showNotification({
//     required String title,
//     required String message,
//     required String payload,
//   }) async {
//     const androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       // 'your_channel_description',
//       importance: Importance.high,
//       priority: Priority.high,
//       playSound: true,
//       styleInformation: DefaultStyleInformation(true, true),
//     );
//     const platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       message,
//       platformChannelSpecifics,
//       payload: payload,
//     );
//   }
// }