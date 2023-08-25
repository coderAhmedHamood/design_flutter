
import 'package:flutter_design/base/urls.dart';
import '../../../../base/error/exceptions.dart';
import '../models/student_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class StudentRemoteDataSource {
  Future<Unit> addStudentAssignment(StudentModel studentModel);
  Future<Unit> addStudentAttendance(StudentModel studentModel);
  Future<Unit> addStudentBehavior(StudentModel studentModel);
  Future<Unit> addStudentMonthlyExam(StudentModel studentModel);
}
   List<StudentModel> students = [
  StudentModel(
    id: 1,
    username: 'اسم المستخدم 1',
    time: '2024/3/5',
    studentText:
        ' تعبكم راحه , يكفي ثقتكم في مجموعهمدارس العربية السعيدة الاهلية   رحله كل 10 ايام للفنكوش..',
    studentImage: "",
    // studentImage: 'assets/student_image1.png',
    likes: 30,
    islikes: true,
  ),
  StudentModel(
    id: 2,
    username: 'ابو العرب',
    time: '2024/3/4',
    studentText:
        'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    studentImage: '',
    likes: 15,
    islikes: false,
  ),
    
  StudentModel(
    id: 3,
    username: 'ابو العرب',
    time: '2024/3/4',
    studentText:
        'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    studentImage: "assets/school/ahmed.jpg",
    likes: 15,
    islikes: true,
  ),
  StudentModel(
    id: 4,
    username: 'اسم المستخدم 2',
    time: '2024/3/4',
    studentText:
        'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    studentImage: 'assets/school/school2.jpg',
    likes: 15,
    islikes: false,
  ),
  StudentModel(
    id: 5,
    username: 'اسم المستخدم 2',
    time: '2024/3/4',
    studentText:
        'بسم الله ماشاء الله تبارك الرحمن الانتهاء من تفتيش ثالث برادات  #مجموعة_شركات_الماظة_للشحن_الدولي 16/8/2023 الان من امام ميناء سفاجا والتوجه الي المخازن في جمهورية مصر العربية للتواصل والاستفسارات 00971582040166 00971582040155 00971582616061 00971504113132 للتواصل والاستفسارات مكتب مصر 002011111004449',
    studentImage: 'assets/school/school1.jpg',
    likes: 15,
    islikes: false,
  ),
//    
];




class StudentRemoteDataSourceImpl implements StudentRemoteDataSource {
  final http.Client client;

  StudentRemoteDataSourceImpl({required this.client});

 

  @override
  Future<Unit> addStudentAssignment(StudentModel studentModel) async {
     final body = {
      "city_name": studentModel.username,
          // "username": studentModel.username,
        // "time": studentModel.time,
        // "studentText": studentModel.studentText,
        // "studentImage": studentModel.studentImage,
        // "likes": studentModel.likes,
        // "islikes": studentModel.islikes,
    };

    final response =
        await client.post(Uri.parse(URLs.URL_GetBranches), body: body);

    // if (response.statusCode == 201) {
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }


@override
Future<Unit> addStudentAttendance(StudentModel studentModel) async {
 
  final response = await http.post(
    
      Uri.parse(URLs.URL_GetPosts),
      body: {
        // 'id': studentId.toString(),
      },
    );


  if (response.statusCode == 200) {
    return Future.value(unit);
  } else {
    throw ServerException();
  }
}


  @override
  Future<Unit> addStudentBehavior(StudentModel studentModel) async {
     final studentId = studentModel.id.toString();
    final body = {
      "name": studentModel.username,
        // "username": studentModel.username,
        // "time": studentModel.time,
        // "studentText": studentModel.studentText,
        // "studentImage": studentModel.studentImage,
        // "likes": studentModel.likes,
        // "islikes": studentModel.islikes,
    };

    final response = await client.patch(
      Uri.parse(URLs.URL_REGISTER),
      body: body,
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addStudentMonthlyExam(StudentModel studentModel) async {
     final studentId = studentModel.id.toString();
    final body = {
      "name": studentModel.username,
    };

    final response = await client.patch(
      Uri.parse(URLs.URL_REGISTER),
      body: body,
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }


}
