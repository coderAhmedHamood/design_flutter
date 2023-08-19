import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    title: 'إشعاربب جديد',
    message:
        ' تمت إضافة منشور جديد في صفحتك  تمت إضافة منشور جديد في صفحتك تمت إضافة منشور جديد في صفحتك تمت إضافة منشور جديد في صفحتك',
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
    image: 'assets/notification1.png',
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
    image: 'assets/notification1.png',
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

class NotificationsScreen extends StatelessWidget {
  bool isNotificationClicked = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // تغيير اتجاه النصوص والعناصر
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Directionality(
            textDirection: TextDirection.ltr,
             child: Container(
              // color: const Color.fromARGB(255, 234, 231, 231),
               child: Padding(
                 padding: const EdgeInsets.all(13.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    Icon(Icons.search,size: 30,),
                     Text(
                       "الاشعارات",
                       style: TextStyle(
                        //  backgroundColor: Colors.white,
                         fontSize: 30,
                         fontWeight: FontWeight.bold
                     //  height: .0 
                        
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
           
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
                                  backgroundImage:
                                      AssetImage(notification.image),
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
                                TextButton(
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
                                    Text(
                                      notification.message,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      notification.date,
                                      style: TextStyle(
                                        color: const Color.fromARGB(255, 215, 0, 0),
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
      
    );
  }
}
