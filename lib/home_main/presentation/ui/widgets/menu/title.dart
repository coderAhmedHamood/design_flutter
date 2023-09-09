import 'package:flutter/material.dart';

class TitleInMenu extends StatelessWidget {
  final String text;
  const TitleInMenu({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return   Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            );         
  }
}