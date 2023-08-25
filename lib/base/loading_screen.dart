import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String text;

  LoadingScreen({required this.text});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _customDialog(context),
    );
  }

  // Widget _customDialog(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(10),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.5),
  //           spreadRadius: 2,
  //           blurRadius: 5,
  //           offset: Offset(0, 3),
  //         ),
  //       ],
  //     ),
  //     child: Padding(
  //       padding: EdgeInsets.all(20),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           CircularProgressIndicator(
  //             strokeWidth: 4,
  //             valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
  //           ),
  //           SizedBox(height: 20),
  //           Text(
  //             text,
  //             style: TextStyle(
  //               color: Colors.black,
  //               fontWeight: FontWeight.w600,
  //               fontSize: 16,
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

Widget _customDialog(BuildContext context) {
  return Center(
    child: Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   'assets/loading.gif',
          //   fit: BoxFit.cover,
          // ),
          SizedBox(height: 10),
          Text(
            'Loading...',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

  static void show(BuildContext context, String text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingScreen(text: text);
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }
}
