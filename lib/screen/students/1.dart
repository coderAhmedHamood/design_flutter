import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screen1/home/home_screen.dart';

import '../parents/DashboardScreen.dart';
import 'behaviour_students.dart';
import 'degree_students.dart';
import 'homework_students.dart';

class ListPresentStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(DashboardScreen());
                                // Get.toNamed("/login");
                              },
                              child: Text("Dashboard Screen"),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed("/register");
                                // Get.to(RegisterScreen());
                              },
                              child: Text("......"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Get.to(LoginScreen());
                                Get.toNamed("/login");
                              },
                              child: Text("Login screen"),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed("/register");
                                // Get.to(RegisterScreen());
                              },
                              child: Text("Register screen"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Get.to(LoginScreen());
                                Get.toNamed("/city");
                              },
                              child: Text("city view"),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed("/notifications");
                                // Get.to(RegisterScreen());
                              },
                              child: Text("Notification "),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Get.to(PreparingStudents());
                                Get.toNamed("/present_student");
                              },
                              child: Text("List Preparing the Students"),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(DegreeTestStudents());
                              },
                              child: Text("list Degree The student"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(BehaviourStudents());
                              },
                              child: Text("list Behaviour student"),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(HomeWorkStudents());
                              },
                              child: Text("list homework student"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(HomePageDesign());
                              },
                              child: Text("الصفحة الرئيسية"),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(HomeWorkStudents());
                              },
                              child: Text("list homework student"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
