
import 'package:flutter/material.dart';

import '../../../../../base/constants/my_colors.dart';


class MenuItem extends StatelessWidget {
  final String text;
  final Function onPressed;

  const MenuItem({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: TextButton(
          onPressed: onPressed as void Function()?,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: MyColors.black,
            ),
          ),
        ),
      ),
    );
  }
}