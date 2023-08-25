part of 'branch_bloc.dart';

abstract class BranchEvent extends Equatable {
  const BranchEvent();

  @override
  List<Object> get props => [];
}

class GetAllBranchEvent extends BranchEvent {}

class RefreshBranchEvent extends BranchEvent {}