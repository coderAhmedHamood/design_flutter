import 'package:flutter/material.dart';

import '../screen/login_screen.dart';

class PageChickLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetEles(context),
    );
  }
}

Widget WidgetEles(BuildContext context) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/school.jpg',
          fit: BoxFit.cover,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                'تسجيل الدخول',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}