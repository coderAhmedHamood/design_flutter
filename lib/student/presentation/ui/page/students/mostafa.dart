import 'package:flutter/material.dart';

import '../../../../../account/data/model/stor.dart';

import '../../widgets/WidgetTitleList.dart';




import 'package:equatable/equatable.dart';

import '../../widgets/mostafa.dart';

class StudentActivityClass extends Equatable {
  int id;
  String name;
  bool isPresent;
  bool isSick;
  String stateHomeWork;
  double degreeMonthTest;
  
  StudentActivityClass({
    required this.id,
    required this.name,
    required this.isPresent,
    required this.isSick,
    required this.stateHomeWork,
    required this.degreeMonthTest,
      
  });
  @override
  List<Object?> get props => [id, name,isPresent,isSick,stateHomeWork,degreeMonthTest];
}


List<StudentActivityClass> students = [
  StudentActivityClass(
    id: 1,
    name: "John",
    isPresent: true,
    isSick: false,
    stateHomeWork: "Completed",
    degreeMonthTest: 95.0,
    
  ),
  StudentActivityClass(
    id: 2,
    name: "Emily",
    isPresent: false,
    isSick: true,
    stateHomeWork: "Incomplete",
    degreeMonthTest: 80.0,
    
  ),
  StudentActivityClass(
    id: 2,
    name: "Emily",
    isPresent: false,
    isSick: true,
    stateHomeWork: "Incomplete",
    degreeMonthTest: 80.0,
    
  ),
  StudentActivityClass(
    id: 2,
    name: "Emily",
    isPresent: false,
    isSick: true,
    stateHomeWork: "Incomplete",
    degreeMonthTest: 80.0,
    
  ),
  // يمكنك إضافة المزيد من البيانات حسب الحاجة
];


class AttendanceStudentsScreenWW extends StatefulWidget {
  @override
  State<AttendanceStudentsScreenWW> createState() => _AttendanceStudentsState();
}

class _AttendanceStudentsState extends State<AttendanceStudentsScreenWW> {
  bool isAllPresent = false;

  @override
  Widget build(BuildContext context) {
 
        
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'تحضير الطلاب يوم الثلاثاء',
                style: TextStyle(color: Colors.white),
              ),
            ),
            leading: IconButton(
              iconSize: 40,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // context.pop(),
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Column(
            children: [
              // SizedBox(height: 50,),
              titleBody(),

              SizedBox(
                height: 5,
              ),
              WidgetTitleListWW(),
              WidgetList(),
            ],
          ),
        );
      
  }

  Widget titleBody() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 22, 153, 98),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'تحضير الصف ${UserData.className} ',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            UserData.teacherData!.subject,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    for (var student in students) {
                      student.isPresent = !isAllPresent;
                      student.isSick = false;
                    }
                    isAllPresent = !isAllPresent;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isAllPresent
                        ? Colors.green
                        : Color.fromARGB(255, 0, 118, 214),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        isAllPresent ? 'إلغاء' : 'تحديد',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        isAllPresent
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              if (students.any((student) => student.isPresent||students.any((student) => student.isSick)))
                FloatingActionButton(
                  onPressed: () {
                    List<StudentActivityClass> presentStudents = students
                        .where((student) =>
                            student.isPresent == true || student.isSick == true)
                        .toList();
                    // هنا اطبع بيانات الطلاب الذين هم حاضرين ام لا  طبعا عند الضغط على زر التحضير اي رفع البيانات 
                    print(presentStudents);
                            
                  },
                  child: Icon(Icons.upload),
                ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }


  Widget WidgetList() {
    return Expanded(
      child: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                students[index].isPresent = !students[index].isPresent;
                students[index].isSick = false;
              });
            },
            child: Container(
              // height: 80,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          // Text(
                          //   "م",
                          //   style: TextStyle(
                          //       // backgroundColor: Colors.orange,
                          //       fontSize: 15,
                          //       fontWeight: FontWeight.bold),
                          //   textAlign: TextAlign.right,
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            //  checkColor: Colors.white,
                            value: students[index].isSick,
                            onChanged: (value) {
                              setState(() {
                                students[index].isSick = value!;
                                students[index].isPresent = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          // Text(
                          //   "ح",
                          //   style: TextStyle(
                          //       fontSize: 15, fontWeight: FontWeight.bold),
                          //   textAlign: TextAlign.right,
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: students[index].isPresent,
                            onChanged: (value) {
                              setState(() {
                                students[index].isPresent = value!;
                                students[index].isSick = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Text(
                      students[index].name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
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
