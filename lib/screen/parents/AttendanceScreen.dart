import 'package:flutter/material.dart';

class StudentAttendance {
  final String day;
  final List<String> subjects;

  StudentAttendance({required this.day, required this.subjects});
}

class AttendanceScreen extends StatelessWidget {


  final List<StudentAttendance> studentAttendance = [
    StudentAttendance(day: '7/26', subjects: ['', '', '', '', '']),
    StudentAttendance(
        day: 'السبت', subjects: ['حاضر', 'حاضر', 'حاضر', 'غائب', 'حاضر']),
    StudentAttendance(
        day: 'الأحد', subjects: ['حاضر', 'مستأذن', 'حاضر', 'حاضر', 'حاضر']),
    StudentAttendance(
        day: 'الاثنين', subjects: ['حاضر', 'حاضر', 'مستأذن', 'حاضر', 'مستأذن']),
    StudentAttendance(
        day: 'الثلاثاء', subjects: ['حاضر', 'حاضر', 'حاضر', 'حاضر', 'غائب']),
    StudentAttendance(
        day: 'الأربعاء', subjects: ['حاضر', 'غائب', 'حاضر', 'حاضر', 'حاضر']),
   
   StudentAttendance(day: '8/3', subjects: ['', '', '', '', '']),
    StudentAttendance(
        day: 'السبت', subjects: ['حاضر', 'حاضر', 'حاضر', 'غائب', 'حاضر']),
    StudentAttendance(
        day: 'الأحد', subjects: ['حاضر', 'مستأذن', 'حاضر', 'حاضر', 'حاضر']),
    StudentAttendance(
        day: 'الاثنين', subjects: ['حاضر', 'حاضر', 'مستأذن', 'حاضر', 'مستأذن']),
    StudentAttendance(
        day: 'الثلاثاء', subjects: ['حاضر', 'حاضر', 'حاضر', 'حاضر', 'غائب']),
    StudentAttendance(
        day: 'الأربعاء', subjects: ['حاضر', 'غائب', 'حاضر', 'حاضر', 'حاضر']),
    StudentAttendance(day: '9/11', subjects: ['', '', '', '', '']),
     StudentAttendance(
        day: 'السبت', subjects: ['حاضر', 'حاضر', 'حاضر', 'غائب', 'حاضر']),
    StudentAttendance(
        day: 'الأحد', subjects: ['حاضر', 'مستأذن', 'حاضر', 'حاضر', 'حاضر']),
    StudentAttendance(
        day: 'الاثنين', subjects: ['حاضر', 'حاضر', 'مستأذن', 'حاضر', 'مستأذن']),
    StudentAttendance(
        day: 'الثلاثاء', subjects: ['حاضر', 'حاضر', 'حاضر', 'حاضر', 'غائب']),
    StudentAttendance(
        day: 'الأربعاء', subjects: ['حاضر', 'غائب', 'حاضر', 'حاضر', 'حاضر']),
    StudentAttendance(day: '9/19', subjects: ['', '', '', '', '']),
     StudentAttendance(
        day: 'السبت', subjects: ['حاضر', 'حاضر', 'غائب', 'حاضر', 'مستأذن']),
    StudentAttendance(
        day: 'الأحد', subjects: ['حاضر', 'حاضر', 'حاضر', 'حاضر', 'غائب']),
    StudentAttendance(
        day: 'الاثنين', subjects: ['حاضر', 'حاضر', 'حاضر', 'حاضر', 'حاضر']),
  ];
// final List<StudentAttendance> studentAttendance = [
//   StudentAttendance(day: '7/26', subjects: ['', '']),
//   StudentAttendance(day: 'السبت', subjects: ['حاضر', 'غائب']),
//   StudentAttendance(day: 'الأحد', subjects: ['حاضر', 'حاضر']),
//   StudentAttendance(day: 'الاثنين', subjects: ['حاضر', 'مستأذن']),
//   StudentAttendance(day: 'الثلاثاء', subjects: ['حاضر', 'حاضر']),
//   StudentAttendance(day: 'الأربعاء', subjects: ['حاضر', 'حاضر']),
//   StudentAttendance(day: '7/26', subjects: ['', '']),
//   StudentAttendance(day: 'السبت', subjects: ['مستأذن', 'حاضر']),
//   StudentAttendance(day: 'الأحد', subjects: ['حاضر', 'غائب']),
//   StudentAttendance(day: 'الاثنين', subjects: ['حاضر', 'حاضر']),
// ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('كشف الحضور والغياب'),
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

// List<String> columnNames = ['ي/ت', 'القرآن', 'التربية الاسلامية'];

List<String> columnNames = ['ي/ت', 'القرآن', 'التربية الاسلامية', 'اللغة العربية', 'الرياضيات', 'العلوم'];

Widget WidgetTable() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Table(
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: List.generate(columnNames.length, (index) {
            return TableCell(child: WidgetCell(columnNames[index]));
          }),
        ),
        ...studentAttendance.map((attendance) {
          return TableRow(
            children: [
              TableCell(child: WidgetCell(attendance.day)),
              ...attendance.subjects.map((subject) {
                return TableCell(child: _buildAttendanceStatus(subject));
              }).toList(),
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

  Widget _buildAttendanceStatus(String status) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: status == 'حاضر'
            ? Colors.green
            : status == 'مستأذن'
                ? Colors.blue
                : status == 'غائب'
                    ? Colors.red
                    : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(color: Colors.white),
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
              'كشف الحضور والغياب للطالب',
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
