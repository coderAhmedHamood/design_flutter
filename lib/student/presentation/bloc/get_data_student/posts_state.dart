// // part of 'students_bloc.dart';

// import 'package:equatable/equatable.dart';

// import '../../../domain/entities/student.dart';

// abstract class StudentsState extends Equatable {
//   const StudentsState();

//   @override
//   List<Object> get props => [];
// }

// class StudentsInitial extends StudentsState {}

// class LoadingStudentsState extends StudentsState {}

// class LoadedStudentsState extends StudentsState {
//   final List<Student> students;

//   LoadedStudentsState({required this.students});

//   @override
//   List<Object> get props => [students];
// }

// class ErrorStudentsState extends StudentsState {
//   final String message;

//   ErrorStudentsState({required this.message});

//   @override
//   List<Object> get props => [message];
// }
