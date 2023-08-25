import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final double letterSpacing;
  final FontWeight fontWeight;

  const CustomText({
    required this.text,
    required this.fontSize,
    required this.color,
    required this.letterSpacing,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontFamily: 'Arabic',
      
      ),
    );
  }
}