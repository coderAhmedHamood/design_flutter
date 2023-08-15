import 'package:flutter/material.dart';
import 'package:flutter_design/screen/students/1.dart';
import 'package:get/get.dart';

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
      home:   ListPresentStudent(),
    );
  }
}

