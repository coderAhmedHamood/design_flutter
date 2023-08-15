import 'package:flutter/material.dart';
import 'dart:math' as math;

class PageGpt extends StatefulWidget {
  @override
  PageGpts createState() => PageGpts();
}


class PageGpts extends State<PageGpt> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: Center(
          child: CustomPaint(
            size: Size(300, 300),
            painter: SpiralPainter(),
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.all(8.0),
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(
                      'Item ${index + 1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

    );
  }
}

class SpiralPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.grey;
    canvas.drawPaint(paint);

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    double radius = 0;
    double angle = 0;

    for (int i = 0; i < 20; i++) {
      radius += 20;
      angle += math.pi / 8;
      double x = centerX + radius * math.cos(angle);
      double y = centerY + radius * math.sin(angle);

      canvas.drawCircle(Offset(x, y), 10, Paint()..color = Colors.blue);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}