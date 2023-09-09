part of 'branch_bloc.dart';

abstract class BranchEvent extends Equatable {
  const BranchEvent();

  @override
  List<Object> get props => [];
}

class GetAllBranchEvent extends BranchEvent {}
class RefreshBranchEvent extends BranchEvent {}

class GetAllDataStudentEvent extends BranchEvent {
  final int idBranch;
  GetAllDataStudentEvent({required this.idBranch});
  @override
  List<Object> get props => [idBranch];
}