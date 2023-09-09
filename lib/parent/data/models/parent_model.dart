import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';
import '../../domain/entities/student_attendance_week.dart';
import 'week_model.dart';

class StudentDataTableModel extends StudentDataTableClass {
  StudentDataTableModel({
    required List<String> column,
    required List<StudentAttendanceWeek> StudentDataTableClass,
  }) : super(
          column: column,
          studentAttendanceClass: StudentDataTableClass,
        );

  factory StudentDataTableModel.fromJson(Map<String, dynamic> json) {
    List<String> column = List<String>.from(json['column']);
    List<StudentAttendanceWeek> StudentDataTableClass =
        List<StudentAttendanceWeek>.from(
      json['StudentDataTableClass']
          .map((week) => StudentAttendanceWeekModel.fromJson(week)),
    );
    return StudentDataTableModel(
      column: column,
      StudentDataTableClass: StudentDataTableClass,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'column': column,
      'StudentDataTableClass':
       List<StudentAttendanceWeek>.from(
          studentAttendanceClass.map((week) =>week )),
      // StudentDataTableClass.map((week) => week).toList(),
      
      
      // 'StudentDataTableClass': List<StudentAttendanceWeek>.from(
      //     StudentDataTableClass.map((week) =>(week as StudentAttendanceWeekModel).toJson())),
          
    };
  }
}
