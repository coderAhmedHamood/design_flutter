import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_design/parent/data/models/parent_model.dart';
import 'package:flutter_design/parent/data/models/permission_model.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/error/exceptions.dart';

abstract class ParentLocalDataSource {
  Future<Unit> cachedStudentDataToParent(
      StudentDataTableModel studentDataTableModel);
  Future<StudentDataTableClass> getCachedStudentDataToParent();
  Future<List<PermissionRequesModel>> getCachedStudentDataToParentPermission();
  
}

const CACHED_STUDENTS_PERMISSION = "CACHED_STUDENTS_PERMISSION";
const CACHED_DATA_STUDENTS_TO_PARENT_ONE = "CACHED_DATA_STUDENTS_TO_PARENT_COLUMN";


class ParentLocalDataSourceImpl implements ParentLocalDataSource {
  final SharedPreferences sharedPreferences;

  ParentLocalDataSourceImpl({required this.sharedPreferences});
 

  @override
  Future<Unit> cachedStudentDataToParent(
      StudentDataTableModel studentDataTableModel) {


          List<Map<String, dynamic>> studentModelsToJson = [studentDataTableModel.toJson()];
          print(studentModelsToJson);
    
  sharedPreferences.setString(
    CACHED_DATA_STUDENTS_TO_PARENT_ONE,
    json.encode(studentModelsToJson),
  );
    
    // final jsonColumn = json.encode(StudentDataTableModel.column);
    // print(jsonColumn);
    print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    // final jsonStudentDataTableClass = json.encode(StudentDataTableModel.StudentDataTableClass);
    // print(jsonStudentDataTableClass);
    // print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    // sharedPreferences.setString(CACHED_DATA_STUDENTS_TO_PARENT_ONE, jsonColumn);
    // sharedPreferences.setString(CACHED_DATA_STUDENTS_TO_PARENT_TOW, jsonStudentDataTableClass);
    // print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    return Future.value(unit);
  }

  @override
  Future<StudentDataTableModel> getCachedStudentDataToParent() {
    final jsonString = sharedPreferences.getString(CACHED_DATA_STUDENTS_TO_PARENT_ONE);
    if (jsonString != null) {
      print(";;;;;;;;;;;;;;;;ttttttttttttttt;;;;;;;;;;;;;;;");
    print(jsonString);
    print(";;;;;;;;;;;;;;;;;;مممممممممممممممم;;;;;;;;;;;;;;");
 final jsonData = json.decode(jsonString);
 print(jsonData['column']);
 print(jsonData['StudentDataTableClass']);
        final jsonDataStudentToParent = StudentDataTableModel.fromJson(jsonData);

      
    print(jsonDataStudentToParent);
    print(";;;##################مممم;;;;;;;;;;;;;;");
      return Future.value(jsonDataStudentToParent);
    } else {
      throw EmptyCacheException();
    }
  }




  @override
  Future<Unit> cachedStudentDataToParentPermission(List<PermissionRequesModel> studentClassModel) {
    List studentModelsToJson = studentClassModel
        .map<Map<String, dynamic>>((studentClassModel) => studentClassModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_STUDENTS_PERMISSION, json.encode(studentModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PermissionRequesModel>> getCachedStudentDataToParentPermission() {
 
    final jsonString = sharedPreferences.getString(CACHED_STUDENTS_PERMISSION);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PermissionRequesModel> jsonToStudentModels = decodeJsonData
          .map<PermissionRequesModel>((jsonStudentModel) => PermissionRequesModel.fromJson(jsonStudentModel))
          .toList();
      return Future.value(jsonToStudentModels);
    } else {
      throw EmptyCacheException();
    }
  }
  
 
}
