  


import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../entities/student.dart';
import '../repositories/students_repository.dart';

class GetStudentClassUsecase {
  final StudentsRepository repository;

  GetStudentClassUsecase(this.repository);

  Future<Either<Failure, List<StudentsClassClass>>> call() async {
    return await repository.getStudentClass();
  }
}
