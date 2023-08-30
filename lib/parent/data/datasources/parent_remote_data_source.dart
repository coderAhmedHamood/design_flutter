
// import 'package:flutter_design/base/urls.dart';
// import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';
// import 'package:flutter_design/student/domain/entities/student.dart';
// import '../../../../base/error/exceptions.dart';
// import '../../domain/entities/student_activity_class.dart';
// import '../models/parent_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;

// abstract class ParentRemoteDataSource {
//   Future<List<StudentClassModel>> getStudentClass();
//   Future<List<StudentActivityModel>> getStudentData(int idClass);
//   Future<Unit> addStudentAttendance(List<StudentActivityClass>  studentActivityList);
//   Future<Unit> addStudentAssignment(List<StudentActivityModel> studentActivityList);
//   Future<Unit> addStudentBehavior(List<StudentActivityModel> studentActivityList);
  
//   Future<Unit> addStudentMonthlyTest(List<StudentActivityModel> studentActivityList);
// }
//    List<StudentModel> students = [
//   StudentModel(
//     id: 1,
//     username: 'اسم المستخدم 1',
//     time: '2024/3/5',
//     studentText:
//         ' تعبكم راحه , يكفي ثقتكم في مجموعهمدارس العربية السعيدة الاهلية   رحله كل 10 ايام للفنكوش..',
//     studentImage: "",
//     // studentImage: 'assets/student_image1.png',
//     likes: 30,
//     islikes: true,
//   ),
//   StudentModel(
//     id: 2,
//     username: 'ابو العرب',
//     time: '2024/3/4',
//     studentText:
//         'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
//     studentImage: '',
//     likes: 15,
//     islikes: false,
//   ),
    
//   StudentModel(
//     id: 3,
//     username: 'ابو العرب',
//     time: '2024/3/4',
//     studentText:
//         'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
//     studentImage: "assets/school/ahmed.jpg",
//     likes: 15,
//     islikes: true,
//   ),
//   StudentModel(
//     id: 4,
//     username: 'اسم المستخدم 2',
//     time: '2024/3/4',
//     studentText:
//         'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
//     studentImage: 'assets/school/school2.jpg',
//     likes: 15,
//     islikes: false,
//   ),
//   StudentModel(
//     id: 5,
//     username: 'اسم المستخدم 2',
//     time: '2024/3/4',
//     studentText:
//         'بسم الله ماشاء الله تبارك الرحمن الانتهاء من تفتيش ثالث برادات  #مجموعة_شركات_الماظة_للشحن_الدولي 16/8/2023 الان من امام ميناء سفاجا والتوجه الي المخازن في جمهورية مصر العربية للتواصل والاستفسارات 00971582040166 00971582040155 00971582616061 00971504113132 للتواصل والاستفسارات مكتب مصر 002011111004449',
//     studentImage: 'assets/school/school1.jpg',
//     likes: 15,
//     islikes: false,
//   ),
// //    
// ];




// class StudentRemoteDataSourceImpl implements StudentRemoteDataSource {
//   final http.Client client;

//   StudentRemoteDataSourceImpl({required this.client});

 
  
//   @override
//   Future<StudentAttendanceModel> getDataStudentToParentRemote(int idStudent) async {
    
    
//      final response = await client.get(
//       Uri.parse(URLs.URL_GetBranches),
//       // headers: {"Content-Type": "application/json"},
//     );

//     if (200 == 200) {
//     // if (response.statusCode == 200) {
//       //   final body = json.decode(response.body);
//       // final error = body['error'];
//       //  final List decodedJson = body['city'] as List;
//       //  print(body['city']);
//       //  print(error.toString());

//       // final List<StudentModel> StudentModels = posts
//           // .map<StudentModel>((jsonStudentModel) => StudentModel.fromJson(jsonStudentModel))
//           // .toList();
//           print("Student Class");
//           print(".StudentModels");
//           print("Student Class");
//           // StudentAttendanceModel studentClassModel=[
//           //   StudentClassModel(name: "ahmed",id: 12),
//           //   StudentClassModel(name: "ahm5ed",id: 13),
//           //   StudentClassModel(name: "ahme6d",id: 14),
//           // ];
//           final StudentAttendanceModel studentClass = studentClassModel.toList();
           

//       return studentClass;
//     } else {
  
//       throw ServerException();
//     }
//   }
  
// //   @override
// //   Future<List<StudentActivityModel>> getStudentData(int idClass) async {
    
// //     print(idClass);
// //     print("idClass");
// //     print(idClass);
// //     print("idClass");
// //     print(idClass);

// //     final response = await client.get(
// //       Uri.parse(URLs.URL_GetBranches),
// //      );

// //     if (200 == 200) {


