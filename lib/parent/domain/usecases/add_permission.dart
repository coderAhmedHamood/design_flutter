  


import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../../data/models/permission_model.dart';
import '../repositories/parents_repository.dart';
 

class AddPermissionToStudentUsecase {
  final ParentsRepository repository;

  AddPermissionToStudentUsecase(this.repository);

  Future<Either<Failure, Unit>> call(PermissionRequesModel permissionReques ) async {
    return await repository.addPermissionToStudent(permissionReques);
  }
}

 