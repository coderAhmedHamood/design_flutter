import 'package:flutter/material.dart';
import 'package:flutter_design/student/presentation/ui/widgets/student_class.dart';

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
            // crossAxisAlignment: CrossAxisAlignment.ar,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
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
              ),
              SizedBox(
                height: 40,
              ),
              
              //           BlocBuilder<StudentBloc, StudentState>(
              //   builder: (context, state) {
              //     if (state is LoadedStudentsState) {
              //       print("mMMMMMMMMMooooooooooooooMMMMMMMMMMMMM");
              //       studentsClassClass = state.studentsClassClass;
              //     }
              //     return ListView.builder(
              //       itemCount: studentsClassClass.length,
              //       itemBuilder: (context, index) {
              //         StudentsClassClass studentClass = studentsClassClass[index];
              //         return GestureDetector(
              //           onTap: () {
              //             print(studentClass.id);
              //             // Handle the event or perform any other actions
              //           },
              //           child: Container(
              //             height: 60,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(15),
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: Colors.black.withOpacity(0.2),
              //                   blurRadius: 5,
              //                   offset: Offset(0, 3),
              //                 ),
              //               ],
              //             ),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text(
              //                   studentClass.name,
              //                   style: TextStyle(
              //                     fontSize: 20,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),

              WidgetRowClass(),
            ],
          ),
        ),
      ),
    );
  }

  Widget WidgetRowClass() {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state is LoadedStudentsState) {
           print(",,,,,,,,,,kkKKkkKKKkk,,,,,,,,,");
           studentsClass = state.studentsClassClass;
           print(studentsClass);
           print(",,,,,,,,,,kkKKkkKKKkk,,,,,,,,,");
         }
        return StudentClassListWidget(studentsClassClass: studentsClass);
     
      },
    );
  }
 

//   Widget WidgetRowClass( BuildContext context, String text){
//       return GestureDetector(
//     onTap: () {
//     // print(id);
//    // معالجة خطأ عند فشل استدعاء الحدث أو تنفيذه

// },
//     child: Container(
//            height: 60,
//            decoration: BoxDecoration(
//              // color: Colors.white,
//              color: Colors.white, borderRadius: BorderRadius.circular(15),
//              boxShadow: [
//                BoxShadow(
//                  color: Colors.black.withOpacity(0.2),
//                  blurRadius: 5,
//                  offset: Offset(0, 3),
//                ),
//              ],
//            ),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              // crossAxisAlignment: CrossAxisAlignment.end,
//              children: [
//                Text(
//                  text,
//                  style: TextStyle(
//                    fontSize: 20,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//              ],
//            ),
//          )

//   );}
}
