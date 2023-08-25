import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Color fillColor;
  final Icon prefixIcon;
  final String hintText;
  final double fontSize;
    final TextEditingController textEditingController;
  

  const CustomTextField({
    required this.fillColor,
    required this.prefixIcon,
    required this.hintText,
    required this.fontSize,
    required this.textEditingController,
    
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
           controller: textEditingController,
      decoration: InputDecoration(
           
        fillColor: fillColor,
        filled: true,
        prefixIcon: prefixIcon,
        hintText: hintText,
         
      ),
      style: TextStyle(fontSize: fontSize,
      ),
    );
  }

 
}