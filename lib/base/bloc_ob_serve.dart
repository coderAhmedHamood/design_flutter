import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObServer extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // print(bloc);
    // print(change);
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    // print(bloc);
     super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    // print(bloc);
     super.onCreate(bloc);
  }
}
