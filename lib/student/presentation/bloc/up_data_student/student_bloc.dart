import 'package:bloc/bloc.dart';
import 'package:flutter_design/student/domain/entities/student.dart';
import 'package:flutter_design/student/domain/usecases/up_attendance.dart';
import 'package:flutter_design/student/domain/usecases/up_behavior.dart';
import 'package:flutter_design/student/domain/usecases/up_month_test.dart';
import 'package:flutter_design/student/domain/usecases/up_assignment.dart';
import '../../../../../base/strings/messages.dart';
import 'package:dartz/dartz.dart';

import '../../../../../base/error/failures.dart';
import '../../../../../base/strings/failures.dart';

import '../../../domain/usecases/get_class.dart';
import 'Student_event.dart';
import 'student_state.dart';

// part 'add_delete_update_student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final AddStudentAttendanceUsecase addAttendance;
  final AddStudentBehaviorUsecase addBehavior;
  final AddStudentMonthTestUsecase addMonthTestDigree;
  final AddStudentAssignmentUsecase addAssignment;
  final GetStudentClassUsecase getClass;

  StudentBloc({
    required this.addAttendance,
    required this.addAssignment,
    required this.addBehavior,
    required this.addMonthTestDigree,
    required this.getClass,
  }) : super(AddDeleteUpdateStudentInitial()) {
    on<StudentEvent>((event, emit) async {
      if (event is AddStudentAttendanceDataEvent) {
        emit(LoadingStudentState());

        final failureOrDoneMessage =
            await addAttendance(event.studentsAttendanceClass);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, ADD_STUDENT_SUCCESS_MESSAGE),
        );
      } else if (event is AddStudentAssignmentEvent) {
        emit(LoadingStudentState());
        final failureOrDoneMessage = await addAssignment(event.student);
        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, ADD_STUDENT_SUCCESS_MESSAGE),
        );
      } else if (event is GetStudentClassEvent) {
        emit(LoadingStudentState());
        final failureOrDoneMessage = await getClass();
        print(failureOrDoneMessage);
        print("bloc in get data............ student ");
        emit(
          _mapFailureOrStudentsToState(failureOrDoneMessage),
        );
      } else if (event is AddStudentBehaviorDataEvent) {
        emit(LoadingStudentState());
        final failureOrDoneMessage = await addBehavior(event.student);
        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, ADD_STUDENT_SUCCESS_MESSAGE),
        );
      } else if (event is AddStudentMonthlyExamGradesEvent) {
        emit(LoadingStudentState());
        final failureOrDoneMessage = await addMonthTestDigree(event.student);
        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, ADD_STUDENT_SUCCESS_MESSAGE),
        );
      }
    });
  }

  StudentState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorStudentState(
        message: _mapFailureToMessage(failure),
      ),
      (_) => MessageStudentState(message: message),
    );
  }

 

  StudentState _mapFailureOrStudentsToState(
      Either<Failure, List<StudentsClassClass>> either) {
    return either.fold(
      (failure) => ErrorStudentState(message: _mapFailureToMessage(failure)),
      (studentsClass) => LoadedStudentsState(
        studentsClassClass: studentsClass,
      ),
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