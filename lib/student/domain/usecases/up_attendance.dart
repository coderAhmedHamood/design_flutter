import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../entities/student.dart';
import '../repositories/students_repository.dart';

class AddStudentAttendanceUsecase {
  final StudentsRepository repository;

  AddStudentAttendanceUsecase(this.repository);

  Future<Either<Failure, Unit>> call(StudentsAttendanceClass studentsAttendanceClass) async {
    return await repository.addStudentAttendance(studentsAttendanceClass);
  }
}
