import 'package:flutter/material.dart';

class StudentAttendanceClassTwo {
  final String date;
  final List<StudentAttendance> studentAttendance;

  StudentAttendanceClassTwo(
      {required this.date, required this.studentAttendance});
}

class StudentAttendance {
  final String day;
  final List<String> subjects;

  StudentAttendance({required this.day, required this.subjects});
}

class AssignmentsStudentViewScreen extends StatelessWidget {
  final List<StudentAttendanceClassTwo> studentAttendanceClassTwo = [
    StudentAttendanceClassTwo(
      date: '2024/7/26',
      studentAttendance: [
        StudentAttendance(
            day: 'السبت', subjects: ['مسلم', 'مسلم', 'مسلم', 'فير مسلم', 'مسلم']),
        StudentAttendance(
            day: 'الأحد', subjects: ['مسلم', 'ناقص', 'مسلم', 'مسلم', 'مسلم']),
        StudentAttendance(
            day: 'الاثنين',
            subjects: ['مسلم', 'مسلم', 'ناقص', 'مسلم', 'ناقص']),
        StudentAttendance(
            day: 'الثلاثاء',
            subjects: ['مسلم', 'مسلم', 'مسلم', 'مسلم', 'فير مسلم']),
        StudentAttendance(
            day: 'الأربعاء',
            subjects: ['مسلم', 'فير مسلم', 'مسلم', 'مسلم', 'مسلم']),
      ],
    ),
    StudentAttendanceClassTwo(
      date: '2024/8/3',
      studentAttendance: [
        StudentAttendance(
            day: 'السبت', subjects: ['مسلم', 'مسلم', 'مسلم', 'فير مسلم', 'مسلم']),
        StudentAttendance(
            day: 'الأحد', subjects: ['مسلم', 'ناقص', 'مسلم', 'مسلم', 'مسلم']),
        StudentAttendance(
            day: 'الاثنين',
            subjects: ['مسلم', 'مسلم', 'ناقص', 'مسلم', 'ناقص']),
        StudentAttendance(
            day: 'الثلاثاء',
            subjects: ['مسلم', 'مسلم', 'مسلم', 'مسلم', 'فير مسلم']),
        StudentAttendance(
            day: 'الأربعاء',
            subjects: ['مسلم', 'فير مسلم', 'مسلم', 'فير مسلم', 'فير مسلم']),
      ],
    ),
    StudentAttendanceClassTwo(
      date: '2024/8/19',
      studentAttendance: [
        StudentAttendance(
            day: 'السبت', subjects: ['مسلم', 'مسلم', 'فير مسلم', 'مسلم', 'ناقص']),
        StudentAttendance(
            day: 'الأحد', subjects: ['مسلم', 'مسلم', 'مسلم', 'مسلم', 'فير مسلم']),
        StudentAttendance(
            day: 'الاثنين', subjects: ['مسلم', 'مسلم', 'مسلم', 'مسلم', 'مسلم']),
      ],
    ),
    StudentAttendanceClassTwo(
      date: '2024/8/11',
      studentAttendance: [
        StudentAttendance(
            day: 'السبت', subjects: ['مسلم', 'مسلم', 'مسلم', 'فير مسلم', 'مسلم']),
        StudentAttendance(
            day: 'الأحد', subjects: ['مسلم', 'ناقص', 'مسلم', 'مسلم', 'مسلم']),
        StudentAttendance(
            day: 'الاثنين',
            subjects: ['مسلم', 'مسلم', 'ناقص', 'مسلم', 'ناقص']),
        StudentAttendance(
            day: 'الثلاثاء',
            subjects: ['مسلم', 'مسلم', 'مسلم', 'مسلم', 'فير مسلم']),
        StudentAttendance(
            day: 'الأربعاء',
            subjects: ['مسلم', 'فير مسلم', 'مسلم', 'مسلم', 'مسلم']),
      ],
    ),
  ];
  // List<String> columnNames = ['يوم', 'القرآن', 'التربية الاسلامية'];
  List<String> columnNames = [
    'يوم',
    'القرآن',
    'التربية الاسلامية',
    'اللغة العربية',
    'الرياضيات',
    'العلوم'
  ];
  late bool chickIndex = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('كشف الواجبات'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              WidgetTitle(),
              SizedBox(height: 10),
              WidgetDataTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget WidgetDataTable() {
    List<StudentAttendanceClassTwo> filteredData =
        studentAttendanceClassTwo.toList();

    return Container(
      child: Column(
        children: [
          WidgetCreateTable(),
          for (var data in filteredData)
            Column(
              children: [
                Text(
                  data.date,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  
                ),
                WidgetTable(data.studentAttendance),
              ],
            ),
          // Continue displaying additional data or widgets here
        ],
      ),
    );
  }

  Widget WidgetCreateTable() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Table(
        border: TableBorder.all(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            children: List.generate(columnNames.length, (index) {
              return TableCell(child: _WidgetCell(columnNames[index]));
            }),
          ),
        ],
      ),
    );
  }

  Widget WidgetTable(List<StudentAttendance> studentAttendanceList) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Table(
        border: TableBorder.all(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          for (var attendance in studentAttendanceList)
            TableRow(
              children: [
                TableCell(child: _WidgetCell(attendance.day)),
                ...attendance.subjects.map((subject) {
                  return TableCell(child: _buildAttendanceStatus(subject));
                }).toList(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _WidgetCell(String cellName) {
    return Container(
      color: const Color.fromARGB(255, 235, 234, 234),
      padding: EdgeInsets.all(8),
      child: Center(child: Text(cellName)),
    );
  }

  Widget _buildAttendanceStatus(String status) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            color: status == 'مسلم'
                ? Colors.green
                : status == 'ناقص'
                    ? Colors.blue
                    : status == 'فير مسلم'
                        ? Colors.red
                        : Colors.white,
            fontWeight: FontWeight.bold,
            // fontSize: 20,
          ),
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
              'كشف واجبات الطالب',
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
