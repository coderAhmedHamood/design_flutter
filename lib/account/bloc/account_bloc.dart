import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

 
import '../data/provider/provider.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<LoginEvent>(_loginEvent);
    on<RegisterEvent>(_registerEvent);
    on<LogoutEvent>(_logoutEvent);
  }

  FutureOr<void> _loginEvent(
      LoginEvent event, Emitter<AccountState> emit) async {
    try {
      emit(LoadingLoginState());
      await UserProvider().login(event.email, event.password);
 print("NNN   NNN       NNNN         NNNN  N NN");
      emit(SuccessLoginState());
    } catch (error) {
      emit(ErrorLoginState());
    }
  }

  FutureOr<void> _registerEvent(
      RegisterEvent event, Emitter<AccountState> emit) async {
    try {
      emit(LoadingRegisterState());
      await UserProvider()
          .register(event.email, event.username, event.password);
      emit(SuccessRegisterState());
    } catch (error) {
      emit(ErrorRegisterState());
    }
  }

  FutureOr<void> _logoutEvent(
      LogoutEvent event, Emitter<AccountState> emit) async {
    try {
      emit(LoadingLogoutState());
      await UserProvider().logout();
      emit(SuccessLogoutState());
    } catch (error) {
      emit(ErrorLogoutState());
    }
  }
}
