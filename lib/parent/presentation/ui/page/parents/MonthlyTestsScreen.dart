import 'package:flutter/material.dart';
import '../../widgets/table_page.dart';
import '../../widgets/title_page.dart';

 

class MonthlyTestsStudentViewScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(height: 5),
              TitlePage(titlePage: 'درجات الاختبار الشهرية للطالب'),
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
TablePage(pageName: "MonthlyTest", ),

        ],
      ),
    );
  }

}
