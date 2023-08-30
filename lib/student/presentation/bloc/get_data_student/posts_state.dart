// part of 'Get_delete_update_StudentDataToFather_bloc.dart';

import 'package:equatable/equatable.dart';
 
abstract class StudentDataToFatherState extends Equatable {
  const StudentDataToFatherState();

  @override
  List<Object> get props => [];
}

class StudentDataToFatherInitial extends StudentDataToFatherState {}

class LoadingStudentDataToFatherState extends StudentDataToFatherState {}



class ReLoadedStudentDataToFatherDataState extends StudentDataToFatherState {
  // final List<StudentActivityClass> StudentDataToFatherActivity;
  // ReLoadedStudentDataToFatherDataState({required this.StudentDataToFatherActivity});

  // @override
  // List<Object> get props => [StudentDataToFatherActivity];
}

class ErrorStudentDataToFatherState extends StudentDataToFatherState {
  final String message;

  ErrorStudentDataToFatherState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageStudentDataToFatherState extends StudentDataToFatherState {
  final String message;

  MessageStudentDataToFatherState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageStudentDataToFatherMonthlyTestState extends StudentDataToFatherState {
  final String message;
  MessageStudentDataToFatherMonthlyTestState({required this.message});
  @override
  List<Object> get props => [message];
}

class MessageGetStudentDataToFatherAssignmentState extends StudentDataToFatherState {
  final String message;

  MessageGetStudentDataToFatherAssignmentState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageGetStudentDataToFatherAttendanceState extends StudentDataToFatherState {
  final String message;

  MessageGetStudentDataToFatherAttendanceState({required this.message});

  @override
  List<Object> get props => [message];
}
class MessageGetStudentDataToFatherBehaviourState extends StudentDataToFatherState {
  final String message;

  MessageGetStudentDataToFatherBehaviourState({required this.message});

  @override
  List<Object> get props => [message];
}
