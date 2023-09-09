
import 'package:dartz/dartz.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';

import '../../../../base/error/failures.dart';
import '../../data/models/permission_model.dart';

abstract class ParentsRepository {

  Future<Either<Failure, StudentDataTableClass>> getDataStudentToParent(int isStudent);
  Future<Either<Failure, StudentDataTableClass>> getDataStudentToParentMonthlyTest(int isStudent);
  Future<Either<Failure, StudentDataTableClass>> getDataStudentToParentAssignments(int isStudent);
  Future<Either<Failure, StudentDataTableClass>> getDataStudentToParentAssignedTask(int isStudent);
  Future<Either<Failure, List<PermissionRequesModel>>> getDataStudentToParentPermission(int isStudent);
  Future<Either<Failure, Unit>> addPermissionToStudent(PermissionRequesModel permissionReques);
  
}
