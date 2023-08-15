import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingDialog extends StatelessWidget {
  final String message;

  const LoadingDialog({ required Key key, this.message = 'Loading...'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      color:Colors.blue,
      size: 50.0,
    );
    // Dialog(
      // child:    SpinKitWave(
      //   color:Colors.blue,
      //   size: 50.0,
      // ),


      // child: Container(
      //   padding: EdgeInsets.all(20.0),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //
      //       SpinKitWave(
      //         color:Colors.blue,
      //         size: 50.0,
      //       ),
      //
      //       SpinKitFadingCircle(
      //         color:Colors.blue,
      //         size: 50.0,
      //       ),
      //       SpinKitThreeInOut(
      //         color:Colors.blue,
      //         size: 50.0,
      //       ),
      //       SpinKitRotatingCircle(
      //         color:Colors.blue,
      //         size: 50.0,
      //       ),
      //
      //       SpinKitPulse(
      //         color:Colors.blue,
      //         size: 50.0,
      //       ),
      //       SpinKitHourGlass(
      //         color:Colors.blue,
      //         size: 50.0,
      //       ),
      //
      //
      //
      //
      //       // SizedBox(height: 20.0),
      //       // Text(
      //       //   message,
      //       //   style: TextStyle(fontSize: 18.0),
      //       // ),
      //     ],
      //   ),
      // ),
    // );
  }
}
