import 'package:dartz/dartz.dart';

import '../../../../base/error/exceptions.dart';
import '../../../../base/error/failures.dart';
import '../../../../base/network/network_info.dart';
import '../../domain/entities/branch.dart';
import '../../domain/repositories/branch_repository.dart';
import '../datasources/branch_local_data_source.dart';
import '../datasources/branch_remote_data_source.dart';
  
typedef Future<Unit> GetBranch();

class BranchRepositoryImpl implements BranchRepository {
  final BranchRemoteDataSource remoteDataSource;
  final BranchLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  BranchRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<Branch>>> getAllBranch() async {
    if (await networkInfo.isConnected) {
      try {
        print("repositorise ..........getAllBranch..........");
        
        final remoteBranch = await remoteDataSource.getAllBranch();
        localDataSource.cacheBranchs(remoteBranch);
        //hare store the data to cash
        return Right(remoteBranch);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        
        print("repositorise ..............getCachedBranchs......");
        
        final localBranch = await localDataSource.getCachedBranchs();
        return Right(localBranch);
      } on EmptyCacheException {
   
        return Left(EmptyCacheFailure());
      }
    }
  }

  Future<Either<Failure, Unit>> _getMessage(
      GetBranch getBranch) async {
    if (await networkInfo.isConnected) {
      try {
        await getBranch();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
