import 'package:flutter/material.dart';

import '../../../../domain/entities/student_attendance_class.dart';
import '../../../../domain/entities/student_attendance_class.dart';
import '../../../../domain/entities/student_attendance_day.dart';
import '../../../../domain/entities/student_attendance_week.dart';

// class StudentAttendanceColumnClass {
//   final List<String> column;
//   final List<StudentAttendanceWeek> studentAttendanceClass;

//   StudentAttendanceColumnClass(
//       {required this.column, required this.studentAttendanceClass});
// }

// class StudentAttendanceWeek {
//   final String date;
//   final List<StudentAttendance> studentAttendance;

//   StudentAttendanceWeek(
//       {required this.date, required this.studentAttendance});
// }

// class StudentAttendance {
//   final String day;
//   final List<String> subjects;

//   StudentAttendance({required this.day, required this.subjects});
// }

 final List<String> column = [
    'يوم',
    'القرآن',
    'التربية الاسلامية',
    ' ...',
    'الرياضيات',
    'العلوم'
  ];

  final List<StudentAttendanceWeek> studentAttendanceWeek = [
    StudentAttendanceWeek(
      date: '2024/7/26',
      studentAttendance: [
        StudentAttendanceDay(
            day: 'السبت', subjects: ['حاضر', 'حاضر', 'حاضر', 'غائب', 'حاضر']),
        StudentAttendanceDay(
            day: 'الأحد', subjects: ['حاضر', 'مستأذن', 'حاضر', 'حاضر', 'حاضر']),
        StudentAttendanceDay(
            day: 'الاثنين',
            subjects: ['حاضر', 'حاضر', 'مستأذن', 'حاضر', 'مستأذن']),
        StudentAttendanceDay(
            day: 'الثلاثاء',
            subjects: ['حاضر', 'حاضر', 'حاضر', 'حاضر', 'غائب']),
        StudentAttendanceDay(
            day: 'الأربعاء',
            subjects: ['حاضر', 'غائب', 'حاضر', 'حاضر', 'حاضر']),
      ],
    ),
    StudentAttendanceWeek(
      date: '2024/8/3',
      studentAttendance: [
        StudentAttendanceDay(
            day: 'السبت', subjects: ['حاضر', 'حاضر', 'حاضر', 'غائب', 'حاضر']),
        StudentAttendanceDay(
            day: 'الأحد', subjects: ['حاضر', 'مستأذن', 'حاضر', 'حاضر', 'حاضر']),
        StudentAttendanceDay(
            day: 'الاثنين',
            subjects: ['حاضر', 'حاضر', 'مستأذن', 'حاضر', 'مستأذن']),
        StudentAttendanceDay(
            day: 'الثلاثاء',
            subjects: ['حاضر', 'حاضر', 'حاضر', 'حاضر', 'غائب']),
        StudentAttendanceDay(
            day: 'الأربعاء',
            subjects: ['حاضر', 'غائب', 'حاضر', 'حاضر', 'حاضر']),
      ],
    ),
  ];

  StudentAttendanceClass attendanceColumn = StudentAttendanceClass(
    column: column,
    studentAttendanceClass: studentAttendanceWeek,
  );


class AttendanceStudentViewScreen extends StatelessWidget {

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
              WidgetDataTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget WidgetDataTable() {
    List<StudentAttendanceWeek> filteredData =
        attendanceColumn.studentAttendanceClass.toList();

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
            children: List.generate(attendanceColumn.column.length, (index) {
              return TableCell(child: _WidgetCell(attendanceColumn.column[index]));
            }),
          ),
        ],
      ),
    );
  }

  Widget WidgetTable(List<StudentAttendanceDay> studentAttendanceDay) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Table(
        border: TableBorder.all(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          for (var attendance in studentAttendanceDay)
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
            color: status == 'حاضر'
                ? Colors.green
                : status == 'مستأذن'
                    ? Colors.blue
                    : status == 'غائب'
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
