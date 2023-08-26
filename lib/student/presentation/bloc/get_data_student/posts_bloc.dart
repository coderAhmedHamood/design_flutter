// import 'package:bloc/bloc.dart';
// import 'package:flutter_design/student/presentation/bloc/get_data_student/posts_state.dart';
// import '../../../../../base/error/failures.dart';
// import '../../../../../base/strings/failures.dart';
// import 'package:dartz/dartz.dart';

// import '../up_data_student/Student_event.dart';
// import '../up_data_student/student_state.dart';
 

// class StudentsBloc extends Bloc<StudentEvent, StudentState> {
  
//   final GetAllStudentsUsecase getAllStudents;
//   StudentsBloc({
//     required this.getAllStudents,
//   }) : super(StudentsInitial) {
//     on<StudentEvent>((event, emit) async {
//       if (event is GetAllStudentsEvent) {
//         emit(LoadingStudentsState());
//         final failureOrStudents = await getAllStudents();
//         emit(_mapFailureOrStudentsToState(failureOrStudents));

//       //   // ChangeEvent
//       }
//       // else if (event is RefreshStudentsEvent) {
//       //   emit(LoadingStudentsState());

//       //   final failureOrStudents = await getAllStudents();
//       //   // failureOrStudents.fold((l) => ErrorStudentsState(message: l.runtimeType.toString()),
//       //   // (r) => emit(LoadingStudentsState()),
//       //   // );
//       //   emit(_mapFailureOrStudentsToState(failureOrStudents));
//       // } 
  
//     });
//   }

//   StudentState _mapFailureOrStudentsToState(Either<Failure, List<Student>> either) {

//     return either.fold(
//       (failure) => ErrorStudentState(message: _mapFailureToMessage(failure)),
//       (students) => LoadedStudentState(
//         students: students,
//       ),
//     );
//   }

//   String _mapFailureToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return SERVER_FAILURE_MESSAGE;
//       case EmptyCacheFailure:
//         return EMPTY_CACHE_FAILURE_MESSAGE;
//       case OfflineFailure:
//         return OFFLINE_FAILURE_MESSAGE;
//       default:
//         return "Unexpected Error , Please try again later .";
//     }
//   }
// }
