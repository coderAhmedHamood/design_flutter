import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/branch/presentation/bloc/branch/branch_bloc.dart';
import 'package:flutter_design/notification/presentation/bloc/notification/Notifications_event.dart';

import 'package:flutter_design/student/presentation/bloc/up_data_student/student_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'account/bloc/account_bloc.dart';
import 'base/constants/bloc_ob_serve.dart';
 
import 'generated/l10n.dart';
import 'home_main/presentation/bloc/posts/posts_bloc.dart';
import 'notification/presentation/bloc/notification/Notifications_bloc.dart';
import 'notification/presentation/ui/widgets/notification_top.dart';
import 'parent/presentation/bloc/parent_bloc.dart';
import 'screen/tabbar/home_Tabbar.dart';
import 'base/constants/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

import 'package:firebase_messaging/firebase_messaging.dart';
 

Future BackgroundMessageNotifications(RemoteMessage message) async {
  print("back ground message -----------------------------000000000");
  createNotification(
    5,
    "channelKey",
    "${message.notification?.title}",
    "${message.notification?.body}",
    "assets/notification3.png",
  );

  print("---++---++");
  print("${message.notification?.title}");
  print("${message.from}");
  print("${message.notification}");
  print("${message.collapseKey}");
  print("---++---++");
}

void main() async {
  Bloc.observer = AppBlocObServer();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(BackgroundMessageNotifications);

  FirebaseMessaging.instance.getToken().then((value) => {
        debugPrint('-------------------Token=$value=--------------------:'),
      });

  // AwesomeNotifications().initialize(
  //   'resource:assets/notification3.png',
  //   [
  //     NotificationChannel(
  //       channelKey: 'channelKey',
  //       channelName: 'channelName',
  //       channelDescription: 'channelDescription',
  //       // playSound: false,
  //       // channelShowBadge: true,
  //     ),
  //   ],
  // );

  // createNotification(2, "channelKey", "title", "body",
  //          "asset://assets/no_internet.png");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    final Locale locale;
const MyApp({Key? key, this.locale = const Locale("ar")}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<StudentBloc>()),
        BlocProvider(create: (_) => di.sl<AccountBloc>()),
        BlocProvider(create: (_) => di.sl<ParentBloc>()),
        BlocProvider(
            create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        // BlocProvider(create: (_) => di.sl<NotificationsBloc>()..add(GetAllNotificationsEvent())),
        BlocProvider(
            create: (_) => di.sl<NotificationsBloc>()
              ..add(GetValueNotificationBarEvent())),
        // BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),
        BlocProvider(
            create: (_) => di.sl<BranchBloc>()..add(GetAllBranchEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          locale: locale,
      // locale: Locale("en"),
         localizationsDelegates:  [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
        theme: appTheme,
        title: 'Posts App',
        // home: PostsPage(),
        home: TabBarViewScreen(),
      ),
    );
  }
}
