import '../../../../base/error/exceptions.dart';
import '../models/branch_model.dart';
import 'package:http/http.dart' as http;

import '../models/data_student.dart';

abstract class BranchRemoteDataSource {
  Future<List<BranchModel>> getAllBranch();
  Future<List<DataStudentModel>> getAllDataStudent(int idBranch);
}

final List<BranchModel> branch = [
  BranchModel(
    id: 2,
    title: 'الفرع الرئيسي',
    location: 'تعز بير باشا',
    likes: 10,
    isLikes: true,
    imageUrl: 'assets/school/school3.jpg',
  ),
  BranchModel(
    id: 4,
    title: 'فرع الاربعين',
    location: 'تعز حي الروضة',
    likes: 20,
    isLikes: true,
    imageUrl: 'assets/school/school2.jpg',
  ),
  BranchModel(
    id: 5,
    title: 'فرع ذمار الرئيسي ',
    location: 'جوار محطة الجرموزي ',
    likes: 20,
    isLikes: false,
    imageUrl: 'assets/school/school3.jpg',
  ),
  BranchModel(
    id: 6,
    title: 'فرع البنين ',
    location: 'ذمار جولة كمران',
    likes: 20,
    isLikes: true,
    imageUrl: 'assets/school/school1.jpg',
  ),
  // Add more posts as needed
];
final List<DataStudentModel> dataStudent = [
  DataStudentModel(
    id: 2,
    name: 'محمد عبداللة المنشاوي',
    descrption: 'هاذا الطالب ممتاز جدا جدا ',
    image: 'assets/ahmed.jpg',
    
    className: 'الخامس',
    numberOrder: "الثالث مكرر",
  ),
  DataStudentModel(
    id: 2,
    name: 'نجيب فواز علي',
    descrption: 'هاذا الطالب ممتاز جدا جدا ',
    image: 'assets/school/school3.jpg',
    className: 'الخامس',
    numberOrder: "الاول",
  ),
  DataStudentModel(
    id: 2,
    name: 'احمد عبداللة قائد',
    descrption: 'جيد بما يكفي  لا مدح فا تفوقة يتكلم عن  المديح ',
    image: 'assets/school/school1.jpg',
    className: 'الخامس',
    numberOrder: "الثاني",
  ),
  DataStudentModel(
    id: 2,
    name: 'ذياب زين العابدين',
    descrption: 'ماشاء الله ممتاز ورائع جدا من نجاج الى نجاح ',
    image: 'assets/ahmed.jpg',
    className: 'الخامس',
    numberOrder: "الاول",
  ),
  DataStudentModel(
    id: 2,
    name: 'صفية محمد الحارثي',
    descrption: 'جيد بما يكفي  ماشاء الله  ',
    image: 'assets/school/school1.jpg',
    className: 'الخامس',
    numberOrder: "الاول",
  ),
    DataStudentModel(
    id: 2,
    name: 'محمد عبداللة المنشاوي',
    descrption: 'هاذا الطالب ممتاز جدا جدا ',
    image: 'assets/ahmed.jpg',
    
    className: 'الخامس',
    numberOrder: "الثالث مكرر",
  ),
  DataStudentModel(
    id: 2,
    name: 'نجيب فواز علي',
    descrption: 'هاذا الطالب ممتاز جدا جدا ',
    image: 'assets/school/school3.jpg',
    className: 'الخامس',
    numberOrder: "الاول",
  ),
  // Add more posts as needed
];

class BranchRemoteDataSourceImpl implements BranchRemoteDataSource {
  final http.Client client;

  BranchRemoteDataSourceImpl({required this.client});
  @override
  Future<List<BranchModel>> getAllBranch() async {
 
    // final response = await client.get(
    //   Uri.parse(URLs.URL_GetPosts),
    //   // headers: {"Content-Type": "application/json"},
    // );

    if (200 == 200) {
      // if (response.statusCode == 200) {
      //   final body = json.decode(response.body);
      // final error = body['error'];
      //  final List decodedJson = body['city'] as List;
   

      // final List<BranchModel> branchModels = branch
      // .map<BranchModel>((jsonBranchModel) => BranchModel.fromJson(jsonBranchModel))
      // .toList();
      final List<BranchModel> branchModels = branch.toList();

      return branchModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DataStudentModel>> getAllDataStudent(int idBranch) async {
    

    // final response = await client.get(
    //   Uri.parse(URLs.URL_GetPosts),
    //   // headers: {"Content-Type": "application/json"},
    // );

    if (200 == 200) {
      // if (response.statusCode == 200) {
      //   final body = json.decode(response.body);
      // final error = body['error'];
      //  final List decodedJson = body['city'] as List;
   

      // final List<BranchModel> branchModels = branch
      // .map<BranchModel>((jsonBranchModel) => BranchModel.fromJson(jsonBranchModel))
      // .toList();
      final List<DataStudentModel> branchModels = dataStudent.toList();

      return branchModels;
    } else {
      throw ServerException();
    }
  }
}