// //           List<StudentActivityModel> studentDataModel=[
// //             StudentActivityModel(name: "احمد",id: 12,isPresent: false,isSick: false,degreeHomeWork:0.0,degreeMonthTest: 0.0),
// //             StudentActivityModel(name: "علي",id: 13,isPresent: false,isSick: false,degreeHomeWork:0.0,degreeMonthTest: 0.0),
// //             StudentActivityModel(name: "سيف الحداد",id: 14,isPresent: false,isSick: false,degreeHomeWork:0.0,degreeMonthTest: 0.0),
// //             StudentActivityModel(name: "قاسم محصنة",id: 16,isPresent: false,isSick: false,degreeHomeWork:0.0,degreeMonthTest: 0.0),
// //             StudentActivityModel(name: "عبداللة الرعوي",id: 19,isPresent: false,isSick: false,degreeHomeWork:0.0,degreeMonthTest: 0.0),
// //             StudentActivityModel(name: "علي",id: 13,isPresent: false,isSick: false,degreeHomeWork:0.0,degreeMonthTest: 0.0),
// //             StudentActivityModel(name: "سيف الحداد",id: 14,isPresent: false,isSick: false,degreeHomeWork:0.0,degreeMonthTest: 0.0),
// //             StudentActivityModel(name: "قاسم محصنة",id: 16,isPresent: false,isSick: false,degreeHomeWork:0.0,degreeMonthTest: 0.0),
// //             StudentActivityModel(name: "عبداللة الرعوي",id: 19,isPresent: false,isSick: false,degreeHomeWork:0.0,degreeMonthTest: 0.0),
// //             StudentActivityModel(name: "سيف قادر",id: 19,isPresent: false,isSick: false,degreeHomeWork:0.0,degreeMonthTest: 0.0),
// //           ];
// //           final List<StudentActivityModel> studentData = studentDataModel.toList();
           

// //       return studentData;
// //     } else {
  
// //       throw ServerException();
// //     }
// //   }

// //   @override
// //   Future<Unit> addStudentAssignment(List<StudentActivityModel> studentActivityList) async {
// //     //  final body = {
// //       // "city_name": studentModel.username,
// //           // "username": studentModel.username,
// //         // "time": studentModel.time,
// //         // "studentText": studentModel.studentText,
// //         // "studentImage": studentModel.studentImage,
// //         // "likes": studentModel.likes,
// //         // "islikes": studentModel.islikes,
// //     // };
// //     // final response =
// //     //     await client.post(Uri.parse(URLs.URL_GetBranches), body: body);
// //     print("------------------------------");
// //     print("=========================");
// // print(studentActivityList);
// //     print("=========================");
// //     print("------------------------------");


// //     // if (response.statusCode == 201) {
// //     // if (response.statusCode == 200) {
// //     if (200 == 200) {
// //       return Future.value(unit);
// //     } else {
// //       throw ServerException();
// //     }
// //   }


// // @override
// // Future<Unit> addStudentAttendance(List<StudentActivityClass>  studentActivityList) async {
// //  print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
// //  print(studentActivityList);
// //  print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
// //  print(",,,,,,,,,,,,,,,,,,,,,,,");
// //  print("data source");
// //   // final response = await http.post(
    
// //   //     Uri.parse(URLs.URL_GetPosts),
// //   //     body: {
// //   //       // 'id': studentId.toString(),
// //   //     },
// //   //   );


// //   if (200 == 200) {
// //   // if (response.statusCode == 200) {
// //     return Future.value(unit);
// //   } else {
// //     throw ServerException();
// //   }
// // }


// //   @override
// //   Future<Unit> addStudentBehavior(List<StudentActivityModel> studentActivityList) async {
// //     //  final studentId = studentModel.id.toString();
// //     // final body = {
// //     //   "name": studentModel.username,
// //     //     // "username": studentModel.username,
// //     //     // "time": studentModel.time,
// //     //     // "studentText": studentModel.studentText,
// //     //     // "studentImage": studentModel.studentImage,
// //     //     // "likes": studentModel.likes,
// //     //     // "islikes": studentModel.islikes,
// //     // };

// //     // final response = await client.patch(
// //     //   Uri.parse(URLs.URL_REGISTER),
// //     //   body: body,
// //     // );
// // print("0000000000000000000000000000");
// // print(studentActivityList);
// // print("0000000000000000000000000000");
// //     if (200 == 200) {
// //     // if (response.statusCode == 200) {
// //       return Future.value(unit);
// //     } else {
// //       throw ServerException();
// //     }
// //   }

// //   @override
// //   Future<Unit> addStudentMonthlyTest(List<StudentActivityModel> studentActivityList) async {
// //     //  final studentId = studentActivityList.id.toString();
// //     // final body = {
// //     //   "name": studentModel.username,
// //     // };

// //     // final response = await client.patch(
// //     //   Uri.parse(URLs.URL_REGISTER),
// //     //   body: body,
// //     // );
// //     print("#############    #######  ######");
// //     print(studentActivityList);
// //     print("#############    ######  #######");
    

// //     if (200 == 200) {
// //     // if (response.statusCode == 200) {
// //       return Future.value(unit);
// //     } else {
// //       throw ServerException();
// //     }
// //   }


// }
