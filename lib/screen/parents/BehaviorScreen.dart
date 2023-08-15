import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentAttendance {
  final String day;
  final IconData icon;
  final String title;
  final String message;

  StudentAttendance({
    required this.day,
    required this.icon,
    required this.title,
    required this.message,
  });
}

class BehaviorScreen extends StatelessWidget {
  final List<StudentAttendance> studentAttendance = [
    // StudentAttendance(day: '7/26', subjects: ['', '']),
    StudentAttendance(
        day: 'السبت',
        icon: Icons.info,
        title: 'جيد جدا ',
        message: 'الولد ماشاء الله ذكي وممتاز اهتمو بة جيداً'),
    StudentAttendance(
        day: 'السبت',
        icon: Icons.warning,
        title: 'مشاغب ',
        message: 'الولد ماشاء الله ذكي وممتاز لاكن مشاغب علموة جيداً'),
    StudentAttendance(
        day: 'السبت',
        icon: Icons.error,
        title: 'مشاغب جدا',
        message: 'يجب الاهتمام به اكثر هاذا التسيب لا يجوز'),
    // StudentAttendance(day: 'الاحد', subjects: ['Icons.warning', 'تحذير لولي امر الطالب ', 'الولد ماشاء الله ذكي لاكن مشاغب بكثرة']),
    // StudentAttendance(day: '7/29', subjects: ['', '']),
    // StudentAttendance(day: 'الإثنين', subjects: ['Icons.error', 'تحذير شديد ', 'المشاغبة زادة الى حد كبير ']),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('كشف السلوك'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              WidgetTitle(),
              SizedBox(height: 10),
              WidgetTable(),
            ],
          ),
        ),
      ),
    );
  }

  List<String> columnNames = ['ي/ت', 'الحالة', 'العنوان', 'الوصف'];

  Widget WidgetTable() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Table(
        border: TableBorder.symmetric(
          inside: BorderSide(width: 1.0, color: Colors.grey),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[300]),
            children: List.generate(columnNames.length, (index) {
              return TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    columnNames[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ),
          ...studentAttendance.map((attendance) {
            Color backgroundColor;
            var colorIcon;
            switch (attendance.icon) {
              case Icons.info:
                backgroundColor = Colors.white;
                colorIcon = Color.fromARGB(255, 5, 47, 254);
                break;
              case Icons.warning:
                backgroundColor = Color.fromARGB(255, 193, 201, 219);
                // backgroundColor = Color.fromARGB(255, 158, 157, 157);
                colorIcon = const Color.fromARGB(255, 249, 225, 8);
                break;
              case Icons.error:
                backgroundColor =  Color.fromARGB(255, 163, 169, 185);
                // backgroundColor = Color.fromARGB(255, 132, 132, 129);
                colorIcon = Color.fromARGB(255, 222, 3, 3);
                break;
              default:
                backgroundColor = Colors.transparent;
                colorIcon = Colors.black;
            }

            return TableRow(
              decoration: BoxDecoration(color: backgroundColor),
              children: [
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text(
                      attendance.day,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Icon(
                      attendance.icon,
                      size: 60.0,
                      color: colorIcon,
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text(
                      attendance.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text(
                      attendance.message,
                      style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget WidgetCell(String cellName) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(child: Text(cellName)),
    );
  }

  Widget _buildAttendanceStatus(
    String icon,
    String title,
    String message,
  ) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.error),
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget WidgetTitle() {
    return Padding(
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
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
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
              'سلوك الطالب',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
