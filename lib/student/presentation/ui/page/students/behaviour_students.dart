
import 'package:flutter/material.dart';
import 'package:flutter_design/student/presentation/ui/widgets/title_body.dart';

import '../../../../../account/data/model/stor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/alart.dart';
import '../../../../domain/entities/student.dart';
import '../../../bloc/up_data_student/Student_event.dart';
import '../../../bloc/up_data_student/student_bloc.dart';
import '../../../bloc/up_data_student/student_state.dart';

bool chickGetData = false; // تعريف المتغير خارج الصنف
List<StudentActivityClass> students = [];
class BehaviourStudentsScreen extends StatefulWidget {
  @override
  State<BehaviourStudentsScreen> createState() => _BehaviourStudentsState();
}

class _BehaviourStudentsState extends State<BehaviourStudentsScreen> {
 
 
  void showGradeInputDialog(
      BuildContext context, String studentName, int index) {
 
    int selectedGrade = 1; // القيمة المختارة الافتراضية
      BehaviourStudentsClass defaultBehaviour = BehaviourStudentsClass(
    title: "Title behavior",
    message: "Message behavior",
  );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    studentName,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              RadioListTile(
                title: Text('Grade 1'), // درجة 1
                value: 1,
                groupValue: selectedGrade,
                onChanged: (value) {
                  //  selectedGrade = ;
                  setState(() {
                    print(value);
                  });
                },
              ),
              RadioListTile(
                title: Text('Grade 2'), // درجة 2
                value: 2,
                groupValue: selectedGrade,
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      // Check if value is not null
                      selectedGrade = value;
                    }
                  });
                },
              ),
              RadioListTile(
                title: Text('Grade 3'), // درجة 3
                value: 3,
                groupValue: selectedGrade,
                onChanged: (value) {
                  setState(() {
                    print(value);
                  });
                },
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: TextButton(
                      onPressed: () {
                        print("cancel");
                        Navigator.of(context).pop(); // إغلاق الـ dialog
                      },
                      child: Text(
                        'Cancel', // إلغاء
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: TextButton(
                      onPressed: () {
                        print("accept");
                        defaultBehaviour.message = "اضبطوة ";
                        defaultBehaviour.title = "تحذير";
                        students[index].behaviourStudentsClass=defaultBehaviour;
                        print('Grade: $selectedGrade');
                        print(defaultBehaviour.message);
                        print(defaultBehaviour.title);

                        // print('DefaultBehaviour: $defaultBehaviour');
                        // قم بإرسال الدرجة إلى الأماكن التي ترغب فيها
                        Navigator.of(context).pop(); // إغلاق الـ dialog
                      },
                      child: Text(
                        'Submit', // إرسال
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
       return BlocBuilder<StudentBloc, StudentState>(builder: (context, state) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final studentBloc =
            context.read<StudentBloc>(); // Obtain the bloc instance
        final state = studentBloc.state; // Obtain the current state
        if (state is MessageStudentMonthlyTestState) {
        
          SnackbarService.showSuccessSnackbar(state.message);
       
          BlocProvider.of<StudentBloc>(context).add(ReloadStudentDataEvent());
        }
      });

      if (state is ReLoadedStudentsDataState) {
        students = state.studentActivity;
      }
      if (state is LoadingStudentState) {
        chickGetData = false;
      }

      if (state is LoadedStudentsDataState) {
        if (!chickGetData) {
          students = state.studentActivity;
          chickGetData = true;
        }
      }
    
    return Scaffold(
      appBar: AppBar(
       
        leading: IconButton(
          iconSize: 40,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          TitleBodyWidget(title: "سلوك الصف "),
          SizedBox(
            height: 5,
          ),
          WidgetListNotification()
        ],
      ),
    );
  
  }
  );
  }



Widget WidgetListNotification(){
  return    Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      showGradeInputDialog(
                          context, students[index].name, index);
                    });
                    print("||||||||||||||||||||");
                    print(students[index].behaviourStudentsClass?.message);
                    print(students[index].behaviourStudentsClass?.title);
                    print("||||||||||||||||||||");
                  },
                  child: Container(
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
                        Row(
                          children: [
                            Icon(
                              Icons.notification_add,
                              size: 30, // Set the size of the icon
                              color: Colors.blue,
                            )
                          ],
                        ),
                        Expanded(
                          child: Text(
                            students[index].name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
