import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../student/data/models/student_model.dart';
import 'stor.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyToken = 'token';
  static const _password = 'password';
  static const _username = 'username';
  static const _email = 'email';
  static const _permissions = 'permissions';
  static const  _teacherData="teacherData";
  static const _keyList = 'lists';
  static const _dateex = 'dates';




static Future<void> setTeacherData(TeacherData teacherData) async {
    final value = teacherData.toString(); // تحويل الكائن إلى سلسلة نصية
    await _storage.write(key: _teacherData, value: value);
  }


 static Future<TeacherData?> getTeacherData() async {
    final secureStorage = FlutterSecureStorage();
    final teacherDataString = await secureStorage.read(key: _teacherData);
    if (teacherDataString != null) {
      final data = json.decode(teacherDataString);
      return data;
    } else {
      return null;
    }
  }

   
  
  static Future setToken(String token) async =>
      await _storage.write(key: _keyToken, value: token);

  static Future<String?> getToken() async =>
      await _storage.read(key: _keyToken);


      static Future<void> setPassword(String password) async =>
      await _storage.write(key: _password, value: password);

  static Future<String?> getPassword() async =>
      await _storage.read(key: _password);

  static Future<void> setUsername(String username) async =>
      await _storage.write(key: _username, value: username);

  static Future<String?> getUsername() async =>
      await _storage.read(key: _username);

  static Future<void> setEmail(String email) async =>
      await _storage.write(key: _email, value: email);

  static Future<String?> getEmail() async =>
      await _storage.read(key: _email);

  static Future<void> setPermissions(String permissions) async =>
      await _storage.write(key: _permissions, value: permissions);

  static Future<String?> getPermissions() async =>
      await _storage.read(key: _permissions);


  static Future setLists(List<String> lists) async {
    final value = json.encode(lists);

    await _storage.write(key: _keyList, value: value);
  }

  static Future<List<String>?> getLists() async {
    final value = await _storage.read(key: _keyList);

    return value == null ? null : List<String>.from(json.decode(value));
  }

  static Future<DateTime?> setDates(DateTime date) async {
    final dates = date.toIso8601String();
    await _storage.write(key: _dateex, value: dates);

    return dates == null ? null : DateTime.tryParse(dates);
  }

  static Future<DateTime?> getDates() async {
    final dates = await _storage.read(key: _dateex);

    return dates == null ? null : DateTime.tryParse(dates);
  }
}
