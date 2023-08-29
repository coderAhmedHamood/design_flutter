import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../entities/student.dart';
import '../repositories/students_repository.dart';

class AddStudentBehaviorUsecase {
  final StudentsRepository repository;

  AddStudentBehaviorUsecase(this.repository);

  Future<Either<Failure, Unit>> call(List<StudentActivityClass> studentBehavior) async {
    return await repository.addStudentBehavior(studentBehavior);
  }
}
