import 'package:flutter/material.dart';
 import 'screen/tabbar/home_Tabbar.dart';
import 'core/app_theme.dart';
import 'features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'features/posts/presentation/bloc/bloc_ob_serve.dart';
 
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
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
    // return GetMaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(),
    //   home: TabBarViewScreen(),
    // );
     return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Posts App',
        // home: PostsPage(),
        home: TabBarViewScreen(),
      ),
    );
  }
}
 
 
