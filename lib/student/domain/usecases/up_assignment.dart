import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../entities/student.dart';
import '../repositories/students_repository.dart';


class AddAssignmentUsecase {
  final StudentsRepository repository;

  AddAssignmentUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Student student) async {
    return await repository.addStudentAssignment(student);
  }
}
