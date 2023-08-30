// part of 'add_delete_update_student_bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../student/domain/entities/student_activity_class.dart';
import '../../../student/domain/entities/students_class_class.dart';
 
 

abstract class ParentState extends Equatable {
  const ParentState();

  @override
  List<Object> get props => [];
}

class ParentInitial extends ParentState {}

class LoadingParentState extends ParentState {}

class LoadedStudentsState extends ParentState {
  final List<StudentsClassClass> studentsClassClass;
  LoadedStudentsState({required this.studentsClassClass});

  @override
  List<Object> get props => [studentsClassClass];
}

class LoadedStudentsDataState extends ParentState {
  final List<StudentActivityClass> studentActivity;
  LoadedStudentsDataState({required this.studentActivity});

  @override
  List<Object> get props => [studentActivity];
}

class ReLoadedStudentsDataState extends ParentState {
  final List<StudentActivityClass> studentActivity;
  ReLoadedStudentsDataState({required this.studentActivity});

  @override
  List<Object> get props => [studentActivity];
}

class ErrorParentState extends ParentState {
  final String message;

  ErrorParentState({required this.message});

  @override
  List<Object> get props => [message];
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
