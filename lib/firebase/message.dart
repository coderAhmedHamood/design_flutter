
// import 'package:firebase_messaging/firebase_messaging.dart';

// class FirebaseApi {

// final _firebaseMessaging = FirebaseMessaging.instance;

// Future<void> initNotifications () async {

// await _firebaseMessaging. requestPermission(); 
// final fCMToken = await _firebaseMessaging.getToken();

// print('Token: $fCMToken');
// FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
// }


//   Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print("----___-------___");
//   print(message.notification?.title);
//   print(message.notification?.body);
//   print(message.data);
//   print(message.data);
//   print("----___-------___");


//   }
// }