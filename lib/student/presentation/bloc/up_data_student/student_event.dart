// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../domain/entities/student.dart';
import '../../../domain/entities/student_activity_class.dart';

abstract class StudentEvent extends Equatable {
  StudentEvent();

  @override
  List<Object> get props => [];
}


class GetStudentClassEvent extends StudentEvent {}
class ReloadStudentDataEvent extends StudentEvent {}
class GetStudentDataEvent extends StudentEvent {
  final int idClass;
  GetStudentDataEvent({
    required this.idClass,
  });
    @override
  List<Object> get props => [idClass];
}


class AddStudentAttendanceEvent extends StudentEvent {


      final List<StudentActivityClass> studentAttendance;
  AddStudentAttendanceEvent({
    required this.studentAttendance,
  });
  @override
  List<Object> get props => [studentAttendance];
}

class AddStudentMonthlyTestDegreeEvent extends StudentEvent {
    final List<StudentActivityClass> studentMonthlyTest;
   
  AddStudentMonthlyTestDegreeEvent({
    required this.studentMonthlyTest,
  });
    @override
  List<Object> get props => [studentMonthlyTest];
}
class AddStudentBehaviorDataEvent extends StudentEvent {
    final List<StudentActivityClass> studentBehavior;
   
  AddStudentBehaviorDataEvent({
    required this.studentBehavior,
  });
    @override
  List<Object> get props => [studentBehavior];
}

class AddStudentAssignmentEvent extends StudentEvent {
  final List<StudentActivityClass> studentAssignment;
   
  AddStudentAssignmentEvent({
    required this.studentAssignment,
  });
    @override
  List<Object> get props => [studentAssignment];
}
 

 
