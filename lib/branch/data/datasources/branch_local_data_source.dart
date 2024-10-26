import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/error/exceptions.dart';
import '../models/branch_model.dart';
import '../models/data_student.dart';

abstract class BranchLocalDataSource {
  Future<List<BranchModel>> getCachedBranchs();
  Future<Unit> cacheBranchs(List<BranchModel> branchModels);
  Future<List<DataStudentModel>> getCachedDataStudent();
  Future<Unit> cachedDataStudent(List<DataStudentModel> dataStudentModel);
}

const CACHED_BRANCHS = "CACHED_BRANCHES";
const CACHED_DATA_STUDENT = "CACHED_DATA_STUDENT";

class BranchLocalDataSourceImpl implements BranchLocalDataSource {
  final SharedPreferences sharedPreferences;

  BranchLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheBranchs(List<BranchModel> branchModels) {

    List branchModelsToJson = branchModels
        .map<Map<String, dynamic>>((branchModel) => branchModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_BRANCHS, json.encode(branchModelsToJson));
      final encodedBranchModels = sharedPreferences.getString(CACHED_BRANCHS);
    return Future.value(unit);
  }

  @override
  Future<List<BranchModel>> getCachedBranchs() {
    
    final jsonString = sharedPreferences.getString(CACHED_BRANCHS);
    if (jsonString != null) {
    
      List<dynamic> decodeJsonData = json.decode(jsonString);
         List<BranchModel> jsonToBranchModels = decodeJsonData
        .map<BranchModel>((jsonBranchModel) => BranchModel.fromJson(jsonBranchModel))
        .toList();
    
      return Future.value(jsonToBranchModels);
    } else {
      throw EmptyCacheException();
    }
  }
  
  
  @override
  Future<Unit> cachedDataStudent(List<DataStudentModel> dataStudentModel) {

    List dataStudentModelsToJson = dataStudentModel
        .map<Map<String, dynamic>>((dataStudent) => dataStudent.toJson())
        .toList();
    sharedPreferences.setString(CACHED_DATA_STUDENT, json.encode(dataStudentModel));


    //   final encodedBranchModels = sharedPreferences.getString(CACHED_DATA_STUDENT);
 

    return Future.value(unit);
  }

  @override
  Future<List<DataStudentModel>> getCachedDataStudent() {
    
    final jsonString = sharedPreferences.getString(CACHED_DATA_STUDENT);
    if (jsonString != null) {
    
      List<dynamic> decodeJsonData = json.decode(jsonString);
    
      // List<BranchModel> jsonToBranchModels = decodeJsonData
      //     .map<BranchModel>((jsonBranchModel) => BranchModel.fromJson(jsonBranchModel))
      //     .toList();
         List<DataStudentModel> jsonDataStudent = decodeJsonData
        .map<DataStudentModel>((jsonBranchModel) => DataStudentModel.fromJson(jsonBranchModel))
        .toList();
    
    
      return Future.value(jsonDataStudent);
    } else {
      throw EmptyCacheException();
    }
  }


}
