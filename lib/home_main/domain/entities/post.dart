 
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// class Post extends Equatable {
//   final int? id;
//   final String name;
//   const Post({
//     this.id,
//     required this.name,
//   });
//   @override
//   List<Object?> get props => [id, name];
// }


class Post  extends Equatable{
 final int? id;
 final String username;
 final String time;
 final String postText;
 final String postImage;
  late final int  likes;
   bool islikes;

   Post({
    required this.id,
    required this.username,
    required this.time,
    required this.postText,
    required this.postImage,
    required this.likes,
    required this.islikes,
  });
  
  @override
  List<Object?> get props => [id, username,time,postText,postImage,likes,islikes];
}