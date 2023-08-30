// import 'package:flutter/material.dart';
//  import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../account/data/model/stor.dart';
// import '../../../../domain/entities/students_class_class.dart';
// import '../../../bloc/up_data_student/Student_event.dart';
// import '../../../bloc/get_data_student/parent_bloc.dart';
 
// class StudentClassListWidget extends StatelessWidget {
//   final List<StudentsClassClass> studentsClassClass =
//       UserData.teacherData!.classes;
//   StudentClassListWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: studentsClassClass.length,
//         itemBuilder: (context, index) {
//           final studentsClass = studentsClassClass[index];

//           return InkWell(
//             onTap: () {
//           UserData.setSubject(studentsClass.name);
//               BlocProvider.of<StudentBloc>(context)
//                   .add(GetStudentDataEvent(idClass: studentsClass.id!));
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => DashboardStudentScreen()));
//             },
//             child: Ink(
//               color: Colors.transparent,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 5,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           studentsClass.name,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




//   // return InkWell(
//   //           onTap: () {
//   //         print(studentsClass.id);
//   //              },
//   //           child: Ink(
//   //             color: Colors.transparent,
//   //             child: Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3.0),
//   //               child: Stack(
//   //                 children: [
//   //                   Container(
//   //                     decoration: BoxDecoration(
//   //                       color: Colors.blue.withOpacity(0.1),
//   //                       borderRadius: BorderRadius.circular(8.0),
//   //                       border: Border.all(
//   //                         color: Colors.blue,
//   //                         width: 0.5,
//   //                       ),
//   //                     ),
//   //                     child: ListTile(
//   //                       subtitle: 
//   //                     ),
//   //                   ),
//   //                 ],
//   //               ),
//   //             ),
//   //           ),
//   //         );


 
