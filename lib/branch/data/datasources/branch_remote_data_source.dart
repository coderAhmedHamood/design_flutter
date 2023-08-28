 

import '../../../../base/error/exceptions.dart';
import '../../../base/urls.dart';
import '../models/branch_model.dart';
 import 'package:http/http.dart' as http;

abstract class BranchRemoteDataSource {
  Future<List<BranchModel>> getAllBranch();
}
  final List<BranchModel> branch = [
  BranchModel(
      title: 'الفرع الرئيسي',
      location: 'تعز شارع التحرير',
      likes: 10,
      isLikes:true,
      imageUrl: 'assets/school/school3.jpg',
       
      
    ),
 BranchModel(
      title: 'فرع الاربعين',
      location: 'تعز بير باشا',
      likes: 20,
      isLikes:true,
       imageUrl: 'assets/school/school2.jpg',
    ),
  BranchModel(
      title: 'فرع ذمار ',
      location: 'جوار محطة الجرموزي ',
      likes: 20,
      isLikes:false,
       imageUrl: 'assets/school/school3.jpg',
    ),
 BranchModel(
      title: 'فرع البنين ',
      location: 'ذمار جولة كمران',
      likes: 20,
      isLikes:true,
       imageUrl: 'assets/school/school1.jpg',
    ),
    // Add more posts as needed
  ];

const BASE_URL = "";

class BranchRemoteDataSourceImpl implements BranchRemoteDataSource {
  final http.Client client;

  BranchRemoteDataSourceImpl({required this.client});
  @override
  Future<List<BranchModel>> getAllBranch() async {
    print("getAllBranch");
    
    // final response = await client.get(
    //   Uri.parse(URLs.URL_GetPosts),
    //   // headers: {"Content-Type": "application/json"},
    // );

    if (200 == 200) {
    // if (response.statusCode == 200) {
      //   final body = json.decode(response.body);
      // final error = body['error'];
      //  final List decodedJson = body['city'] as List;
      //  print(body['city']);
      //  print(error.toString());

      // final List<BranchModel> branchModels = branch
          // .map<BranchModel>((jsonBranchModel) => BranchModel.fromJson(jsonBranchModel))
          // .toList();
          final List<BranchModel> branchModels = branch.toList();

      return branchModels;
    } else {
      throw ServerException();
    }
  }
}
