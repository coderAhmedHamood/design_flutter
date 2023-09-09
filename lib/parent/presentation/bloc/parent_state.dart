// part of 'add_delete_update_student_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_design/parent/data/models/permission_model.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';

import '../../../student/domain/entities/student_activity_class.dart';
import '../../../student/domain/entities/students_class_class.dart';

abstract class ParentState extends Equatable {
  const ParentState();

  @override
  List<Object> get props => [];
}

// class LoadedStudentsDataToParentState extends ParentState {
//   final StudentDataTableClass StudentDataTableClass;
//   LoadedStudentsDataToParentState({required this.StudentDataTableClass});

//   @override
//   List<Object> get props => [StudentDataTableClass];
// }
class LoadingAddPermissionStudentsDataToParentState extends ParentState {}

class LoadingStudentDataToParentState extends ParentState {}

class ErrorParentState extends ParentState {
  final String message;

  ErrorParentState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadedStudentDataToParentState extends ParentState {
  final StudentDataTableClass studentDataTableClass;
  LoadedStudentDataToParentState({required this.studentDataTableClass});
  @override
  List<Object> get props => [studentDataTableClass];
}

class LoadedStudentDataToParentPermissionState extends ParentState {
  final List<PermissionRequesModel> permissionRequesModel;
  LoadedStudentDataToParentPermissionState(
      {required this.permissionRequesModel});
  @override
  List<Object> get props => [permissionRequesModel];
}

class LoadedStudentDataToParentMonthlyTestState extends ParentState {
  final StudentDataTableClass StudentDataTableClassMonthly;
  LoadedStudentDataToParentMonthlyTestState(
      {required this.StudentDataTableClassMonthly});
  @override
  List<Object> get props => [StudentDataTableClassMonthly];
}
 

class ParentInitial extends ParentState {}

class ReLoadedStudentsDataState extends ParentState {
  final List<StudentActivityClass> studentActivity;
  ReLoadedStudentsDataState({required this.studentActivity});

  @override
  List<Object> get props => [studentActivity];
}

class MessageParentState extends ParentState {
  final String message;

  MessageParentState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageStudentMonthlyTestState extends ParentState {
  final String message;
  MessageStudentMonthlyTestState({required this.message});
  @override
  List<Object> get props => [message];
}

class MessageAddStudentsAssignmentState extends ParentState {
  final String message;

  MessageAddStudentsAssignmentState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddStudentsAttendanceState extends ParentState {
  final String message;

  MessageAddStudentsAttendanceState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddStudentBehaviourState extends ParentState {
  final String message;

  MessageAddStudentBehaviourState({required this.message});

  @override
  List<Object> get props => [message];
}
