
 
 import 'package:dartz/dartz.dart';
import 'package:flutter_design/parent/data/models/parent_model.dart';
import 'package:flutter_design/parent/data/models/permission_model.dart';

import '../../../../base/error/exceptions.dart';
import '../../domain/entities/student_attendance_day.dart';
import '../../domain/entities/student_attendance_week.dart';

import 'package:http/http.dart' as http;

abstract class ParentRemoteDataSource {
  Future<StudentAttendanceModel> getStudentDataToParent(int idStuden);
  Future<StudentAttendanceModel> getDataStudentToParentAssignments(int idStuden);
  Future<StudentAttendanceModel> getStudentDataToParentMonthlyTest(int idStuden);
  Future<List<PermissionRequesModel>> getDataStudentToParentPermission(int idStuden);
  Future<Unit> addPermissionToStudent(PermissionRequesModel permissionRequesModel);
  
}
 
 final List<PermissionRequesModel> permissionrequesModel = [
  PermissionRequesModel(
    reason: 'عنوان الإشعار الأول',
    message:
        'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
    date: '13 أغسطس 2023',
    status: false,
  ),
  PermissionRequesModel(
    reason: 'عنوان الإشعار الثاني',
    message:
        'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
    date: '12 أغسطس 2023',
    status: true,
  ),
];


    final List<String> column = [
  'الشهر',
  'القرآن',
  'التربية الاسلامية',
  ' لغتي العربية',
  'الرياضيات',
  'العلوم',
 
];

final List<StudentAttendanceWeek> studentAttendanceWeekMonthlyTest = [

  StudentAttendanceWeek(
    date: 'الترم الاول',
    studentAttendance: [
      StudentAttendanceDay(
          day: '2024/4/1', subjects: ['29', '12', '22', '19', '30']),
      StudentAttendanceDay(
          day: '2024/5/5', subjects: ['29', '11', '22', '19', '20']),
      
    ],
  ),
  StudentAttendanceWeek(
    date: 'الترم الثاني',
    studentAttendance: [
      StudentAttendanceDay(
          day: '2024/9/8', subjects: ['29', '28', '22', '19', '30']),
    ],
  ),
];


final List<StudentAttendanceWeek> studentAttendanceWeekAssignments = [

  StudentAttendanceWeek(
        date: '2024/7/26',

    studentAttendance: [
      StudentAttendanceDay(
          day: 'السبت', subjects: ['ناقص', 'مسلم', 'مسلم', 'مسلم', 'مسلم']),
      StudentAttendanceDay(
          day: 'الاحد', subjects: ['ناقص', 'مسلم', 'ناقص', 'مسلم', 'مسلم']),
      
    ],
  ),
  StudentAttendanceWeek(
    date: '2024/7/26',

    studentAttendance: [
      StudentAttendanceDay(
day: 'الاثنين', subjects: ['غير مسلم', 'مسلم', 'ناقص', 'مسلم', 'غير مسلم']),    ],
  ),
];

final List<StudentAttendanceWeek> studentAttendanceWeek = [
  StudentAttendanceWeek(
    date: '2024/7/26',
    studentAttendance: [
      StudentAttendanceDay(
          day: 'السبت', subjects: ['حاضر', 'حاضر', 'حاضر', 'غائب', 'حاضر']),
      StudentAttendanceDay(
          day: 'الأحد', subjects: ['حاضر', 'مستأذن', 'حاضر', 'حاضر', 'حاضر']),
      StudentAttendanceDay(
          day: 'الاثنين',
          subjects: ['حاضر', 'حاضر', 'مستأذن', 'حاضر', 'مستأذن']),
      StudentAttendanceDay(
          day: 'الثلاثاء', subjects: ['حاضر', 'حاضر', 'حاضر', 'حاضر', 'غائب']),
      StudentAttendanceDay(
          day: 'الأربعاء', subjects: ['حاضر', 'غائب', 'حاضر', 'حاضر', 'حاضر']),
    ],
  ),
  StudentAttendanceWeek(
    date: '2024/8/3',
    studentAttendance: [
      StudentAttendanceDay(
          day: 'السبت', subjects: ['حاضر', 'حاضر', 'حاضر', 'غائب', 'حاضر']),
      StudentAttendanceDay(
          day: 'الأحد', subjects: ['حاضر', 'مستأذن', 'حاضر', 'حاضر', 'حاضر']),
      StudentAttendanceDay(
          day: 'الاثنين',
          subjects: ['حاضر', 'حاضر', 'مستأذن', 'حاضر', 'مستأذن']),
      StudentAttendanceDay(
          day: 'الثلاثاء', subjects: ['حاضر', 'حاضر', 'حاضر', 'حاضر', 'غائب']),
      StudentAttendanceDay(
          day: 'الأربعاء', subjects: ['حاضر', 'غائب', 'حاضر', 'حاضر', 'حاضر']),
    ],
  ),
];
          
          
StudentAttendanceModel attendanceColumn = StudentAttendanceModel(
  column: column,
  studentAttendanceClass: studentAttendanceWeek,
);
StudentAttendanceModel attendanceColumnMonthlyTest = StudentAttendanceModel(
  column: column,
  studentAttendanceClass: studentAttendanceWeekMonthlyTest,
);
StudentAttendanceModel attendanceColumnAssignments = StudentAttendanceModel(
  column: column,
  studentAttendanceClass: studentAttendanceWeekAssignments,
);

class ParentRemoteDataSourceImpl implements ParentRemoteDataSource {
  final http.Client client;

  ParentRemoteDataSourceImpl({required this.client});

 
  
  @override
  Future<StudentAttendanceModel> getStudentDataToParent(int idStudent) async {
  

    if (200 == 200) {
 
      return attendanceColumn;
    } else {
  
      throw ServerException();
    }
  }


  @override
  Future<StudentAttendanceModel> getStudentDataToParentMonthlyTest(int idStudent) async {
    if (200 == 200) {
 
      return attendanceColumnMonthlyTest;
    } else {
  
      throw ServerException();
    }
  }

  @override
  Future<StudentAttendanceModel> getDataStudentToParentAssignments(int idStudent) async {
    if (200 == 200) {
 
      return attendanceColumnAssignments;
    } else {
  
      throw ServerException();
    }
  }
  
  @override
  Future<List<PermissionRequesModel>> getDataStudentToParentPermission(int idStudent) async {
    if (200 == 200) {
 
List<PermissionRequesModel> permissionRequesModel= permissionrequesModel.toList();
      return permissionRequesModel;
    } else {
  
      throw ServerException();
    }
  }
  
  
  @override
  Future<Unit> addPermissionToStudent(PermissionRequesModel permissionRequesModel) async {
    if (200 == 200) {
    return Future.value(unit);
  } else {
    throw ServerException();
  }


  
  }
  

}
