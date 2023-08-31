  


import 'package:dartz/dartz.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';

import '../../../../base/error/failures.dart';
import '../repositories/parents_repository.dart';
 

class GetDataStudentToParenttUsecase {
  final ParentsRepository repository;

  GetDataStudentToParenttUsecase(this.repository);

  Future<Either<Failure, StudentAttendanceClass>> call(int isStudent) async {
    return await repository.getDataStudentToParent(isStudent);
  }
}
