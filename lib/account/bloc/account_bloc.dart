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

 
  }

  FutureOr<void> _loginEvent(LoginEvent event, Emitter<AccountState> emit) async {

try {
  
      emit(LoadingLoginState());
      await UserProvider().login(event.email,event.password);
      emit(SuccessLoginState());
} catch (error) {
      emit(LoadingLoginState());
  
}

  }

  FutureOr<void> _registerEvent(RegisterEvent event, Emitter<AccountState> emit) async{
    try {
      emit(LoadingRegisterState());
      await UserProvider().register(event.email,event.username,event.password);
      emit(SuccessRegisterState());
} catch (error) {
      emit(ErrorRegisterState());
  
}


  }
}


