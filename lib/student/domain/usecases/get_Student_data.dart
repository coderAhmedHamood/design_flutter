  


import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../../data/models/student_model.dart';
 import '../repositories/students_repository.dart';

class GetStudentDataUsecase {
  final StudentsRepository repository;

  GetStudentDataUsecase(this.repository);

  Future<Either<Failure, List<StudentActivityModel>>> call(int idClass) async {
    return await repository.getStudentData(idClass);
  }
}
