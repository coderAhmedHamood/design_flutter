// import 'package:dartz/dartz.dart';
// import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';

// import '../../../../base/error/exceptions.dart';
// import '../../../../base/error/failures.dart';
// import '../../../../base/network/network_info.dart';
// import '../../domain/repositories/parents_repository.dart';
// import '../datasources/parent_local_data_source.dart';
// import '../datasources/parent_remote_data_source.dart';


// typedef Future<Unit> StudentData();

// class StudentsRepositoryImpl implements ParentsRepository {
//   final ParentRemoteDataSource remoteDataSource;
//   final ParentLocalDataSource localDataSource;

//   final NetworkInfo networkInfo;

//   StudentsRepositoryImpl(
//       {required this.remoteDataSource,
//       required this.localDataSource,
//       required this.networkInfo});
//   // @override
//   // Future<Either<Failure, List<Student>>> getAllStudents() async {
//   //   if (await networkInfo.isConnected) {
//   //     try {

//   //       final remoteStudents = await remoteDataSource.getAllStudents();
//   //       localDataSource.cacheStudents(remoteStudents);
//   //       //hare store the data to cash
//   //       return Right(remoteStudents);

//   //     } on ServerException {

//   //       return Left(ServerFailure());
//   //     }
//   //   } else {
//   //     try {

//   //       final localStudents = await localDataSource.getCachedStudents();
//   //       return Right(localStudents);
//   //     } on EmptyCacheException {

//   //       return Left(EmptyCacheFailure());
//   //     }
//   //   }
//   // }

//   @override
//   Future<Either<Failure, List<StudentsClassClass>>> getStudentClass() async {
//     if (await networkInfo.isConnected) {
//       try {
//         final remotePosts = await remoteDataSource.getStudentClass();
//         localDataSource.cachedStudentClass(remotePosts);
//         //hare store the data to cash
//         return Right(remotePosts);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       try {
//         final localPosts = await localDataSource.getCachedStudentClass();
//         return Right(localPosts);
//       } on EmptyCacheException {
//         return Left(EmptyCacheFailure());
//       }
//     }
//   }

//   @override
//   Future<Either<Failure, StudentAttendanceClass>> getDataStudentToParent(
//       int idClass) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final remotePosts = await remoteDataSource.getDataStudentToParentRemote(idClass);
//         localDataSource.cachedStudentData(remotePosts);
//         //hare store the data to cash
//         return Right(remotePosts);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       try {
//         final localPosts = await localDataSource.getCachedStudentData();
//         return Right(localPosts);
//       } on EmptyCacheException {
//         return Left(EmptyCacheFailure());
//       }
//     }
//   }

//   @override
//   Future<Either<Failure, Unit>> addStudentBehavior(List<StudentActivityClass> studentBehaviorList) async {
//   final List<StudentActivityModel> studentBehavior = studentBehaviorList.map((student) {
//       return StudentActivityModel(
//         id: student.id,
//         name: student.name,
//         isPresent: student.isPresent,
//         isSick: student.isSick,
//         degreeHomeWork: student.degreeHomeWork,
//         degreeMonthTest: student.degreeMonthTest,
      
//       );
//     }).toList();

//     return await _getMessage(() {
//       return remoteDataSource.addStudentBehavior(studentBehavior);
//     });
//   }

//   @override
//   Future<Either<Failure, Unit>> addStudentAttendance(
//       List<StudentActivityClass>  studentActivityList) async {
//        final List<StudentActivityModel> studentAttendance = studentActivityList.map((student) {
//       return StudentActivityModel(
//         id: student.id,
//         name: student.name,
//         isPresent: student.isPresent,
//         isSick: student.isSick,
//         degreeHomeWork: student.degreeHomeWork,
//         degreeMonthTest: student.degreeMonthTest,
      
//       );
//     }).toList();

//     return await _getMessage(() {
//       return remoteDataSource.addStudentAttendance(studentAttendance);
//     });
//   }

//   @override
//   Future<Either<Failure, Unit>> addStudentAssignment(
//       List<StudentActivityClass> studentsDataList) async {
//     final List<StudentActivityModel> studentModels = studentsDataList.map((student) {
//       return StudentActivityModel(
//         id: student.id,
//         name: student.name,
//         isPresent: student.isPresent,
//         isSick: student.isSick,
//         degreeHomeWork: student.degreeHomeWork,
//         degreeMonthTest: student.degreeMonthTest,
        
//       );
//     }).toList();

//     return await _getMessage(() {
//       return remoteDataSource.addStudentAssignment(studentModels);
//     });
//   }

//   @override
//   Future<Either<Failure, Unit>> addStudentMonthTestDigree(
//       List<StudentActivityClass> studentList) async {
    
//       final List<StudentActivityModel> studentModels = studentList.map((student) {
//       return StudentActivityModel(
//         id: student.id,
//         name: student.name,
//         isPresent: student.isPresent,
//         isSick: student.isSick,
//         degreeHomeWork: student.degreeHomeWork,
//         degreeMonthTest: student.degreeMonthTest,
//       );
//     }).toList();
//         return await _getMessage(() {
//       return remoteDataSource.addStudentMonthlyTest(studentModels);
//     });
//   }

//   Future<Either<Failure, Unit>> _getMessage(StudentData studentData) async {
//     if (await networkInfo.isConnected) {
//       try {
//         await studentData();
//         return Right(unit);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       return Left(OfflineFailure());
//     }
//   }
// }
