import 'package:awesome_notifications/awesome_notifications.dart';

void createNotification(
  int id,
  String channelKey,
  String title,
  String body,
  String bigPicture,
) {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelKey,
      title: title,
      body: body,
      bigPicture: bigPicture,
      notificationLayout: NotificationLayout.BigPicture,
    ),
  );
}
 