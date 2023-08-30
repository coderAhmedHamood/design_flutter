import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../entities/student.dart';
import '../repositories/students_repository.dart';
import '../entities/student_activity_class.dart';
class AddStudentAttendanceUsecase {
  final StudentsRepository repository;

  AddStudentAttendanceUsecase(this.repository);

  Future<Either<Failure, Unit>> call(List<StudentActivityClass>  studentActivityList ) async {
    return await repository.addStudentAttendance(studentActivityList );
  }
}
