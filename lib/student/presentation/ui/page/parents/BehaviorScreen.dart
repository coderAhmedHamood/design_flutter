import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NotificationItem {
  final String title;
  final String message;
  final String date;
  final String image;

  NotificationItem({
    required this.title,
    required this.message,
    required this.date,
    required this.image,
  });
}

final List<NotificationItem> notifications = [
  NotificationItem(
    title: 'إشعار جديد',
    message: 'تمت إضافة منشور جديد في صفحتك',
    date: '١٥ أغسطس ٢٠٢٣',
    image: 'assets/notification1.png',
  ),
  NotificationItem(
    title: 'تم الإعجاب بمنشورك',
    message: 'أحد الأصدقاء قام بالإعجاب بمنشورك',
    date: '١٤ أغسطس ٢٠٢٣',
    image: 'assets/notification2.png',
  ),
  NotificationItem(
    title: 'إشعار جديد',
    message: 'تمت إضافة منشور جديد في صفحتك',
    date: '١٥ أغسطس ٢٠٢٣',
    image: 'assets/notification3.png',
  ),
  NotificationItem(
    title: 'تم الإعجاب بمنشورك',
    message: 'أحد الأصدقاء قام بالإعجاب بمنشورك',
    date: '١٤ أغسطس ٢٠٢٣',
    image: 'assets/notification2.png',
  ),
 

  // يمكنك إضافة المزيد من الإشعارات هنا
];

class BehaviorStudentViewScreen extends StatefulWidget {
  @override
  _BehaviorStudentScreenState createState() => _BehaviorStudentScreenState();
}

class _BehaviorStudentScreenState extends State<BehaviorStudentViewScreen> {
  bool isNotificationClicked = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // تغيير اتجاه النصوص والعناصر
      child: Scaffold(
        appBar: AppBar(
          title: Text("الاشعارات"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return InkWell(
                    onTap: () {
                      isNotificationClicked = true;
                    showDialog(
  context: context,
  builder: (context) => Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            backgroundImage: AssetImage(notification.image),
            radius: 40,
          ),
          SizedBox(height: 16),
          Text(
            notification.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            notification.message,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('إغلاق'),
          ),
        ],
      ),
    ),
  ),
);
                    },
                    child: Ink(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 0.5,
                                ),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  backgroundImage:
                                      AssetImage(notification.image),
                                ),
                                title: Text(
                                  notification.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(notification.message),
                                    SizedBox(height: 4),
                                    Text(
                                      notification.date,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
