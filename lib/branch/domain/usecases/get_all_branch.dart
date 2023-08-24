import '../repositories/branch_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../entities/branch.dart';

class GetAllBranchUsecase {
  final BranchRepository repository;

  GetAllBranchUsecase(this.repository);

  Future<Either<Failure, List<Branch>>> call() async {
    return await repository.getAllBranch();
  }
}
