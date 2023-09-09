import 'package:flutter_design/parent/data/models/student_model.dart';

import '../../../student/data/models/student_model.dart';

class TeacherData {
  String subject;
  List<StudentClassModel> classes;

  TeacherData(this.subject, this.classes);

  bool get isEmpty {
    return subject.isEmpty && classes.isEmpty;
  }

  factory TeacherData.fromJson(Map<String, dynamic> json) {
    final subject = json['subject'];
    final classes = (json['classes'] as List<dynamic>)
        .map((c) => StudentClassModel.fromJson(c))
        .toList();
    return TeacherData(subject, classes);
  }
  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'classes': classes.map((c) => c.toJson()).toList(),
    };
  }
}

class ParentData {
  List<StudentModel> studentName;

  ParentData(this.studentName);

  
    bool get isEmpty {
    return studentName.isEmpty;
  }
  
  factory ParentData.fromJson(Map<String, dynamic> json) {
    // final studentName = (json['studentName'] as List<dynamic>)
    //     .map((c) => StudentModel.fromJson(c))
    //     .toList();
           final studentName = (json['studentName'] as List<dynamic>)
        .map((c) => StudentModel.fromJson(c))
        .toList();
    return ParentData(studentName);
  }


  Map<String, dynamic> toJson() {
    return {
      'studentName': studentName.map((c) => c.toJson()).toList(),
    };
  }

}

class UserData {
 
  static int? _id;
  static String? _username;
  static String? _password;
  static String? _email;
  static String? _permissions;
  static TeacherData? _teacherData;
  static String? _className;
  static String? _StudentName;
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
  static void setStudentName(String studentName) {
    _StudentName = studentName;
  }

  static int? get id => _id;
  static String? get username => _username;
  static String? get password => _password;
  static String? get email => _email;
  static String? get permissions =>_permissions;
  static TeacherData? get teacherData => _teacherData;
  static ParentData? get parentData => _parentData;
  static String? get className => _className;
  static String? get studentName => _StudentName;
}
