import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../entities/student.dart';
import '../repositories/students_repository.dart';
import '../entities/student_activity_class.dart';
class AddStudentMonthTestUsecase {
  final StudentsRepository repository;

  AddStudentMonthTestUsecase(this.repository);

  Future<Either<Failure, Unit>> call(List<StudentActivityClass> studentList) async {
    return await repository.addStudentMonthTestDigree(studentList);
  }
}


 