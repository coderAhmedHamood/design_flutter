// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BehaviourStudentsClass {
  String name;
  String title;
  String message;
  int id;

  BehaviourStudentsClass({
    required this.name,
    required this.title,
    required this.message,
    required this.id,
  });
}





class BehaviourStudents extends StatefulWidget {
  @override
  State<BehaviourStudents> createState() => _BehaviourStudentsState();
}

class _BehaviourStudentsState extends State<BehaviourStudents> {





  List<BehaviourStudentsClass> students = [
    BehaviourStudentsClass(
      name: 'عبداللة بن سعيد',
      title: 'عنوان الطالب',
      message: 'رسالة الطالب',
      id: 19,
    ),
    BehaviourStudentsClass(
      name: 'محمد العيساوي',
      title: 'عنوان الطالب',
      message: 'رسالة الطالب',
      id: 1,
    ),
    BehaviourStudentsClass(
      name: 'مريم علي',
      title: 'عنوان الطالب',
      message: 'رسالة الطالب',
      id: 2,
    ),
    BehaviourStudentsClass(
      name: 'زينب فارع',
      title: 'عنوان الطالب',
      message: 'رسالة الطالب',
      id: 3,
    ),
    BehaviourStudentsClass(
      name: 'علي المقطري',
      title: 'عنوان الطالب',
      message: 'رسالة الطالب',
      id: 4,
    ),
    BehaviourStudentsClass(
      name: 'فواد علي سالم',
      title: 'عنوان الطالب',
      message: 'رسالة الطالب',
      id: 5,
    ),
    BehaviourStudentsClass(
      name: 'مريم القاسمي',
      title: 'عنوان الطالب',
      message: 'رسالة الطالب',
      id: 6,
    ),
    BehaviourStudentsClass(
      name: 'عبدالله زين',
      title: 'عنوان الطالب',
      message: 'رسالة الطالب',
      id: 8,
    ),
    BehaviourStudentsClass(
      name: 'سيف الحداد',
      title: 'عنوان الطالب',
      message: 'رسالة الطالب',
      id: 9,
    ),
  ];
  bool behaviour = false;

  void showGradeInputDialog(
      BuildContext context, String studentName, int index) {
    String notificationTitle = '';
    String notificationContent = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    studentName,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              TextField(
                onChanged: (value) {
                  notificationTitle = value;
                },
                decoration: InputDecoration(
                  labelText: 'عنوان الإشعار',
                  alignLabelWithHint: true,
                ),
                textAlign: TextAlign.end,
                textDirection: TextDirection.ltr,
              ),
              TextField(
                onChanged: (value) {
                  notificationContent = value;
                },
                maxLines: null,
                decoration: InputDecoration(
                  alignLabelWithHint: false,
                  labelText: 'محتوى الإشعار',
                ),
                textAlign: TextAlign.end,
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: TextButton(
                      onPressed: () {
                        print("cancel");
                        Navigator.of(context).pop(); // إغلاق الـ dialog
                      },
                      child: Text(
                        'إلغاء',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: TextButton(
                      onPressed: () {
                        print("accept");
                        print(notificationTitle);
                        print(notificationContent);
                        // قم بإرسال العنوان والمحتوى إلى الأماكن التي ترغب فيها
                        Navigator.of(context).pop(); // إغلاق الـ dialog
                      },
                      child: Text(
                        'إرسال',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors,
      appBar: AppBar(
        title: Center(
          child: Text(
            'وضع سلوك الطلاب',
            style: TextStyle(color: Colors.white),
          ),
        ),
       leading: IconButton(
              iconSize: 40,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // context.pop(),
                 Navigator.of(context).pop();
              },
            ),
      ),
      body: Column(
        children: [
          titleBody(),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      showGradeInputDialog(
                          context, students[index].name, index);

                      // students[index].isPresent = !students[index].isPresent;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.notification_add,
                              size: 30, // Set the size of the icon
                              color: Colors.blue,
                            )
                          ],
                        ),
                        Expanded(
                          child: Text(
                            students[index].name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
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

  Widget titleBody() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 22, 153, 98),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'سلوك الصف الثالث ابتدائي',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'التربية الإسلامية',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
