import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../entities/student.dart';
import '../entities/student_activity_class.dart';
import '../repositories/students_repository.dart';


class AddStudentAssignmentUsecase {
  final StudentsRepository repository;

  AddStudentAssignmentUsecase(this.repository);

  Future<Either<Failure, Unit>> call(List<StudentActivityClass> studentsAssignment) async {
    return await repository.addStudentAssignment(studentsAssignment);
  }
}
