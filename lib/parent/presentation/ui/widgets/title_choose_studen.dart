import 'package:flutter/material.dart';

class TitleChooseStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        // height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 99, 212, 99),
              Color.fromARGB(255, 97, 219, 119)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.9],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(84),
            bottomRight: Radius.circular(84),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0, 7),
              blurRadius: 4,
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'اختيار الطالب لمعرفة بياناتة',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}