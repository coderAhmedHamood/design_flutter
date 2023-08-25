part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}


class SuccessRegisterState extends AccountState {}
class LoadingRegisterState extends AccountState {}
class ErrorRegisterState extends AccountState {}

class SuccessLoginState extends AccountState {}
class LoadingLoginState extends AccountState {}
class ErrorLoginState extends AccountState {}



