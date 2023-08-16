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

class MonthlyTestsScreen extends StatelessWidget {
  final List<StudentAttendanceClassTwo> studentAttendanceClassTwo = [
    StudentAttendanceClassTwo(
      date: 'الترم الاول',
      studentAttendance: [
        StudentAttendance(day: 'القران', subjects: ['15', '30.0']),
        StudentAttendance(day: 'التربية الاسلامية', subjects: ['10', '10']),
        StudentAttendance(day: 'الرياضيات', subjects: ['28', '30']),
        StudentAttendance(day: 'العلوم', subjects: ['11', '20']),
        StudentAttendance(day: 'اللغة العربية', subjects: ['18', '13']),
        StudentAttendance(day: 'الاجتماعيات', subjects: ['28', '15']),
      ],
    ),
    StudentAttendanceClassTwo(
      date: 'الترم الثاني',
      studentAttendance: [
        StudentAttendance(day: 'القران', subjects: ['15', '30f']),
        StudentAttendance(day: 'التربية الاسلامية', subjects: ['28', '30']),
        StudentAttendance(day: 'الرياضيات', subjects: ['14', '30']),
        StudentAttendance(day: 'العلوم', subjects: ['11', '20']),
        StudentAttendance(day: 'اللغة العربية', subjects: ['28', '9']),
        StudentAttendance(day: 'الاجتماعيات', subjects: ['28', '30']),
      ],
    ),
  ];
  List<String> columnNames = ['المادة', '2024/8/15', '2024/9/15'];

  Color _getStatusColor(String status) {
    try {
      final intStatus = double.parse(status);
      return intStatus < 15 ? Colors.red : Colors.green;
    } catch (e) {
      // يحدث خطأ في تحويل القيمة إلى رقم صحيح
      // يمكنك تعيين لون افتراضي هنا
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(' الاختبار الشهري'),
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
    double _degree;
    Color _color;

    _degree = 0.0;
    _color = Colors.green;

    try {
      _degree = double.parse(status);
      _degree < 15 ? _color = Colors.red : _color = Colors.green;
    } catch (e) {
      _degree = 0;
      _color = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          _degree == 0 ? 'فارغ' : _degree.toString(),
          style: TextStyle(
            color: _color,

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
              'درجات الاختبار الشهرية للطالب',
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
