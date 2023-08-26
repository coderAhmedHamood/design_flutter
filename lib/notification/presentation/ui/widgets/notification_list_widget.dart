import 'package:flutter_design/notification/domain/entities/notification.dart';

import 'package:flutter/material.dart';



 
class NotificationListWidget extends StatelessWidget {
  final List<NotificationClass> notifications;
    bool isNotificationClicked = false;
    NotificationListWidget({
    Key? key,
    required this.notifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  print(notification);
                  print(".......................///");
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
            ); 
    
  }
}
