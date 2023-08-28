import 'package:flutter/material.dart';

import '../../../../../account/data/model/stor.dart';
import '../../../../../base/alart.dart';
import '../../../../domain/entities/student.dart';
import '../../../bloc/up_data_student/Student_event.dart';
import '../../../bloc/up_data_student/student_bloc.dart';
import '../../../bloc/up_data_student/student_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool chickGetData = false; // تعريف المتغير خارج الصنف
List<StudentActivityClass> students = [];

class AttendanceStudentsScreen extends StatefulWidget {
  @override
  State<AttendanceStudentsScreen> createState() => _AttendanceStudentsState();
}

class _AttendanceStudentsState extends State<AttendanceStudentsScreen> {
  bool isAllPresent = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final studentBloc =
              context.read<StudentBloc>(); // Obtain the bloc instance
          final state = studentBloc.state; // Obtain the current state
          if (state is MessageAddStudentsAttendanceState) {
            SnackbarService.showSuccessSnackbar(state.message);
            BlocProvider.of<StudentBloc>(context).add(ReloadStudentDataEvent());
          }
        });

        if (state is LoadingStudentState) {
          chickGetData = false;
        }

        if (state is ReLoadedStudentsDataState) {
          students = state.studentActivity;
        }
        if (state is LoadedStudentsDataState) {
          if (!chickGetData) {
            print(state.studentActivity);
            students = state.studentActivity;
            chickGetData = true;
          }
        }
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
              WidgetTitleList(),
              WidgetList(),
            ],
          ),
        );
      },
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
                          Text(
                            "م",
                            style: TextStyle(
                                // backgroundColor: Colors.orange,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
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
                          Text(
                            "ح",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
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

  Widget WidgetTitleList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  width: 66,
                  //  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "م",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        "ح",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "اسم الطالب",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
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
              if (students.any((student) => student.isPresent))
                FloatingActionButton(
                  onPressed: () {
                    List<StudentActivityClass> presentStudents = students
                        .where((student) =>
                            student.isPresent == true || student.isSick == true)
                        .toList();

                    print(
                        "presentStudents screen    [[[[[[[[[[[[[[]]]]]]]]]]]]]]");
                    // print(presentStudents);
                    BlocProvider.of<StudentBloc>(context).add(
                        AddStudentAttendanceEvent(
                            studentAttendance: presentStudents));
                            
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
}
