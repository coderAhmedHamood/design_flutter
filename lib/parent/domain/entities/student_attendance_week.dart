import 'package:equatable/equatable.dart';

import 'student_attendance_day.dart';

class StudentAttendanceWeek extends Equatable {
  final String date;
  final List<StudentAttendanceDay> studentAttendance;

  StudentAttendanceWeek({required this.date, required this.studentAttendance});
  @override
  List<Object?> get props => [date, studentAttendance];
}