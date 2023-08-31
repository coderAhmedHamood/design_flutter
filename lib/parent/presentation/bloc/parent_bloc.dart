import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_design/parent/presentation/bloc/parent_event.dart';
import 'package:flutter_design/student/domain/usecases/up_attendance.dart';
 

 
import '../../../base/error/failures.dart';
import '../../../base/strings/failures.dart';
import '../../../student/domain/entities/student_activity_class.dart';
 import '../../domain/usecases/get_student_data_to_parent.dart';
import '../../domain/usecases/get_student_data_to_parent_monthly_test.dart';
import 'parent_event.dart';
 import 'parent_state.dart';

// part 'add_delete_update_student_state.dart';
List<StudentActivityClass> students = [];

class ParentBloc extends Bloc<ParentEvent, ParentState> {
  // final AddStudentAttendanceUsecase addAttendance;
  // final AddStudentBehaviorUsecase addBehavior;
  // final AddStudentMonthTestUsecase addMonthTestDigree;
  // final AddStudentAssignmentUsecase addAssignment;
  final GetDataStudentToParenttUsecase getDataStudentToParentAttendance;
  final GetDataStudentToParentMonthlyTestUsecase getDataStudentToParentMonthlyTest;
  // final GetStudentDataUsecase getStudentData;

  ParentBloc({
    // required this.addAttendance,
    // required this.addAssignment,
    // required this.addBehavior,
    // required this.addMonthTestDigree,
    required this.getDataStudentToParentAttendance,
    required this.getDataStudentToParentMonthlyTest,
    // required this.getStudentData,
  }) : super(ParentInitial()) {
    // on<AddStudentAttendanceEvent>(_addStudentAttendanceEvent);
    // on<AddStudentAssignmentEvent>(_addStudentAssignmentEvent);
    on<GetDataStudentToParentEvent>(_getDataStudentToParentEvent);
    on<GetDataStudentToParentMonthlyTestEvent>(_getDataStudentToParentMonthlyTestEvent);
    // on<AddStudentMonthlyTestDegreeEvent>(_addStudentMonthlyTestDegreeEvent);
    // on<GetStudentDataEvent>(_getStudentDataEvent);
    // on<ReloadStudentDataEvent>(_reloadStudentDataEvent);
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

  // FutureOr<void> _addStudentMonthlyTestDegreeEvent(
  //     AddStudentMonthlyTestDegreeEvent event,
  //     Emitter<StudentState> emit) async {
  //   emit(LoadingStudentState());
  //   final failureOrDoneMessage =
  //       await addMonthTestDigree(event.studentMonthlyTest);

  //   emit(failureOrDoneMessage.fold(
  //     (failure) => ErrorStudentState(
  //       message: _mapFailureToMessage(failure),
  //     ),
  //     (_) =>
  //         MessageStudentMonthlyTestState(message: "تم رفع درجة الاختبار بنجاح"),
  //   ));
  // }

  // FutureOr<void> _addStudentBehaviorDataEvent(
  //     AddStudentBehaviorDataEvent event, Emitter<StudentState> emit) async {
  //   emit(LoadingStudentState());
  //   final failureOrDoneMessage = await addBehavior(event.studentBehavior);
  //   emit(failureOrDoneMessage.fold(
  //     (failure) => ErrorStudentState( 
  //       message: _mapFailureToMessage(failure),
  //     ),
  //     (_) => MessageAddStudentBehaviourState(message: "تم رفع السلوك بنجاح"),
  //   ));
  // }

  // FutureOr<void> _getStudentDataEvent(
  //     GetStudentDataEvent event, Emitter<StudentState> emit) async {
  //   emit(LoadingStudentState());
  //   final failureOrDoneMessage = await getStudentData(event.idClass);

  //   failureOrDoneMessage.fold(
  //     (failure) =>
  //         emit(ErrorStudentState(message: _mapFailureToMessage(failure))),
  //     (studentsData) {
  //       students = studentsData; // تعيين البيانات المسترجعة في `students`
  //       emit(LoadedStudentsDataState(studentActivity: studentsData));
  //     },
  //   );
  // }



  FutureOr<void> _getDataStudentToParentEvent(GetDataStudentToParentEvent event, Emitter<ParentState> emit) async{
emit(LoadingStudentDataToParentState());

    final failureOrDoneMessage = await getDataStudentToParentAttendance(event.idStuden);

    failureOrDoneMessage.fold(
      (failure) =>
          emit(ErrorParentState(message: _mapFailureToMessage(failure))),
      (studentData) {
        // students = studentsData; // تعيين البيانات المسترجعة في `students`
        emit(LoadedStudentDataToParentState(studentAttendanceClass:studentData ));
      },
    );
  }



  

  FutureOr<void> _getDataStudentToParentMonthlyTestEvent(GetDataStudentToParentMonthlyTestEvent event, Emitter<ParentState> emit) async{
    emit(LoadingStudentDataToParentState());

    final failureOrDoneMessage = await getDataStudentToParentMonthlyTest(event.idStuden);
print("55555555555555555555555555555");
print(failureOrDoneMessage);
print("55555555555555555555555555555");
    failureOrDoneMessage.fold(
      (failure) =>
          emit(ErrorParentState(message: _mapFailureToMessage(failure))),
      (studentData) {
        // students = studentsData; // تعيين البيانات المسترجعة في `students`
        emit(LoadedStudentDataToParentMonthlyTestState(studentAttendanceClassMonthly:studentData ));
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
