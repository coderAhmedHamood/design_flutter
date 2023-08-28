 
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


 
class StudentsClassClass extends Equatable{
  final int? id;
  final name;

  StudentsClassClass({
    required this.id,
    required this.name,
  });
  @override
  List<Object?> get props => [id, name];
}
class BehaviourStudentsClass {
  String title;
  String message;

  BehaviourStudentsClass({
    required this.title,
    required this.message,
  });

  factory BehaviourStudentsClass.fromJson(Map<String, dynamic> json) {
    return BehaviourStudentsClass(
      title: json['title'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'message': message,
    };
  }
}

class StudentActivityClass extends Equatable {
  int id;
  String name;
  bool isPresent;
  bool isSick;
  double degreeHomeWork;
  double degreeMonthTest;
  BehaviourStudentsClass? behaviourStudentsClass;


  StudentActivityClass({
    required this.id,
    required this.name,
    required this.isPresent,
    required this.isSick,
    required this.degreeHomeWork,
    required this.degreeMonthTest,
      this.behaviourStudentsClass,
  });
  @override
  List<Object?> get props => [id, name,isPresent,isSick,degreeHomeWork,degreeMonthTest,behaviourStudentsClass];
}



