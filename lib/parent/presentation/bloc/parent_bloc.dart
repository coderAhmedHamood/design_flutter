import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_design/parent/presentation/bloc/parent_event.dart';

import '../../../base/error/failures.dart';
import '../../../base/strings/failures.dart';
import '../../../student/domain/entities/student_activity_class.dart';
import '../../domain/usecases/add_permission.dart';
import '../../domain/usecases/get_data_assigned_task.dart';
import '../../domain/usecases/get_student_data_to_parent.dart';
import '../../domain/usecases/get_student_data_to_parent_assignments.dart';
import '../../domain/usecases/get_student_data_to_parent_monthly_test.dart';

import '../../domain/usecases/get_student_data_to_parent_permission.dart';
import 'parent_state.dart';

// part 'add_delete_update_student_state.dart';
List<StudentActivityClass> students = [];

class ParentBloc extends Bloc<ParentEvent, ParentState> {
  final GetDataStudentToParenttUsecase getDataStudentToParentAttendance;
  final GetDataStudentToParentAssignmentsEventUsecase getDataStudentToParentAssignments;
  final GetDataStudentToParentAssignedTaskEventUsecase getDataStudentToParentAssignedTask;
  final GetDataStudentToParentMonthlyTestUsecase getDataStudentToParentMonthlyTest;
  final GetDataStudentToParentPermissionUsecase getDataStudentToParentPermission;
  final AddPermissionToStudentUsecase addPermissionToStudentUsecase;

  ParentBloc({
    required this.getDataStudentToParentAttendance,
    required this.getDataStudentToParentMonthlyTest,
    required this.getDataStudentToParentAssignments,
    required this.getDataStudentToParentAssignedTask,
    required this.getDataStudentToParentPermission,
    required this.addPermissionToStudentUsecase,
  }) : super(ParentInitial()) {
    on<GetDataStudentToParentEvent>(_getDataStudentToParentEvent);
    on<GetDataStudentToParentMonthlyTestEvent>(
        _getDataStudentToParentMonthlyTestEvent);
    on<GetDataStudentToParentAssignmentsEvent>(
        _getDataStudentToParentAssignmentsEvent);
    on<GetDataStudentToParentAssignedTaskEvent>(
        _getDataStudentToParentAssignedTaskEvent);
    on<GetDataStudentToParentPermissionEvent>(
        _getDataStudentToParentPermissionEvent);
    on<AddPermissionToStudentEvent>(
        _addPermissionToStudentEvent);
  }

  // FutureOr<void> _reloadStudentDataEvent(
  //     ReloadStudentDataEvent event, Emitter<StudentState> emit) {
  //   emit(ReLoadedStudentsDataState(studentActivity: students));
  // }

  // FutureOr<void> _getStudentClassEvent(
  //     GetStudentClassEvent event, Emitter<StudentState> emit) async {
  //   emit(LoadingStudentState());
  //   final failureOrDoneMessage = await getClass();
  //   emit(failureOrDoneMessage.fold(
  //     (failure) => ErrorStudentState(message: _mapFailureToMessage(failure)),
  //     (studentsClass) => LoadedStudentsState(
  //       studentsClassClass: studentsClass,
  //     ),
  //   ));
  // }



  FutureOr<void> _getDataStudentToParentEvent(
      GetDataStudentToParentEvent event, Emitter<ParentState> emit) async {
    emit(LoadingStudentDataToParentState());

    final failureOrDoneMessage =
        await getDataStudentToParentAttendance(event.idStuden);

    failureOrDoneMessage.fold(
      (failure) =>
          emit(ErrorParentState(message: _mapFailureToMessage(failure))),
      (studentData) {
        // students = studentsData; // تعيين البيانات المسترجعة في `students`
        emit(LoadedStudentDataToParentState(
            studentDataTableClass: studentData));
      },
    );
  }

  FutureOr<void> _getDataStudentToParentMonthlyTestEvent(
      GetDataStudentToParentMonthlyTestEvent event,
      Emitter<ParentState> emit) async {
    emit(LoadingStudentDataToParentState());

    final failureOrDoneMessage =
        await getDataStudentToParentMonthlyTest(event.idStuden);

    failureOrDoneMessage.fold(
      (failure) =>
          emit(ErrorParentState(message: _mapFailureToMessage(failure))),
      (studentData) {
        // students = studentsData; // تعيين البيانات المسترجعة في `students`
        emit(LoadedStudentDataToParentMonthlyTestState(
            StudentDataTableClassMonthly: studentData));
      },
    );
  }

  FutureOr<void> _getDataStudentToParentAssignmentsEvent(
      GetDataStudentToParentAssignmentsEvent event,
      Emitter<ParentState> emit) async {
    emit(LoadingStudentDataToParentState());

    final failureOrDoneMessage =
        await getDataStudentToParentAssignments(event.idStuden);

    failureOrDoneMessage.fold(
      (failure) =>
          emit(ErrorParentState(message: _mapFailureToMessage(failure))),
      (studentData) {
        // students = studentsData; // تعيين البيانات المسترجعة في `students`
        emit(LoadedStudentDataToParentState(
            studentDataTableClass: studentData));
      },
    );
  }

  FutureOr<void> _getDataStudentToParentPermissionEvent(
      GetDataStudentToParentPermissionEvent event,
      Emitter<ParentState> emit) async {
    emit(LoadingStudentDataToParentState());

    final failureOrDoneMessage =
        await getDataStudentToParentPermission(event.idStuden);

    failureOrDoneMessage.fold(
      (failure) =>
          emit(ErrorParentState(message: _mapFailureToMessage(failure))),
      (studentDataPermission) {
        emit(LoadedStudentDataToParentPermissionState(
            permissionRequesModel: studentDataPermission));
      },
    );
  }



  FutureOr<void> _addPermissionToStudentEvent(AddPermissionToStudentEvent event, Emitter<ParentState> emit) async{
      
    emit(LoadingAddPermissionStudentsDataToParentState());
    final failureOrDoneMessage =
        await addPermissionToStudentUsecase(event.permissionRequesModel);

    emit(failureOrDoneMessage.fold(
      (failure) => ErrorParentState(
        message: _mapFailureToMessage(failure),
      ),
      (_) =>
          MessageStudentMonthlyTestState(message: "تم رفع درجة الاختبار بنجاح"),
    ));
  


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

  FutureOr<void> _getDataStudentToParentAssignedTaskEvent(GetDataStudentToParentAssignedTaskEvent event, Emitter<ParentState> emit) async{
     emit(LoadingStudentDataToParentState());

    final failureOrDoneMessage =
        await getDataStudentToParentAssignedTask(event.idStuden);

    failureOrDoneMessage.fold(
      (failure) =>
          emit(ErrorParentState(message: _mapFailureToMessage(failure))),
      (studentData) {
        // students = studentsData; // تعيين البيانات المسترجعة في `students`
        emit(LoadedStudentDataToParentState(
            studentDataTableClass: studentData));
      },
    );
  }
}
