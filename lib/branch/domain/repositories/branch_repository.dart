import '../entities/branch.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';

abstract class BranchRepository {
  Future<Either<Failure, List<Branch>>> getAllBranch();
}
