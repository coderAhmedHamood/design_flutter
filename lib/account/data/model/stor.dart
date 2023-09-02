import '../../../parent/domain/entities/Student.dart';
import '../../../student/data/models/student_model.dart';
import '../../../student/domain/entities/students_class_class.dart';

// class TeacherData {
//   String subject;
//   List<StudentClassModel> classes;

//   TeacherData(this.subject, this.classes);

//   Map<String, dynamic> toJson() {
//     return {
//       'subject': subject,
//       'classes': classes.map((c) => c.toJson()).toList(),
//     };
//   }

//   factory TeacherData.fromJson(Map<String, dynamic> json) {
//     final subject = json['subject'];
//     final classes = (json['classes'] as List<dynamic>)
//         .map((c) => StudentClassModel.fromJson(c))
//         .toList();
//     return TeacherData(subject, classes);
//   }
// }



class TeacherData {
  String subject;
  List<StudentsClassClass> classes;

  TeacherData(this.subject, this.classes);
}

class ParentData {
  List<StudentClass> studentName;

  ParentData(this.studentName);
}

class UserData {
  static int? _id;
  static String? _username;
  static String? _password;
  static String? _email;
  static String? _permissions;
  static TeacherData? _teacherData;
  static String? _className;
  static ParentData? _parentData;

  static void setUserDataValues(int id, String username, String password,
      String email, String permissions) {
    _id = id;
    _username = username;
    _password = password;
    _email = email;
    _permissions = permissions;
  }

  static void setTeacherData(TeacherData teacherData) {
    _teacherData = teacherData;
  }

  static void setParentData(ParentData parentData) {
    _parentData = parentData;
  }

  static void setSubject(String className) {
    _className = className;
  }

  static int? get id => _id;
  static String? get username => _username;
  static String? get password => _password;
  static String? get email => _email;
  static String? get permissions => _permissions;
  static TeacherData? get teacherData => _teacherData;
  static ParentData? get parentData => _parentData;
  static String? get className => _className;
}
