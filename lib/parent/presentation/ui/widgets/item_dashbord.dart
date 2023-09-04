
import 'package:flutter/material.dart';

class ItemDashbord extends StatelessWidget {
  const ItemDashbord({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 120,
    margin: EdgeInsets.only(left: 0, right: 0, top: 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 93, 117, 236),
          Color.fromARGB(255, 0, 146, 255),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/school.jpg"),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "person.name",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Age: person.age',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );


  }
}