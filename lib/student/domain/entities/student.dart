 
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

class StudentsAttendanceClass  extends Equatable{
 final int? id;
 final String name;
 final bool isPresent;
 final bool isSick;

  StudentsAttendanceClass({
    required this.id,
    required this.name,
    required this.isPresent,
    required this.isSick,
  });
  @override
  List<Object?> get props => [id, name,isPresent,isSick];
}
 
class StudentsClassClass extends Equatable{
  final name;
  final int? id;

  StudentsClassClass({
    required this.name,
    
    required this.id,
  });
  @override
  List<Object?> get props => [id, name];
}


class StudentActivityClass extends Equatable {
  int id;
  String name;
  bool isPresent;
  bool isSick;
  double degree;

  StudentActivityClass({
    required this.id,
    required this.name,
    required this.isPresent,
    required this.isSick,
    required this.degree,
  });
  @override
  List<Object?> get props => [id, name,isPresent,isSick,degree];
}

List<StudentActivityClass> convertStudentsClassToAttendance(
    List<StudentsClassClass> studentsClass) {
  return studentsClass.map((studentClass) {
    return StudentActivityClass(
      id: studentClass.id!,
      name: studentClass.name,
      isPresent: false,
      isSick: false,
      degree: 0.0,
    );
  }).toList();
}

