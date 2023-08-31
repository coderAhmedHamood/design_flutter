import 'package:flutter_design/parent/data/models/parent_model.dart';

import '../../domain/entities/student_attendance_day.dart';
import '../../domain/entities/student_attendance_week.dart';
import 'day_model.dart';
 
class StudentAttendanceWeekModel extends StudentAttendanceWeek {
  StudentAttendanceWeekModel({
    required String date,
    required List<StudentAttendanceDay> studentAttendance,
  }) : super(
          date: date,
          studentAttendance: studentAttendance,
        );

  factory StudentAttendanceWeekModel.fromJson(Map<String, dynamic> json) {
    String date = json['date'];
    List<StudentAttendanceDay> studentAttendance = List<StudentAttendanceDay>.from(
      json['studentAttendance']
          .map((day) => StudentAttendanceDayModel.fromJson(day)),
    );
    return StudentAttendanceWeekModel(
      date: date,
      studentAttendance: studentAttendance,
    );
  }

  Map<String, dynamic> toJson() {
   return {
      'date': date,
      

       'studentAttendance': List<StudentAttendanceDay>.from(
        studentAttendance.map((day) => day ),
      ),
    };
  }
}
