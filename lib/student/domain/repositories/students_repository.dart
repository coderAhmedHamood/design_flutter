
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../../data/models/student_model.dart';
import '../entities/student.dart';

abstract class StudentsRepository {

  Future<Either<Failure, Unit>> addStudentBehavior(List<StudentActivityClass> studentBehavior);
  Future<Either<Failure, Unit>> addStudentAttendance(List<StudentActivityClass>  studentActivityList);
  Future<Either<Failure, Unit>> addStudentAssignment(List<StudentActivityClass> studentsAssignment);
  Future<Either<Failure, Unit>> addStudentMonthTestDigree(List<StudentActivityClass> studentList);
  Future<Either<Failure, List<StudentsClassClass>>> getStudentClass();
  Future<Either<Failure, List<StudentActivityModel>>> getStudentData(int idClass);
}
