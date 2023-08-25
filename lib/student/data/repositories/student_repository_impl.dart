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
  Future<Either<Failure, Unit>> addStudentAttendance(Student student) async {
    final StudentModel studentModel = StudentModel(
        username: student.username,
        time: student.time,
        studentText: student.studentText,
        studentImage: student.studentImage,
        likes: student.likes,
        islikes: student.islikes);

    return await _getMessage(() {
      return remoteDataSource.addStudentAttendance(studentModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> addStudentAssignment(Student student) async {
    final StudentModel studentModel = StudentModel(
        username: student.username,
        time: student.time,
        studentText: student.studentText,
        studentImage: student.studentImage,
        likes: student.likes,
        islikes: student.islikes);

    return await _getMessage(() {
      return remoteDataSource.addStudentAssignment(studentModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> addStudentMonthTestDigree(
      Student student) async {
    final StudentModel studentModel = StudentModel(
        username: student.username,
        time: student.time,
        studentText: student.studentText,
        studentImage: student.studentImage,
        likes: student.likes,
        islikes: student.islikes);

    return await _getMessage(() {
      return remoteDataSource.addStudentMonthlyExam(studentModel);
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
