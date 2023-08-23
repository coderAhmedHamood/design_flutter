import 'dart:convert';

import '../../../../core/error/exceptions.dart';
import '../models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int postId);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> addPost(PostModel postModel);
}
   List<PostModel> posts = [
  PostModel(
    id: 1,
    username: 'اسم المستخدم 1',
    time: '2024/3/5',
    postText:
        ' تعبكم راحه , يكفي ثقتكم في مجموعهمدارس العربية السعيدة الاهلية   رحله كل 10 ايام للفنكوش..',
    postImage: "",
    // postImage: 'assets/post_image1.png',
    likes: 30,
    islikes: true,
  ),
  PostModel(
    id: 2,
    username: 'ابو العرب',
    time: '2024/3/4',
    postText:
        'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    postImage: '',
    likes: 15,
    islikes: false,
  ),
    
  PostModel(
    id: 3,
    username: 'ابو العرب',
    time: '2024/3/4',
    postText:
        'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    postImage: "assets/school/ahmed.jpg",
    likes: 15,
    islikes: true,
  ),
  PostModel(
    id: 4,
    username: 'اسم المستخدم 2',
    time: '2024/3/4',
    postText:
        'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    postImage: 'assets/school/school2.jpg',
    likes: 15,
    islikes: false,
  ),
  PostModel(
    id: 5,
    username: 'اسم المستخدم 2',
    time: '2024/3/4',
    postText:
        'بسم الله ماشاء الله تبارك الرحمن الانتهاء من تفتيش ثالث برادات  #مجموعة_شركات_الماظة_للشحن_الدولي 16/8/2023 الان من امام ميناء سفاجا والتوجه الي المخازن في جمهورية مصر العربية للتواصل والاستفسارات 00971582040166 00971582040155 00971582616061 00971504113132 للتواصل والاستفسارات مكتب مصر 002011111004449',
    postImage: 'assets/school/school1.jpg',
    likes: 15,
    islikes: false,
  ),
//    
];


const BASE_URL = "https://monitor-health-services.shopingsoft.com/php/";

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PostModel>> getAllPosts() async {
    print("getAllPosts");
    print("datasources.........");
    
    final response = await client.get(
      Uri.parse(BASE_URL + "city.php?city=GetCity"),
      // headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      //   final body = json.decode(response.body);
      // final error = body['error'];
      //  final List decodedJson = body['city'] as List;
      //  print(body['city']);
      //  print(error.toString());

      // final List<PostModel> postModels = posts
          // .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          // .toList();
          final List<PostModel> postModels = posts.toList();

      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    print("addPost");
    final body = {
      "city_name": postModel.username,
          // "username": postModel.username,
        // "time": postModel.time,
        // "postText": postModel.postText,
        // "postImage": postModel.postImage,
        // "likes": postModel.likes,
        // "islikes": postModel.islikes,
    };

    final response =
        await client.post(Uri.parse(BASE_URL + "city.php?city=AddCity"), body: body);

    // if (response.statusCode == 201) {
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }


@override
Future<Unit> deletePost(int postId) async {
 print("deletePost");
  final response = await http.post(
    
      Uri.parse(BASE_URL + "delete.php?delete=DeleteCity"),
      body: {
        'id': postId.toString(),
      },
    );


  if (response.statusCode == 200) {
    return Future.value(unit);
  } else {
    throw ServerException();
  }
}


  @override
  Future<Unit> updatePost(PostModel postModel) async {
    print("updatePost");
    final postId = postModel.id.toString();
    final body = {
      "name": postModel.username,
        // "username": postModel.username,
        // "time": postModel.time,
        // "postText": postModel.postText,
        // "postImage": postModel.postImage,
        // "likes": postModel.likes,
        // "islikes": postModel.islikes,
    };

    final response = await client.patch(
      Uri.parse(BASE_URL + "/posts/$postId"),
      body: body,
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
