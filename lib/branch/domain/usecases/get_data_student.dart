import '../entities/data_student.dart';
import '../repositories/branch_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
 
class GetAllDataStudentUsecase {
  final BranchRepository repository;

  GetAllDataStudentUsecase(this.repository);

  Future<Either<Failure, List<DataStudent>>> call(int idBranch) async {
    return await repository.getAllDataStudent(idBranch);
  }
}
