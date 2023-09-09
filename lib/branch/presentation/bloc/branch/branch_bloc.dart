import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_design/branch/domain/entities/branch.dart';
import '../../../../../base/error/failures.dart';
import '../../../../../base/strings/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/data_student.dart';
import '../../../domain/usecases/get_all_branch.dart';
import '../../../domain/usecases/get_data_student.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final GetAllBranchUsecase getAllBranch;
  final GetAllDataStudentUsecase getAllDataStudent;
  BranchBloc({
    required this.getAllBranch,
    required this.getAllDataStudent,
  }) : super(BranchInitial()) {
    on<GetAllDataStudentEvent>(_getAllDataStudentEvent);
    on<GetAllBranchEvent>(_getAllBranchEvent);
    on<BranchEvent>((event, emit) async {
      if (event is GetAllBranchEvent) {
      } else if (event is RefreshBranchEvent) {
        emit(LoadingBranchState());

        final failureOrBranch = await getAllBranch();
        emit(_mapFailureOrBranchToState(failureOrBranch));
      }
    });
  }

  BranchState _mapFailureOrBranchToState(Either<Failure, List<Branch>> either) {
    return either.fold(
      (failure) => ErrorBranchState(message: _mapFailureToMessage(failure)),
      (branch) => LoadedBranchState(
        branch: branch,
      ),
    );
  }



  FutureOr<void> _getAllDataStudentEvent(
      GetAllDataStudentEvent event, Emitter<BranchState> emit) async {
    emit(LoadingGetDataStudentState());

    final failureOrBranch = await getAllDataStudent(event.idBranch);
     emit(
      failureOrBranch.fold(
        (failure) => ErrorGetDataStudentState(message: _mapFailureToMessage(failure)),
        (dataStudent) => LoadedGetDataStudentState(
          dataStudent: dataStudent,
        ),
      ),
    );
    
    // ChangeEvent
  }

  FutureOr<void> _getAllBranchEvent(
      GetAllBranchEvent event, Emitter<BranchState> emit) async {
    emit(LoadingBranchState());

    final failureOrBranch = await getAllBranch();
    

    emit(
      failureOrBranch.fold(
        (failure) => ErrorBranchState(message: _mapFailureToMessage(failure)),
        (branch) => LoadedBranchState(
          branch: branch,
        ),
      ),
    );
    // emit(_mapFailureOrBranchToState(failureOrBranch));

    // ChangeEvent
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
