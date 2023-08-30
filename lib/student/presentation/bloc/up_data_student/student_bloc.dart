import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_design/student/domain/entities/student.dart';
import 'package:flutter_design/student/domain/usecases/up_attendance.dart';
import 'package:flutter_design/student/domain/usecases/up_behavior.dart';
import 'package:flutter_design/student/domain/usecases/up_month_test.dart';
import 'package:flutter_design/student/domain/usecases/up_assignment.dart';
import '../../../../../base/strings/messages.dart';

import '../../../../../base/error/failures.dart';
import '../../../../../base/strings/failures.dart';

import '../../../domain/entities/student_activity_class.dart';
import '../../../domain/usecases/get_Student_data.dart';
import '../../../domain/usecases/get_class.dart';
import 'Student_event.dart';
import 'student_state.dart';

// part 'add_delete_update_student_state.dart';
List<StudentActivityClass> students = [];

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final AddStudentAttendanceUsecase addAttendance;
  final AddStudentBehaviorUsecase addBehavior;
  final AddStudentMonthTestUsecase addMonthTestDigree;
  final AddStudentAssignmentUsecase addAssignment;
  final GetStudentClassUsecase getClass;
  final GetStudentDataUsecase getStudentData;

  StudentBloc({
    required this.addAttendance,
    required this.addAssignment,
    required this.addBehavior,
    required this.addMonthTestDigree,
    required this.getClass,
    required this.getStudentData,
  }) : super(StudentInitial()) {
    on<AddStudentAttendanceEvent>(_addStudentAttendanceEvent);
    on<AddStudentAssignmentEvent>(_addStudentAssignmentEvent);
    on<GetStudentClassEvent>(_getStudentClassEvent);
    on<AddStudentBehaviorDataEvent>(_addStudentBehaviorDataEvent);
    on<AddStudentMonthlyTestDegreeEvent>(_addStudentMonthlyTestDegreeEvent);
    on<GetStudentDataEvent>(_getStudentDataEvent);
    on<ReloadStudentDataEvent>(_reloadStudentDataEvent);
  }

  FutureOr<void> _reloadStudentDataEvent(
      ReloadStudentDataEvent event, Emitter<StudentState> emit) {
    emit(ReLoadedStudentsDataState(studentActivity: students));
  }

  FutureOr<void> _addStudentAttendanceEvent(
      AddStudentAttendanceEvent event, Emitter<StudentState> emit) async {
    emit(LoadingStudentState());

    final failureOrDoneMessage = await addAttendance(event.studentAttendance);
    emit(failureOrDoneMessage.fold(
      (failure) => ErrorStudentState(
        message: _mapFailureToMessage(failure),
      ),
      (_) => MessageAddStudentsAttendanceState(
          message: "تم التحضير بنجاح"),
    ));
    // emit(EmitNull());
  }

  FutureOr<void> _addStudentAssignmentEvent(
      AddStudentAssignmentEvent event, Emitter<StudentState> emit) async {
    emit(LoadingStudentState());
    final failureOrDoneMessage = await addAssignment(event.studentAssignment);
    emit(failureOrDoneMessage.fold(
      (failure) => ErrorStudentState(
        message: _mapFailureToMessage(failure),
      ),
      (_) => MessageAddStudentsAssignmentState(
          message: ADD_STUDENT_SUCCESS_MESSAGE),
    ));
  }

  FutureOr<void> _getStudentClassEvent(
      GetStudentClassEvent event, Emitter<StudentState> emit) async {
    emit(LoadingStudentState());
    final failureOrDoneMessage = await getClass();
    emit(failureOrDoneMessage.fold(
      (failure) => ErrorStudentState(message: _mapFailureToMessage(failure)),
      (studentsClass) => LoadedStudentsState(
        studentsClassClass: studentsClass,
      ),
    ));
  }

  FutureOr<void> _addStudentMonthlyTestDegreeEvent(
      AddStudentMonthlyTestDegreeEvent event,
      Emitter<StudentState> emit) async {
    emit(LoadingStudentState());
    final failureOrDoneMessage =
        await addMonthTestDigree(event.studentMonthlyTest);

    emit(failureOrDoneMessage.fold(
      (failure) => ErrorStudentState(
        message: _mapFailureToMessage(failure),
      ),
      (_) =>
          MessageStudentMonthlyTestState(message: "تم رفع درجة الاختبار بنجاح"),
    ));
  }

  FutureOr<void> _addStudentBehaviorDataEvent(
      AddStudentBehaviorDataEvent event, Emitter<StudentState> emit) async {
    emit(LoadingStudentState());
    final failureOrDoneMessage = await addBehavior(event.studentBehavior);
    emit(failureOrDoneMessage.fold(
      (failure) => ErrorStudentState( 
        message: _mapFailureToMessage(failure),
      ),
      (_) => MessageAddStudentBehaviourState(message: "تم رفع السلوك بنجاح"),
    ));
  }

  FutureOr<void> _getStudentDataEvent(
      GetStudentDataEvent event, Emitter<StudentState> emit) async {
    emit(LoadingStudentState());
    final failureOrDoneMessage = await getStudentData(event.idClass);

    failureOrDoneMessage.fold(
      (failure) =>
          emit(ErrorStudentState(message: _mapFailureToMessage(failure))),
      (studentsData) {
        students = studentsData; // تعيين البيانات المسترجعة في `students`
        emit(LoadedStudentsDataState(studentActivity: studentsData));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
