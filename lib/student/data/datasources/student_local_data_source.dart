import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/error/exceptions.dart';
import '../models/student_model.dart';

abstract class StudentLocalDataSource {
  Future<List<StudentModel>> getCachedStudents();
  Future<Unit> cacheStudents(List<StudentModel> studentModels);
  Future<List<StudentClassModel>> getCachedStudentClass();
  Future<Unit> cachedStudentClass(List<StudentClassModel> studentClassModel);
  Future<List<StudentActivityModel>> getCachedStudentData();
  Future<Unit> cachedStudentData(List<StudentActivityModel> studentDataModel);
}

const CACHED_STUDENTS = "CACHED_STUDENTS";
const CACHED_STUDENTS_CLASS = "CACHED_STUDENTS_CLASS";
const CACHED_STUDENTS_DATA = "CACHED_STUDENTS_Data";

class StudentLocalDataSourceImpl implements StudentLocalDataSource {
  final SharedPreferences sharedPreferences;

  StudentLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheStudents(List<StudentModel> studentModels) {
    List studentModelsToJson = studentModels
        .map<Map<String, dynamic>>((studentModel) => studentModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_STUDENTS, json.encode(studentModelsToJson));
    return Future.value(unit);
  }


  @override
  Future<List<StudentModel>> getCachedStudents() {
 
    final jsonString = sharedPreferences.getString(CACHED_STUDENTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<StudentModel> jsonToStudentModels = decodeJsonData
          .map<StudentModel>((jsonStudentModel) => StudentModel.fromJson(jsonStudentModel))
          .toList();
      return Future.value(jsonToStudentModels);
    } else {
      throw EmptyCacheException();
    }
  }



  @override
  Future<Unit> cachedStudentClass(List<StudentClassModel> studentClassModel) {
    List studentModelsToJson = studentClassModel
        .map<Map<String, dynamic>>((studentClassModel) => studentClassModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_STUDENTS_CLASS, json.encode(studentModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<StudentClassModel>> getCachedStudentClass() {
 
    final jsonString = sharedPreferences.getString(CACHED_STUDENTS_CLASS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<StudentClassModel> jsonToStudentModels = decodeJsonData
          .map<StudentClassModel>((jsonStudentModel) => StudentClassModel.fromJson(jsonStudentModel))
          .toList();
      return Future.value(jsonToStudentModels);
    } else {
      throw EmptyCacheException();
    }
  }
  
  
  
  @override
  Future<Unit> cachedStudentData(List<StudentActivityModel> studentDataModel) {
    List studentModelsToJson = studentDataModel
        .map<Map<String, dynamic>>((studentDataModel) => studentDataModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_STUDENTS_DATA, json.encode(studentModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<StudentActivityModel>> getCachedStudentData() {
 
    final jsonString = sharedPreferences.getString(CACHED_STUDENTS_DATA);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<StudentActivityModel> jsonToStudentModels = decodeJsonData
          .map<StudentActivityModel>((jsonStudentModel) => StudentActivityModel.fromJson(jsonStudentModel))
          .toList();
      return Future.value(jsonToStudentModels);
    } else {
      throw EmptyCacheException();
    }
  }


}
