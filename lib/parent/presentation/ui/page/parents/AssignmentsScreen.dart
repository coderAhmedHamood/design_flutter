import 'package:flutter/material.dart';
 

import '../../widgets/table_page.dart';
import '../../widgets/title_page.dart';
 
 

class AssignmentsStudentViewScreen extends StatelessWidget {
 
  // // List<String> columnNames = ['يوم', 'القرآن', 'التربية الاسلامية'];
 
  late bool chickIndex = false;

  @override
  Widget build(BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  TitlePage(titlePage:"كشف واجبات الطالب"),
                  SizedBox(height: 10),
                  WidgetDataTable(),
                ],
              ),
            ),
          ),
        );
  }

  Widget WidgetDataTable() {
 

    return Container(
      child: Column(
        children: [

        TablePage(pageName: "Assignment", ),
       
         ],
      ),
    );
  }

 

}
