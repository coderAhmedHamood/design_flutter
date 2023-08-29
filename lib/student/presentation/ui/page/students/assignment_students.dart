import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_design/student/presentation/bloc/up_data_student/Student_event.dart';
import 'package:flutter_design/student/presentation/ui/widgets/title_body.dart';
import '../../../../../account/data/model/stor.dart';
import '../../../../../base/alart.dart';
import '../../../../domain/entities/student.dart';
import '../../../bloc/up_data_student/student_bloc.dart';
import '../../../bloc/up_data_student/student_state.dart';

bool chickGetData = false; // تعريف المتغير خارج الصنف
List<StudentActivityClass> students = [];

class HomeWorkStudentsScreen extends StatefulWidget {
  @override
  State<HomeWorkStudentsScreen> createState() => _HomeWorkStudentsState();
}

class _HomeWorkStudentsState extends State<HomeWorkStudentsScreen> {
  void showGradeInputDialog(
      BuildContext context, String studentName, int index) {
    double grade = 0.0; // قيمة افتراضية للدرجة

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
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  // FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  print(value);
                  grade = double.tryParse(value) ?? 0.0;
                },
                decoration: InputDecoration(
                  hintText: 'أدخل الدرجة',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.end,
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
                        'إلغاء',
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
                        print(grade);
                        setState(() {
                          students[index].degreeHomeWork =
                              grade; // تحديث درجة الطالب باستخدام الفهرس
                        });
                        Navigator.of(context).pop(); // إغلاق الـ dialog
                      },
                      child: Text(
                        'موافق',
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
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {

        WidgetsBinding.instance.addPostFrameCallback((_) {
          final studentBloc =
              context.read<StudentBloc>(); // Obtain the bloc instance
          final state = studentBloc.state; // Obtain the current state
          if (state is MessageAddStudentsAssignmentState) {
            
            SnackbarService.showSuccessSnackbar(state.message);
            BlocProvider.of<StudentBloc>(context).add(
                ReloadStudentDataEvent()); 
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
          // backgroundColor: Colors,
          appBar: AppBar(
            title: Center(
              child: Text(
                'وضع درجات الواجبات ',
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
              TitleBodyWidget(title: "واجبات الصف "),
              SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          showGradeInputDialog(
                              context, students[index].name, index);
                        });
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                                      "الدرجة",
                                      style: TextStyle(
                                          // color: Colors.green,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      students[index].degreeHomeWork.toString(),
                                      style: TextStyle(
                                            color: students[index].degreeHomeWork > 15
                                            ? Colors.green
                                            : students[index].degreeHomeWork > 0 &&
                                                    students[index].degreeHomeWork < 15
                                                ? Colors.orange
                                                : Colors.red,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
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
              ),
            ],
          ),
          floatingActionButton: 
              students.any((student) => student.degreeHomeWork != 0.0)?
                FloatingActionButton(
                  onPressed: () {
                    List<StudentActivityClass> studentsWithDegree = students
                        .where((student) => student.degreeHomeWork != 0.0)
                        .toList();
                    BlocProvider.of<StudentBloc>(context).add(
                        AddStudentAssignmentEvent(
                            studentAssignment: studentsWithDegree));
                  },
                  child: Icon(Icons.upload),
                ):Container()
        );
      },
    );
  }

}
