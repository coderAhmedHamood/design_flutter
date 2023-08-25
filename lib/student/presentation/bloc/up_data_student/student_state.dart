// part of 'add_delete_update_student_bloc.dart';


import 'package:equatable/equatable.dart';

abstract class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class AddDeleteUpdateStudentInitial extends StudentState {}

class LoadingStudentState extends StudentState {}

class ErrorStudentState extends StudentState {
  final String message;

  ErrorStudentState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageStudentState extends StudentState {
  final String message;

  MessageStudentState({required this.message});

  @override
  List<Object> get props => [message];
}
