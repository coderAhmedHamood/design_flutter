import 'package:flutter/material.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_day.dart';

import '../../../domain/entities/student_attendance_week.dart';
import '../../bloc/parent_bloc.dart';
import '../../bloc/parent_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<String> column = [''];
final List<StudentAttendanceWeek> studentStudentDataWeek = [
  StudentAttendanceWeek(
    date: '',
    studentAttendance: [
      StudentAttendanceDay(day: '', subjects: ['']),
    ],
  ),
];

StudentDataTableClass attendanceColumn = StudentDataTableClass(
  column: column,
  studentAttendanceClass: studentStudentDataWeek,
);

class TablePageTask extends StatelessWidget {
  // final StudentDataTableClass attendanceColumn;
 final String pageName;

  TablePageTask({required this.pageName});

  @override
  Widget build(BuildContext context) {
    
     return BlocBuilder<ParentBloc, ParentState>(builder: (context, state) {
      if (state is LoadedStudentDataToParentMonthlyTestState) {
        attendanceColumn = state.StudentDataTableClassMonthly;
      }
         if (state is LoadedStudentDataToParentState) {
          
          attendanceColumn = state.studentDataTableClass;
        }
 return WidgetPage();
     });
    
  }

  Widget WidgetPage(){
    return     
  
       Column(
        children: [
          WidgetCreateTable(),
              for (var data in attendanceColumn.studentAttendanceClass)
            Column(
              children: [
                Text(
                  data.date,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
              
                    decoration: TextDecoration.underline,
                  ),
                  
                ),
                WidgetTable(data.studentAttendance),
              ],
            ),

         ],
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

Widget WidgetTable(List<StudentAttendanceDay> studentAttendanceList) {
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

  double _degree = 0.0;
  Color _color = Colors.green;

  if (pageName == "MonthlyTest") {
    try {
      
      _degree = double.parse(status);
      _degree < 15 ? _color = Colors.red : _color = Colors.green;
    } catch (e) {
      _degree = 0;
      _color = Colors.grey;
    }
  }


  
    return pageName=="MonthlyTest"
    ?   Container(
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
    ):Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: pageName=="Assignment"
      ?
      Center(
        child: Text(
          status,
          style: TextStyle(
            color: status == 'مسلم'
                ? Colors.green
                : status == 'ناقص'
                    ? Colors.blue
                    : status == 'غير مسلم'
                        ? Colors.red
                        : Colors.black,
            fontWeight: FontWeight.bold,
            // fontSize: 20,
          ),
        ),
      ):pageName=="Attendance"? Center(
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
      ):Container()
    );
  
  
  }

}
