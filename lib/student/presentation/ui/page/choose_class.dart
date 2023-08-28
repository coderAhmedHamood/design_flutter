import 'package:flutter/material.dart';
import 'package:flutter_design/student/presentation/ui/widgets/choose_class.dart';

import '../../../domain/entities/student.dart';
import '../../bloc/up_data_student/student_bloc.dart';
import '../../bloc/up_data_student/student_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseClassScreen extends StatelessWidget {
  List<StudentsClassClass> studentsClass = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              _WidgetTitle(),
              SizedBox(height: 40),
              WidgetRowClass(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _WidgetTitle() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 99, 212, 99),
              // Color.fromARGB(255, 37, 179, 169),
              Color.fromARGB(255, 97, 219, 119)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.9],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(84),
            bottomRight: Radius.circular(84),
            // topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0, 7),
              blurRadius: 4,
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'اختار الصف الدراسي',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget WidgetRowClass() {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state is LoadedStudentsState) {
          studentsClass = state.studentsClassClass;
        }
        return StudentClassListWidget(studentsClassClass: studentsClass);
      },
    );
  }
}
