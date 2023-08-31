import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_design/parent/data/models/parent_model.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/error/exceptions.dart';

abstract class ParentLocalDataSource {
  // Future<StudentAttendanceClass> getCachedStudentDataToParent();
  Future<Unit> cachedStudentDataToParent(
      StudentAttendanceModel studentAttendanceModel);
  Future<StudentAttendanceClass> getCachedStudentDataToParent();
  // Future<Unit> cachedStudentClass(List<StudentClassModel> studentClassModel);
  // Future<List<StudentActivityModel>> getCachedStudentData();
  // Future<Unit> cachedStudentData(List<StudentActivityModel> studentDataModel);
}

const CACHED_STUDENTS = "CACHED_STUDENTS";
const CACHED_STUDENTS_CLASS = "CACHED_STUDENTS_CLASS";
const CACHED_DATA_STUDENTS_TO_PARENT_ONE = "CACHED_DATA_STUDENTS_TO_PARENT_COLUMN";
const CACHED_DATA_STUDENTS_TO_PARENT_TOW = "CACHED_DATA_STUDENTS_TO_PARENT_jsonstudentAttendanceClass";

class ParentLocalDataSourceImpl implements ParentLocalDataSource {
  final SharedPreferences sharedPreferences;

  ParentLocalDataSourceImpl({required this.sharedPreferences});
  // @override
  // Future<Unit> cacheStudents(List<StudentModel> studentModels) {
  //   List studentModelsToJson = studentModels
  //       .map<Map<String, dynamic>>((studentModel) => studentModel.toJson())
  //       .toList();
  //   sharedPreferences.setString(CACHED_STUDENTS, json.encode(studentModelsToJson));
  //   return Future.value(unit);
  // }

  // @override
  // Future<List<StudentModel>> getCachedStudents() {

  //   final jsonString = sharedPreferences.getString(CACHED_STUDENTS);
  //   if (jsonString != null) {
  //     List decodeJsonData = json.decode(jsonString);
  //     List<StudentModel> jsonToStudentModels = decodeJsonData
  //         .map<StudentModel>((jsonStudentModel) => StudentModel.fromJson(jsonStudentModel))
  //         .toList();
  //     return Future.value(jsonToStudentModels);
  //   } else {
  //     throw EmptyCacheException();
  //   }
  // }

  // @override
  // Future<Unit> cachedStudentClass(List<StudentClassModel> studentClassModel) {
  //   List studentModelsToJson = studentClassModel
  //       .map<Map<String, dynamic>>((studentClassModel) => studentClassModel.toJson())
  //       .toList();
  //   sharedPreferences.setString(CACHED_STUDENTS_CLASS, json.encode(studentModelsToJson));
  //   return Future.value(unit);
  // }

  @override
  Future<Unit> cachedStudentDataToParent(
      StudentAttendanceModel studentAttendanceModel) {


          List<Map<String, dynamic>> studentModelsToJson = [studentAttendanceModel.toJson()];
          print(studentModelsToJson);
    print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
  sharedPreferences.setString(
    CACHED_DATA_STUDENTS_TO_PARENT_ONE,
    json.encode(studentModelsToJson),
  );
    print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiii");

    // final jsonColumn = json.encode(studentAttendanceModel.column);
    // print(jsonColumn);
    print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    // final jsonstudentAttendanceClass = json.encode(studentAttendanceModel.studentAttendanceClass);
    // print(jsonstudentAttendanceClass);
    // print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    // sharedPreferences.setString(CACHED_DATA_STUDENTS_TO_PARENT_ONE, jsonColumn);
    // sharedPreferences.setString(CACHED_DATA_STUDENTS_TO_PARENT_TOW, jsonstudentAttendanceClass);
    // print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    return Future.value(unit);
  }

  @override
  Future<StudentAttendanceModel> getCachedStudentDataToParent() {
    final jsonString = sharedPreferences.getString(CACHED_DATA_STUDENTS_TO_PARENT_ONE);
    if (jsonString != null) {
      print(";;;;;;;;;;;;;;;;ttttttttttttttt;;;;;;;;;;;;;;;");
    print(jsonString);
    print(";;;;;;;;;;;;;;;;;;مممممممممممممممم;;;;;;;;;;;;;;");
 final jsonData = json.decode(jsonString);
 print(jsonData['column']);
 print(jsonData['studentAttendanceClass']);
        final jsonDataStudentToParent = StudentAttendanceModel.fromJson(jsonData);

      
    print(jsonDataStudentToParent);
    print(";;;##################مممم;;;;;;;;;;;;;;");
      return Future.value(jsonDataStudentToParent);
    } else {
      throw EmptyCacheException();
    }
  }

  // @override
  // Future<StudentAttendanceClass> getCachedStudentData() {

  //   final jsonString = sharedPreferences.getString(CACHED_STUDENTS_DATA);
  //   if (jsonString != null) {
  //     List decodeJsonData = json.decode(jsonString);
  //     List<StudentActivityModel> jsonToStudentModels = decodeJsonData
  //         .map<StudentActivityModel>((jsonStudentModel) => StudentActivityModel.fromJson(jsonStudentModel))
  //         .toList();
  //     return Future.value(jsonToStudentModels);
  //   } else {
  //     throw EmptyCacheException();
  //   }
  // }
}
