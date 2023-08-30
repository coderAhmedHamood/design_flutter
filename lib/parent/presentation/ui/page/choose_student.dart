import 'package:flutter/material.dart';
import 'package:flutter_design/parent/presentation/ui/page/dashboard_parents_screen.dart';
import '../../../../account/data/model/stor.dart';
import '../../../../screen/tabbar/tabbar.dart';
import '../../../domain/entities/Student.dart';
 import '../widgets/title_choose_studen.dart';
 
 
 
class ChooseStudentScreen extends StatelessWidget {
    final List<StudentClass> studentClass =
      UserData.parentData!.studentName;
        late TabController _tabController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // appBar: CustomTabBar(tabController: TabController(length: 5,)),
      backgroundColor: Color.fromARGB(255, 240, 247, 247),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 40, right: 40),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              TitleChooseStudent(),
              SizedBox(height: 40),
              StudentViewListWidget(),
             ],
          ),
        ),
      ),
    );
  }
Widget StudentViewListWidget(){
  return Expanded(
      child: ListView.builder(
        itemCount: studentClass.length,
        itemBuilder: (context, index) {
          final studentsClass = studentClass[index];

          return InkWell(
            onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardScreen(studentsClass.id!) ));
            },
            child: Ink(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          studentsClass.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

}
 
}
