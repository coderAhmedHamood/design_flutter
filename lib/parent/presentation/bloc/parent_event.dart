// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_design/parent/data/models/permission_model.dart';

import '../../../student/domain/entities/student_activity_class.dart';
import '../../domain/entities/permission_class.dart';

abstract class ParentEvent extends Equatable {
  ParentEvent();

  @override
  List<Object> get props => [];
}


class GetDataStudentToParentEvent extends ParentEvent {
  int idStuden;
  GetDataStudentToParentEvent({
    required this.idStuden,
  });
  @override
  List<Object> get props => [idStuden];
}
class GetDataStudentToParentMonthlyTestEvent extends ParentEvent {
  int idStuden;
  GetDataStudentToParentMonthlyTestEvent({
    required this.idStuden,
  });
  @override
  List<Object> get props => [idStuden];
}
class GetDataStudentToParentAssignmentsEvent extends ParentEvent {
  int idStuden;
  GetDataStudentToParentAssignmentsEvent({
    required this.idStuden,
  });
  @override
  List<Object> get props => [idStuden];
}
class GetDataStudentToParentAssignedTaskEvent extends ParentEvent {
  int idStuden;
  GetDataStudentToParentAssignedTaskEvent({
    required this.idStuden,
  });
  @override
  List<Object> get props => [idStuden];
}
class GetDataStudentToParentPermissionEvent extends ParentEvent {
  int idStuden;
  GetDataStudentToParentPermissionEvent({
    required this.idStuden,
  });
  @override
  List<Object> get props => [idStuden];
}

class ReloadStudentDataEvent extends ParentEvent {}
class GetStudentDataEvent extends ParentEvent {
  final int idStuden;
  GetStudentDataEvent({
    required this.idStuden,
  });
    @override
  List<Object> get props => [idStuden];
}


class AddStudentAttendanceEvent extends ParentEvent {


      final List<StudentActivityClass> studentAttendance;
  AddStudentAttendanceEvent({
    required this.studentAttendance,
  });
  @override
  List<Object> get props => [studentAttendance];
}
class AddPermissionToStudentEvent extends ParentEvent {
      final PermissionRequesModel permissionRequesModel;
  AddPermissionToStudentEvent({
    required this.permissionRequesModel,
  });
  @override
  List<Object> get props => [permissionRequesModel];
}

class AddStudentMonthlyTestDegreeEvent extends ParentEvent {
    final List<StudentActivityClass> studentMonthlyTest;
   
  AddStudentMonthlyTestDegreeEvent({
    required this.studentMonthlyTest,
  });
    @override
  List<Object> get props => [studentMonthlyTest];
}
class AddStudentBehaviorDataEvent extends ParentEvent {
    final List<StudentActivityClass> studentBehavior;
   
  AddStudentBehaviorDataEvent({
    required this.studentBehavior,
  });
    @override
  List<Object> get props => [studentBehavior];
}

class AddStudentAssignmentEvent extends ParentEvent {
  final List<StudentActivityClass> studentAssignment;
   
  AddStudentAssignmentEvent({
    required this.studentAssignment,
  });
    @override
  List<Object> get props => [studentAssignment];
}
 

 
