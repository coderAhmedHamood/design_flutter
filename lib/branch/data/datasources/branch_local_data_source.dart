import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/error/exceptions.dart';
import '../models/branch_model.dart';

abstract class BranchLocalDataSource {
  Future<List<BranchModel>> getCachedBranchs();
  Future<Unit> cacheBranchs(List<BranchModel> branchModels);
}

const CACHED_BRANCHS = "CACHED_BRANCH";

class BranchLocalDataSourceImpl implements BranchLocalDataSource {
  final SharedPreferences sharedPreferences;

  BranchLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheBranchs(List<BranchModel> branchModels) {
    print("datasources branch");
    
    List branchModelsToJson = branchModels
        .map<Map<String, dynamic>>((branchModel) => branchModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_BRANCHS, json.encode(branchModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<BranchModel>> getCachedBranchs() {
    print("datasources  branch");
    
    final jsonString = sharedPreferences.getString(CACHED_BRANCHS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<BranchModel> jsonToBranchModels = decodeJsonData
          .map<BranchModel>((jsonBranchModel) => BranchModel.fromJson(jsonBranchModel))
          .toList();
      return Future.value(jsonToBranchModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
