import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/error/exceptions.dart';
import '../models/student_model.dart';

abstract class StudentLocalDataSource {
  Future<List<StudentModel>> getCachedStudents();
  Future<Unit> cacheStudents(List<StudentModel> studentModels);
}

const CACHED_STUDENTS = "CACHED_STUDENTS";

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
}
