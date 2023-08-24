part of 'branch_bloc.dart';

abstract class BranchState extends Equatable {
  const BranchState();

  @override
  List<Object> get props => [];
}

class BranchInitial extends BranchState {}

class LoadingBranchState extends BranchState {}

class LoadedBranchState extends BranchState {
  final List<Branch> branch;

  LoadedBranchState({required this.branch});

  @override
  List<Object> get props => [branch];
}

class ErrorBranchState extends BranchState {
  final String message;

  ErrorBranchState({required this.message});
  @override
  List<Object> get props => [message];
}
