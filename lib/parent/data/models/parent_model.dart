import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';
import '../../domain/entities/student_attendance_week.dart';
import 'week_model.dart';

class StudentAttendanceModel extends StudentAttendanceClass {
  StudentAttendanceModel({
    required List<String> column,
    required List<StudentAttendanceWeek> studentAttendanceClass,
  }) : super(
          column: column,
          studentAttendanceClass: studentAttendanceClass,
        );

  factory StudentAttendanceModel.fromJson(Map<String, dynamic> json) {
    List<String> column = List<String>.from(json['column']);
    List<StudentAttendanceWeek> studentAttendanceClass =
        List<StudentAttendanceWeek>.from(
      json['studentAttendanceClass']
          .map((week) => StudentAttendanceWeekModel.fromJson(week)),
    );
    return StudentAttendanceModel(
      column: column,
      studentAttendanceClass: studentAttendanceClass,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'column': column,
      'studentAttendanceClass': List<StudentAttendanceWeek>.from(
          studentAttendanceClass.map((week) =>(week as StudentAttendanceWeekModel).toJson())),
          
    };
  }
}
