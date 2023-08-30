import 'package:flutter/material.dart';
import 'package:flutter_design/student/presentation/ui/widgets/student/title_body.dart';

import '../../../../../account/data/model/stor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/alart.dart';
import '../../../../domain/entities/behaviour_students_class.dart';
import '../../../../domain/entities/student.dart';
import '../../../../domain/entities/student_activity_class.dart';
import '../../../bloc/up_data_student/Student_event.dart';
import '../../../bloc/up_data_student/student_bloc.dart';
import '../../../bloc/up_data_student/student_state.dart';
import '../../widgets/student/alert.dart';

bool chickGetData = false; // تعريف المتغير خارج الصنف
List<StudentActivityClass> students = [];

class BehaviourStudentsScreen extends StatefulWidget {
  @override
  State<BehaviourStudentsScreen> createState() => _BehaviourStudentsState();
}

int selectedGrade = 1; // القيمة المختارة الافتراضية
class _BehaviourStudentsState extends State<BehaviourStudentsScreen> {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<StudentBloc, StudentState>(builder: (context, state) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final studentBloc =
            context.read<StudentBloc>(); // Obtain the bloc instance
        final state = studentBloc.state; // Obtain the current state
        if (state is MessageAddStudentBehaviourState) {
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
      
            floatingActionButton: 
            students.any((student) => student.behaviourStudentsClass!=null)?
                FloatingActionButton(
                  onPressed: () {
                    List<StudentActivityClass> studentsBehavior = students
                        .where((student) => student.behaviourStudentsClass != null)
                        .toList();                 
                    BlocProvider.of<StudentBloc>(context).add(
                        AddStudentBehaviorDataEvent(
                            studentBehavior: studentsBehavior));
                  },
                  child: Icon(Icons.upload),
                ):Container()

      );
    });
  }

  Widget WidgetListNotification() {
    return Expanded(
      child: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
                 _showGradeInputDialog(context,students[index].name,index);
              // setState(() {
              //   // showGradeInputDialog(context, students[index].name, index);
              // });
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
                        color:students[index].behaviourStudentsClass!=null? Colors.red: Colors.blue,
                      )
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

  void _showGradeInputDialog(BuildContext context,String studentName,int indexArray) async {
    final selectedBehaviour = await showDialog<List>(
      context: context,
      builder: (BuildContext context) {
        return GradeInputDialogScreen(
          studentName: studentName,
        );
      },
    );

    if (selectedBehaviour != null) {
      // تم تحديد التصنيف
      print(selectedBehaviour[0]);
      print(selectedBehaviour[1]);
      print(selectedBehaviour[2]);
     
                                setState(() {
                                   students[indexArray].behaviourStudentsClass =
                            BehaviourStudentsClass(
                                title: selectedBehaviour[1],
                                message: selectedBehaviour[2]);
                                });

      // قم بمعالجة القيمة المختارة كما ترغب
    } else {
      // تم إلغاءالعملية
      print('Dialog Canceled');
      // قم بمعالجة الإلغاء كما ترغب
    }
  }



}


