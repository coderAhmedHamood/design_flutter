
 
 import 'package:flutter_design/parent/data/models/parent_model.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';
import '../../../../base/error/exceptions.dart';
 import '../../domain/entities/student_attendance_day.dart';
import '../../domain/entities/student_attendance_week.dart';

import 'package:http/http.dart' as http;

abstract class ParentRemoteDataSource {
  // Future<List<StudentClassModel>> getStudentClass();
  Future<StudentAttendanceModel> getStudentDataToParent(int idStuden);
  Future<StudentAttendanceModel> getStudentDataToParentMonthlyTest(int idStuden);
  // Future<Unit> addStudentAttendance(List<StudentActivityClass>  studentActivityList);
  // Future<Unit> addStudentAssignment(List<StudentActivityModel> studentActivityList);
  // Future<Unit> addStudentBehavior(List<StudentActivityModel> studentActivityList);
  
  // Future<Unit> addStudentMonthlyTest(List<StudentActivityModel> studentActivityList);
}
 

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
          day: '2024/4/1', subjects: ['29', '28', '22', '19', '30']),
      // StudentAttendanceDay(
      //     day: '2024/5/5', subjects: ['29', '18', '22', '19', '20']),
      // StudentAttendanceDay(
      //     day: '2024/6/2',
      //      subjects: ['29', '28', '30', '29', '30']),
      // StudentAttendanceDay(
      //     day: '2024/7/3',  subjects: ['30', '28', '22', '30', '13']),
      
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
  

}
