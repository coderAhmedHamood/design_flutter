// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../domain/entities/student.dart';

abstract class StudentEvent extends Equatable {
  StudentEvent();

  @override
  List<Object> get props => [];
}


class GetStudentClassEvent extends StudentEvent {}


class AddStudentAttendanceDataEvent extends StudentEvent {


    final StudentsAttendanceClass studentsAttendanceClass;
  AddStudentAttendanceDataEvent({
    required this.studentsAttendanceClass,
  });
  @override
  List<Object> get props => [studentsAttendanceClass];
}

class AddStudentMonthlyExamGradesEvent extends StudentEvent {
    final Student student;
  AddStudentMonthlyExamGradesEvent({
    required this.student,
  });
    @override
  List<Object> get props => [student];
}

class AddStudentAssignmentEvent extends StudentEvent {
  final Student student;
  AddStudentAssignmentEvent({
    required this.student,
  });
    @override
  List<Object> get props => [student];
}

class AddStudentBehaviorDataEvent extends StudentEvent {
  final Student student;
  AddStudentBehaviorDataEvent({
    required this.student,
  });
    @override
  List<Object> get props => [student];
}

 
