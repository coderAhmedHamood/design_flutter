import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/error/exceptions.dart';
import '../models/branch_model.dart';

abstract class BranchLocalDataSource {
  Future<List<BranchModel>> getCachedBranchs();
  Future<Unit> cacheBranchs(List<BranchModel> branchModels);
}

const CACHED_BRANCHS = "CACHED_BRANCHES";

class BranchLocalDataSourceImpl implements BranchLocalDataSource {
  final SharedPreferences sharedPreferences;

  BranchLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheBranchs(List<BranchModel> branchModels) {
    print("===================>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print("datasources branch");
    print("===================>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    
    List branchModelsToJson = branchModels
        .map<Map<String, dynamic>>((branchModel) => branchModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_BRANCHS, json.encode(branchModelsToJson));


      final encodedBranchModels = sharedPreferences.getString(CACHED_BRANCHS);
        print("=================!!!!!!!!!!!!!!!!!!!>>>>>>>>>>>>>>>>>>>>>>");
    print(encodedBranchModels);
    print("=================!!!!!!!!!!!!!!!!!!!>>>>>>>>>>>>>>>>>>>>>>");

    return Future.value(unit);
  }

  @override
  Future<List<BranchModel>> getCachedBranchs() {
    
    final jsonString = sharedPreferences.getString(CACHED_BRANCHS);
    if (jsonString != null) {
    
      List<dynamic> decodeJsonData = json.decode(jsonString);
    print("=============000000000000000======>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(decodeJsonData);
    print("=============000000000000000======>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      // List<BranchModel> jsonToBranchModels = decodeJsonData
      //     .map<BranchModel>((jsonBranchModel) => BranchModel.fromJson(jsonBranchModel))
      //     .toList();
         List<BranchModel> jsonToBranchModels = decodeJsonData
        .map<BranchModel>((jsonBranchModel) => BranchModel.fromJson(jsonBranchModel))
        .toList();
    
    print("===================>>>>>>-------------->>>>>>>>>>>>>>>>>>>>>");
          print(jsonToBranchModels);
    print("===================>>>>>>-------------->>>>>>>>>>>>>>>>>>>>>");
      return Future.value(jsonToBranchModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
