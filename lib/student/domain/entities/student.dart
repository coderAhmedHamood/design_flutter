 
 import 'package:equatable/equatable.dart';

class Student  extends Equatable{
 final int? id;
 final String username;
 final String time;
 final String studentText;
 final String studentImage;
  late final int  likes;
 late final bool islikes;

   Student({
    required this.id,
    required this.username,
    required this.time,
    required this.studentText,
    required this.studentImage,
    required this.likes,
    required this.islikes,
  });
  
  @override
  List<Object?> get props => [id, username,time,studentText,studentImage,likes,islikes];
}