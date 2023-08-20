import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen1/home/home_Tabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

          // colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 167, 100)),
          // useMaterial3: true,
          ),
      home: TabBarViewScreen(),
    );
  }
}
