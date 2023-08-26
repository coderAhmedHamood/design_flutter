
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../entities/student.dart';

abstract class StudentsRepository {

  Future<Either<Failure, Unit>> addStudentBehavior(Student student);
  Future<Either<Failure, Unit>> addStudentAttendance(StudentsAttendanceClass studentsAttendanceClass);
  Future<Either<Failure, Unit>> addStudentAssignment(Student student);
  Future<Either<Failure, Unit>> addStudentMonthTestDigree(Student student);
  Future<Either<Failure, List<StudentsClassClass>>> getStudentClass();
}
