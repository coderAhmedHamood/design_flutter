import 'package:dartz/dartz.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';

import '../../../../base/error/exceptions.dart';
import '../../../../base/error/failures.dart';
import '../../../../base/network/network_info.dart';
import '../../domain/entities/permission_class.dart';
import '../../domain/repositories/parents_repository.dart';
import '../datasources/parent_local_data_source.dart';
import '../datasources/parent_remote_data_source.dart';
import '../models/permission_model.dart';


typedef Future<Unit> PermissionData();

class ParentsRepositoryImpl implements ParentsRepository {
  final ParentRemoteDataSource remoteDataSource;
  final ParentLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  ParentsRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
 
  @override
  Future<Either<Failure, StudentAttendanceClass>> getDataStudentToParent(int idStudent) async {
    if (await networkInfo.isConnected) {
      try {
 
        final remotePosts = await remoteDataSource.getStudentDataToParent(idStudent);
        // localDataSource.cachedStudentDataToParent(remotePosts);
               
        //hare store the data to cash
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedStudentDataToParent();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
 


  @override
  Future<Either<Failure, StudentAttendanceClass>> getDataStudentToParentMonthlyTest(int idStudent) async {
    if (await networkInfo.isConnected) {
      try {
 
        final remotePosts = await remoteDataSource.getStudentDataToParentMonthlyTest(idStudent);
        // localDataSource.cachedStudentDataToParent(remotePosts);
               
        //hare store the data to cash
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedStudentDataToParent();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, StudentAttendanceClass>> getDataStudentToParentAssignments(int idStudent) async {
    if (await networkInfo.isConnected) {
      try {
 
        final remotePosts = await remoteDataSource.getDataStudentToParentAssignments(idStudent);
        // localDataSource.cachedStudentDataToParent(remotePosts);
               
        //hare store the data to cash
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedStudentDataToParent();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }



 @override
  Future<Either<Failure, List<PermissionRequesModel>>> getDataStudentToParentPermission(int idStuden) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getDataStudentToParentPermission(idStuden);
        // localDataSource.cachedStudentData(remotePosts);
        //hare store the data to cash
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedStudentDataToParentPermission();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }



  @override
  Future<Either<Failure, Unit>> addPermissionToStudent(PermissionRequesModel permissionReques) async {
  // final PermissionRequesModel studentPermission = PermissionRequesModel(
  //   date: permissionReques.date,
  //   message: permissionReques.message,
  //   reason: permissionReques.reason,
  //   status: permissionReques.status,
  // );
  print("OKkkkkkkkkkkkkkkkay");

    return await _getMessage(() {
      return remoteDataSource.addPermissionToStudent(permissionReques);
    });
  }
  Future<Either<Failure, Unit>> _getMessage(PermissionData permissionData) async {
    if (await networkInfo.isConnected) {
      try {
        await permissionData();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }



}
