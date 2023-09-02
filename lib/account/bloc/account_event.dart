part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}


class LoginEvent extends AccountEvent {
  String email,password;
  LoginEvent({
    required this.email,
    required this.password,
  });
}
class LogoutEvent extends AccountEvent {}

class RegisterEvent extends AccountEvent {
  String email,username,password;
  RegisterEvent({
    required this.email,
    required this.username,
    required this.password,
  });
}

class GetProfileEvent extends AccountEvent {}
class ChangePasswordEvent extends AccountEvent {}
 