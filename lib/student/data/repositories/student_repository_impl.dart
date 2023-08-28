import 'package:dartz/dartz.dart';

import '../../../../base/error/exceptions.dart';
import '../../../../base/error/failures.dart';
import '../../../../base/network/network_info.dart';

import '../../domain/entities/student.dart';
import '../../domain/repositories/students_repository.dart';
import '../datasources/student_local_data_source.dart';
import '../datasources/student_remote_data_source.dart';
import '../models/student_model.dart';

typedef Future<Unit> StudentData();

class StudentsRepositoryImpl implements StudentsRepository {
  final StudentRemoteDataSource remoteDataSource;
  final StudentLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  StudentsRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  // @override
  // Future<Either<Failure, List<Student>>> getAllStudents() async {
  //   if (await networkInfo.isConnected) {
  //     try {

  //       final remoteStudents = await remoteDataSource.getAllStudents();
  //       localDataSource.cacheStudents(remoteStudents);
  //       //hare store the data to cash
  //       return Right(remoteStudents);

  //     } on ServerException {

  //       return Left(ServerFailure());
  //     }
  //   } else {
  //     try {

  //       final localStudents = await localDataSource.getCachedStudents();
  //       return Right(localStudents);
  //     } on EmptyCacheException {

  //       return Left(EmptyCacheFailure());
  //     }
  //   }
  // }

  @override
  Future<Either<Failure, List<StudentsClassClass>>> getStudentClass() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getStudentClass();
        localDataSource.cachedStudentClass(remotePosts);
        //hare store the data to cash
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedStudentClass();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<StudentActivityModel>>> getStudentData(
      int idClass) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getStudentData(idClass);
        localDataSource.cachedStudentData(remotePosts);
        //hare store the data to cash
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedStudentData();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addStudentBehavior(Student student) async {
    final StudentModel studentModel = StudentModel(
        username: student.username,
        time: student.time,
        studentText: student.studentText,
        studentImage: student.studentImage,
        likes: student.likes,
        islikes: student.islikes);

    return await _getMessage(() {
      return remoteDataSource.addStudentBehavior(studentModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> addStudentAttendance(
      List<StudentActivityClass>  studentActivityList) async {
       final List<StudentActivityModel> studentAttendance = studentActivityList.map((student) {
      return StudentActivityModel(
        id: student.id,
        name: student.name,
        isPresent: student.isPresent,
        isSick: student.isSick,
        degreeHomeWork: student.degreeHomeWork,
        degreeMonthTest: student.degreeMonthTest,
      
      );
    }).toList();

    return await _getMessage(() {
      return remoteDataSource.addStudentAttendance(studentAttendance);
    });
  }

  @override
  Future<Either<Failure, Unit>> addStudentAssignment(
      List<StudentActivityClass> studentsDataList) async {
    final List<StudentActivityModel> studentModels = studentsDataList.map((student) {
      return StudentActivityModel(
        id: student.id,
        name: student.name,
        isPresent: student.isPresent,
        isSick: student.isSick,
        degreeHomeWork: student.degreeHomeWork,
        degreeMonthTest: student.degreeMonthTest,
        
      );
    }).toList();

    return await _getMessage(() {
      return remoteDataSource.addStudentAssignment(studentModels);
    });
  }

  @override
  Future<Either<Failure, Unit>> addStudentMonthTestDigree(
      List<StudentActivityClass> studentList) async {
    
      final List<StudentActivityModel> studentModels = studentList.map((student) {
      return StudentActivityModel(
        id: student.id,
        name: student.name,
        isPresent: student.isPresent,
        isSick: student.isSick,
        degreeHomeWork: student.degreeHomeWork,
        degreeMonthTest: student.degreeMonthTest,
      );
    }).toList();
        return await _getMessage(() {
      return remoteDataSource.addStudentMonthlyTest(studentModels);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(StudentData studentData) async {
    if (await networkInfo.isConnected) {
      try {
        await studentData();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
