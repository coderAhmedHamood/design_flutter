  


import 'package:dartz/dartz.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';

import '../../../../base/error/failures.dart';
import '../repositories/parents_repository.dart';
 

class GetDataStudentToParentMonthlyTestUsecase {
  final ParentsRepository repository;

  GetDataStudentToParentMonthlyTestUsecase(this.repository);

  Future<Either<Failure, StudentDataTableClass>> call(int isStudent) async {
    return await repository.getDataStudentToParentMonthlyTest(isStudent);
  }
}
