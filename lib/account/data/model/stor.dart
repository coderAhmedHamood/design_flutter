class UserData {
  static int? _id = 13;
  // static int? _id ;
  static String _username = "ahmed";
  static String _password = "12345";
  static String _email = "ahmedcs202144@gmail.com";
  static String _permissions = "مدير";

  static int? get id => _id;
  static set id(int? value) {
    _id = value;
  }

  static String get username => _username;
  static set username(String value) {
    _username = value;
  }

  static String get password => _password;
  static set password(String value) {
    _password = value;
  }

  static String get email => _email;
  static set email(String value) {
    _email = value;
  }

  static String get permissions => _permissions;
  static set permissions(String value) {
    _permissions = value;
  }
}
