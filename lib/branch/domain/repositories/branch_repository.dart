import '../entities/branch.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../entities/data_student.dart';

abstract class BranchRepository {
  Future<Either<Failure, List<Branch>>> getAllBranch();
  Future<Either<Failure, List<DataStudent>>> getAllDataStudent(int idBranch);
}
