import 'package:bloc/bloc.dart';
import 'package:flutter_design/branch/domain/entities/branch.dart';
import '../../../../../base/error/failures.dart';
import '../../../../../base/strings/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

  
import '../../../domain/usecases/get_all_branch.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final GetAllBranchUsecase getAllBranch;
  BranchBloc({
    required this.getAllBranch,
  }) : super(BranchInitial()) {
    on<BranchEvent>((event, emit) async {
      if (event is GetAllBranchEvent) {
        emit(LoadingBranchState());
        
        final failureOrBranch = await getAllBranch();
        emit(_mapFailureOrBranchToState(failureOrBranch));

        // ChangeEvent
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
