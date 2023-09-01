import '../../domain/entities/permission_class.dart';

class PermissionRequesModel extends PermissionRequesClass {
  PermissionRequesModel({
    required String reason,
    required String message,
    required String date,
    required bool status,
    
  }) : super(
          reason: reason,
          message: message,
          date: date,
          status: status,
        );

  factory PermissionRequesModel.fromJson(Map<String, dynamic> json) {
    return PermissionRequesModel(
      reason: json['reason'],
      message: json['message'],
      date: json['date'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reason': reason,
      'message': message,
      'date': date,
      'status': status,
    };
  }
}
