// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_design/constants/my_colors.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class PermissionRequestStudentViewScreen extends StatefulWidget {
  @override
  _PermissionRequestScreenState createState() =>
      _PermissionRequestScreenState();
}

class _PermissionRequestScreenState extends State<PermissionRequestStudentViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 252, 252),
        appBar: AppBar(
          // backgroundColor: Colors.green,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 19, 194, 45),
                      // Color.fromARGB(255, 37, 179, 169),
                      Color.fromARGB(255, 4, 255, 209)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1, 0.9],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(84),
                    bottomRight: Radius.circular(84),
                    // topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 7),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'طلب استئذان لطالب',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            WidgetListView(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddPermissionDialog();
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }

  Widget WidgetListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: permissionrequesclass.length,
        itemBuilder: (context, index) {
          final notification = permissionrequesclass[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                color:notification.status?
                Color.fromARGB(255, 213, 241, 207):
                Color.fromARGB(255, 243, 243, 170), 
                
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  // leading: CircleAvatar(
                  //   backgroundColor: notification.iconBackgroundColor,
                  //   child: Icon(
                  //     notification.icon,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          notification.reason,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color:
                              notification.status ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          notification.status ? "مقبول" : "جار المعالجة...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        notification.message,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 8),
                      Text(
                        notification.date,
                        style: TextStyle(
                          color: Color.fromARGB(255, 222, 3, 3),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAddPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String reason = '';
        String description = '';

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('إضافة استئذان'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropDown(
                    items: ['مريض', 'مسافر', 'ضروف خاصة'],
                    hint: Text('اختر سبب الاستئذان'),
                    onChanged: (value) {
                      if (value != null) {
                        reason = value;
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(labelText: 'وصف الاستئذان'),
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // إغلاق حوار الإضافة
                  },
                  child: Text('إلغاء'),
                ),
                TextButton(
                  onPressed: () {
                    // إضافة الاستئذان إلى قائمة الاستئذانات
                    setState(() {
                      final now = DateTime.now();
                      final dateOnly = DateTime(now.year, now.month);
                      permissionrequesclass.add(PermissionRequesClass(
                        reason: reason,
                        message: description,
                        date: dateOnly.toString(),
                        status: false,
                      ));
                    });
                    Navigator.pop(context); // إغلاق حوار الإضافة
                  },
                  child: Text('إضافة'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class PermissionRequesClass {
  final String reason;
  final String message;
  final String date;
  final bool status;
  PermissionRequesClass({
    required this.reason,
    required this.message,
    required this.date,
    required this.status,
  });
}

final List<PermissionRequesClass> permissionrequesclass = [
  PermissionRequesClass(
    reason: 'عنوان الإشعار الأول',
    message:
        'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
    date: '13 أغسطس 2023',
    status: false,
  ),
  PermissionRequesClass(
    reason: 'عنوان الإشعار الثاني',
    message:
        'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
    date: '12 أغسطس 2023',
    status: true,
  ),
  // PermissionRequesClass(
  //   reason: 'عنوان الإشعار الثالث',
  //   message:
  //       'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
  //   date: '11 أغسطس 2023',
  //   status: false,
  // ),
  // PermissionRequesClass(
  //   reason: 'عنوان الإشعار الثالث',
  //   message:
  //       'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
  //   date: '11 أغسطس 2023',
  //   status: true,
  // ),
  // PermissionRequesClass(
  //   reason: 'عنوان الإشعار الثالث',
  //   message:
  //       'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
  //   date: '11 أغسطس 2023',
  //   status: false,
  // ),
];
