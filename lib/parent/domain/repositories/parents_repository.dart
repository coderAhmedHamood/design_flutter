
import 'package:dartz/dartz.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';
import 'package:flutter_design/parent/presentation/bloc/parent_event.dart';

import '../../../../base/error/failures.dart';
import '../../../student/domain/entities/student_activity_class.dart';

abstract class ParentsRepository {

  Future<Either<Failure, Unit>> addStudentBehavior(List<StudentActivityClass> studentBehavior);
  Future<Either<Failure, Unit>> addStudentAttendance(List<StudentActivityClass>  studentActivityList);
  Future<Either<Failure, Unit>> addStudentAssignment(List<StudentActivityClass> studentsAssignment);
  Future<Either<Failure, Unit>> addStudentMonthTestDigree(List<StudentActivityClass> studentList);
  Future<Either<Failure, StudentAttendanceClass>> getDataStudentToParent(int isStudent);
  // Future<Either<Failure, List<StudentActivityModel>>> getStudentData(int idClass);
}
