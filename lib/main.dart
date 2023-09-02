import 'package:flutter/material.dart';
import 'package:flutter_design/branch/presentation/bloc/branch/branch_bloc.dart';
import 'package:flutter_design/notification/presentation/bloc/notification/Notifications_event.dart';

import 'package:flutter_design/student/presentation/bloc/up_data_student/student_bloc.dart';
import 'package:get/get.dart';
import 'account/bloc/account_bloc.dart';
import 'base/bloc_ob_serve.dart';
import 'home_main/presentation/bloc/posts/posts_bloc.dart';
import 'notification/presentation/bloc/notification/Notifications_bloc.dart';
import 'parent/presentation/bloc/parent_bloc.dart';
import 'screen/tabbar/home_Tabbar.dart';
import 'base/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
  import 'injection_container.dart' as di;


void main() async {
  Bloc.observer = AppBlocObServer();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
 
     return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<StudentBloc>()), 
        BlocProvider(create: (_) => di.sl<AccountBloc>()), 
        BlocProvider(create: (_) => di.sl<ParentBloc>()), 
        BlocProvider(create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        // BlocProvider(create: (_) => di.sl<NotificationsBloc>()..add(GetAllNotificationsEvent())),
        BlocProvider(create: (_) => di.sl<NotificationsBloc>()..add(GetValueNotificationBarEvent())),
        // BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),
        BlocProvider(create: (_) => di.sl<BranchBloc>()..add(GetAllBranchEvent())),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Posts App',
        // home: PostsPage(),
        home: TabBarViewScreen(),
      ),
    );
  }
}
 
 
