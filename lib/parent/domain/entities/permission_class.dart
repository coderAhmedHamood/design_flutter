import 'package:equatable/equatable.dart';

class PermissionRequesClass extends Equatable{
  final String reason;
  final String message;
  final String date;
  final bool status;
  PermissionRequesClass({
    required this.reason,
    required this.message,
    required this.date,
    required this.status,
  });

  @override
  List<Object?> get props=>[reason,message,date,status];
  
}