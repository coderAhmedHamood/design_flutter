import 'package:equatable/equatable.dart';

import 'student_attendance_week.dart';

class StudentDataTableClass extends Equatable {
  final List<String> column;
  final List<StudentAttendanceWeek> studentAttendanceClass;

  StudentDataTableClass(
      {required this.column, required this.studentAttendanceClass});

  @override
  List<Object?> get props => [column, studentAttendanceClass];
}




// import 'package:equatable/equatable.dart';

// import 'student_attendance_week.dart';

// class StudentAttendanceClass extends Equatable {
//   final List<String> column;
//   final List<StudentAttendanceWeek> studentAttendanceClass;

//   StudentAttendanceClass(
//       {required this.column, required this.studentAttendanceClass});

//   @override
//   List<Object?> get props => [column, studentAttendanceClass];
// }




