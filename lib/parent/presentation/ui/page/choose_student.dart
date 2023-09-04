import 'package:flutter/material.dart';
import 'package:flutter_design/parent/data/models/student_model.dart';
import 'package:flutter_design/parent/presentation/ui/page/dashboard_parents_screen.dart';
import '../../../../account/data/model/stor.dart';
 import '../widgets/title_page_two.dart';
 
 
 
class ChooseStudentScreen extends StatelessWidget {
    final List<StudentModel> studentClass =
      UserData.parentData!.studentName;
        late TabController _tabController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
              // TitleChooseStudent(),
              TitlePageTow(titlePage: 'اختيار الطالب لمعرفة بياناتة'),
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
                        // Navigator.pop(context,studentsClass.id!);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardScreen(studentsClass.id!),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 20,right: 10),
                        child: Container(
                          height: 100,
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
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage("assets/school.jpg"),
                                  // backgroundImage: AssetImage(studentsClass.imagePath),
                                ),
                                SizedBox(width: 10),
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
                        ),
                      ),
                    );
                  },
                ),
              );

}


 

}
