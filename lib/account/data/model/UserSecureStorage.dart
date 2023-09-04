import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'stor.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyToken = 'token';
  static const _password = 'password';
  static const _username = 'username';
  static const _email = 'email';
  static const _permissions = 'permissions';
  static const _teacherData = "teacherData";
  static const _parentData = "parentData";


  static Future<void> setTeacherData(TeacherData teacherData) async {
    final jsonValue = json.encode(teacherData.toJson());
    await _storage.write(key: _teacherData, value: jsonValue);
  }

  static Future<TeacherData> getTeacherData() async {
    final jsonValue = await _storage.read(key: _teacherData);
    if (jsonValue != null) {
      final jsonData = json.decode(jsonValue);
      return TeacherData.fromJson(jsonData);
    } else {
      return TeacherData('',[]);
    }
  }

  static Future<void> setParentData(ParentData parentData) async {
    final jsonValue = json.encode(parentData.toJson());
    await _storage.write(key: _parentData, value: jsonValue);
  }

static Future<ParentData> getParentData() async {
  final jsonValue = await _storage.read(key: _parentData);
  if (jsonValue != null) {
    final jsonData = json.decode(jsonValue);
    return ParentData.fromJson(jsonData);
  } else {
    return ParentData([]);
  }
}

 

  static Future<void> setPassword(String password) async =>
      await _storage.write(key: _password, value: password);

  static Future<void> setUsername(String username) async =>
      await _storage.write(key: _username, value: username);

  static Future<void> setEmail(String email) async =>
      await _storage.write(key: _email, value: email);

  static Future<void> setPermissions(String permissions) =>
      _storage.write(key: _permissions, value: permissions);

 

 static Future<String?> getPassword() async {
  String? value = await _storage.read(key: _password);
  if (value == null || value.isEmpty) {
    return null;
  } else {
    return value;
  }
}

static Future<String?> getUsername() async {
  String? value = await _storage.read(key: _username);
  if (value == null || value.isEmpty) {
    return null;
  } else {
    return value;
  }
}

static Future<String?> getEmail() async {
  String? value = await _storage.read(key: _email);
  if (value == null || value.isEmpty) {
    return null;
  } else {
    return value;
  }
}

  static Future<String?> getPermissions() async {
    final value = await _storage.read(key: _permissions);
    if (value == null || value.isEmpty) {
      return null;
    } else {
      return value;
    }
  }

  
  static Future<void> deleteToken() async =>
      await _storage.delete(key: _keyToken);

  static Future<void> deletePassword() async =>
      await _storage.delete(key: _password);

  static Future<void> deleteUsername() async =>
      await _storage.delete(key: _username);

  static Future<void> deleteEmail() async => await _storage.delete(key: _email);

  static Future<void> deletePermissions() async =>
      await _storage.delete(key: _permissions);

  static Future<void> deleteTeacherData() async =>
      await _storage.delete(key: _teacherData);
}
