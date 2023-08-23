// import '../../domain/entities/post.dart';

// class PostModel extends Post {
//   const PostModel({int? id, required String name}) : super(id: id, name: name);

//   factory PostModel.fromJson(Map<String, dynamic> json) {
//     dynamic id = json['id'];
//     int parsedId = (id is int) ? id : int.parse(id);
//     return PostModel(id: parsedId, name: json['city_name']);
    
//   }

//   Map<String, dynamic> toJson() {
//     return {'id': id, 'city_name': name};
//   }
// }


import '../../domain/entities/post.dart';

class PostModel extends Post {
   PostModel({
    int? id,
    required String username,
    required String time,
    required String postText,
    required String postImage,
    required int likes,
    required bool islikes,
  }) : super(
          id: id,
          username: username,
          time: time,
          postText: postText,
          postImage: postImage,
          likes: likes,
          islikes: islikes,
        );
 
  factory PostModel.fromJson(Map<String, dynamic> json) {
    dynamic id = json['id'];
    int parsedId = (id is int) ? id : int.parse(id);
    return PostModel(id: json['id'] , username: json['username'] ,time:json['time'],postText:json['postText'],postImage: json['postImage'],likes: json['likes'],islikes: json['islikes']);
    
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username,'time':time,'postText':postText,'postImage': postImage,'likes':likes,'islikes':islikes};
  }
}
