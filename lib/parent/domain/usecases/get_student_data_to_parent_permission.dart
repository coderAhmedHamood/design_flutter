  


import 'package:dartz/dartz.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';

import '../../../../base/error/failures.dart';
import '../../data/models/permission_model.dart';
import '../repositories/parents_repository.dart';
 

class GetDataStudentToParentPermissionUsecase {
  final ParentsRepository repository;

  GetDataStudentToParentPermissionUsecase(this.repository);

  Future<Either<Failure, List<PermissionRequesModel>>> call(int isStudent) async {
    return await repository.getDataStudentToParentPermission(isStudent);
  }
}
