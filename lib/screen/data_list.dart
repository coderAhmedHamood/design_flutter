import 'package:flutter/material.dart';


class DataList extends StatefulWidget {
  @override
  DataLists createState() => DataLists();
}


class DataLists extends State<DataList> {


  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: GridView.count(
          crossAxisCount: 2, // عدد الأعمدة
          children: List.generate(8, (index) {
            return GestureDetector(
              onTap: () {
                // يتم تفعيل هذه الدالة عند الضغط على العنصر في الشاشة
              },
              child: Container(
                color: Colors.blueGrey,
                margin: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Go to page ${index + 1}', // النص المطلوب عرضه
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      );

  }
}