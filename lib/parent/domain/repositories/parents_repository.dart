
import 'package:dartz/dartz.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';

import '../../../../base/error/failures.dart';
import '../../data/models/permission_model.dart';

abstract class ParentsRepository {

  Future<Either<Failure, StudentAttendanceClass>> getDataStudentToParent(int isStudent);
  Future<Either<Failure, StudentAttendanceClass>> getDataStudentToParentMonthlyTest(int isStudent);
  Future<Either<Failure, StudentAttendanceClass>> getDataStudentToParentAssignments(int isStudent);
  Future<Either<Failure, List<PermissionRequesModel>>> getDataStudentToParentPermission(int isStudent);
  Future<Either<Failure, Unit>> addPermissionToStudent(PermissionRequesModel permissionReques);
  
}
