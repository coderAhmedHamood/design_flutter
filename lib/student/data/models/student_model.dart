import '../../domain/entities/behaviour_students_class.dart';
import '../../domain/entities/student.dart';
import '../../domain/entities/student_activity_class.dart';
import '../../domain/entities/students_class_class.dart';

// class StudentModel extends Student {
//   StudentModel({
//     int? id,
//     required String username,
//     required String time,
//     required String studentText,
//     required String studentImage,
//     required int likes,
//     required bool islikes,
//   }) : super(
//           id: id,
//           username: username,
//           time: time,
//           studentText: studentText,
//           studentImage: studentImage,
//           likes: likes,
//           islikes: islikes,
//         );

//   factory StudentModel.fromJson(Map<String, dynamic> json) {
//     dynamic id = json['id'];
//     int parsedId = (id is int) ? id : int.parse(id);
//     return StudentModel(
//         id: json['id'],
//         username: json['username'],
//         time: json['time'],
//         studentText: json['studentText'],
//         studentImage: json['studentImage'],
//         likes: json['likes'],
//         islikes: json['islikes']);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'username': username,
//       'time': time,
//       'studentText': studentText,
//       'studentImage': studentImage,
//       'likes': likes,
//       'islikes': islikes
//     };
//   }
// }

class StudentClassModel extends StudentsClassClass {
  StudentClassModel({
    int? id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory StudentClassModel.fromJson(Map<String, dynamic> json) {
    return StudentClassModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}



class StudentActivityModel extends StudentActivityClass {
    
  StudentActivityModel({
     required int id,
    required String name,
    required bool isPresent,
    required bool isSick,
    required double degreeHomeWork,
    required double degreeMonthTest,
         BehaviourStudentsClass? behaviourStudentsClass,
  }) : super(
          id: id,
          name: name,
          isPresent: isPresent,
          isSick: isSick,
          degreeHomeWork: degreeHomeWork,
          degreeMonthTest: degreeMonthTest,
           behaviourStudentsClass: behaviourStudentsClass,
        );

  factory StudentActivityModel.fromJson(Map<String, dynamic> json) {
    return StudentActivityModel(
      id: json['id'],
      name: json['name'],
      isPresent: json['isPresent'],
      isSick: json['isSick'],
      degreeHomeWork: json['degreeHomeWork'],
      degreeMonthTest: json['degreeMonthTest'],
 behaviourStudentsClass: json['behaviourStudentsClass'] != null
          ? BehaviourStudentsClass.fromJson(json['behaviourStudentsClass'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isPresent': isPresent,
      'isSick': isSick,
      'degreeHomeWork': degreeHomeWork,
      'degreeMonthTest': degreeMonthTest,
'behaviourStudentsClass': behaviourStudentsClass != null
          ? behaviourStudentsClass!.toJson()
          : null,
    };
  }
}
