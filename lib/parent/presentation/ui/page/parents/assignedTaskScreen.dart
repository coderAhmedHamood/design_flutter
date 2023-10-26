import 'package:flutter/material.dart';
 

import '../../widgets/table_page.dart';
import '../../widgets/table_page_task.dart';
import '../../widgets/title_page.dart';
 
 

class assignedTaskScreen extends StatelessWidget {
 
  // // List<String> columnNames = ['يوم', 'القرآن', 'التربية الاسلامية'];
 
  late bool chickIndex = false;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5),
                TitlePage(titlePage:"كشف الواجب المكلف"),
                SizedBox(height: 10),
                WidgetDataTable(),
              ],
            ),
          ),
        );
  }

  Widget WidgetDataTable() {
 

    return Container(
      child: Column(
        children: [

        TablePageTask(pageName: "Assignment", ),
        // TablePage(pageName: "AssignmentTask", ),
       
         ],
      ),
    );
  }

 

}
