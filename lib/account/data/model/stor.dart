import '../../../student/domain/entities/student.dart';

class TeacherData {
  String subject;
  List<StudentsClassClass> classes;

  TeacherData(this.subject, this.classes);
}

class ParentData {
  List<String> studentNames;

  ParentData(this.studentNames);
}

class UserData {
  static int? _id;
  static String? _username;
  static String? _password;
  static String? _email;
  static String? _permissions;
  static TeacherData? _teacherData;
  static ParentData? _parentData;
  static String? _className;
  

  static void setUserDataValues(int id, String username, String password, String email, String permissions) {
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

  

  