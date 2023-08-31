// part of 'add_delete_update_student_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_design/parent/domain/entities/student_attendance_class.dart';

import '../../../student/domain/entities/student_activity_class.dart';
import '../../../student/domain/entities/students_class_class.dart';
 
 

abstract class ParentState extends Equatable {
  const ParentState();

  @override
  List<Object> get props => [];
}



// class LoadedStudentsDataToParentState extends ParentState {
//   final StudentAttendanceClass studentAttendanceClass;
//   LoadedStudentsDataToParentState({required this.studentAttendanceClass});

//   @override
//   List<Object> get props => [studentAttendanceClass];
// }

class LoadingStudentDataToParentState extends ParentState {}

class ErrorParentState extends ParentState {
  final String message;

  ErrorParentState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadedStudentDataToParentState extends ParentState {
  final StudentAttendanceClass studentAttendanceClass;
  LoadedStudentDataToParentState({required this.studentAttendanceClass});
  @override
  List<Object> get props => [studentAttendanceClass];
}

class LoadedStudentDataToParentMonthlyTestState extends ParentState {
  final StudentAttendanceClass studentAttendanceClassMonthly;
  LoadedStudentDataToParentMonthlyTestState({required this.studentAttendanceClassMonthly});
  @override
  List<Object> get props => [studentAttendanceClassMonthly];
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
