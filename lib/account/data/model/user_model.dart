


import 'package:equatable/equatable.dart';

class UserClass extends Equatable{

final int? id;
final String username;
final String password;
final String email;
final String permissions;

UserClass({
  required this.id,
  required this.username,
  required this.password,
  required this.email,
  required this.permissions,
});
@override
List<Object?> get props => [id,username,password,email,permissions];
}

class UserModel extends UserClass {
  UserModel({
    required int? id,
    required String username,
    required String password,
    required String email,
    required String permissions,
  }) : super(
          id: id,
          username: username,
          password: password,
          email: email,
          permissions: permissions,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      permissions: json['permissions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'permissions': permissions,
    };
  }
}