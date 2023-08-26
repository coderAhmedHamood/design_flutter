

import 'package:flutter/material.dart';
import 'package:flutter_design/student/domain/entities/student.dart';

class StudentClassListWidget extends StatelessWidget {
  final List<StudentsClassClass> studentsClassClass;
  StudentClassListWidget({
    Key? key,
    required this.studentsClassClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: studentsClassClass.length,
        itemBuilder: (context, index) {
          final studentsClass = studentsClassClass[index];

       
          return InkWell(
            onTap: () {
          print(studentsClass.id);
               },
            child: Ink(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(height: 15,),
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




  // return InkWell(
  //           onTap: () {
  //         print(studentsClass.id);
  //              },
  //           child: Ink(
  //             color: Colors.transparent,
  //             child: Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 3.0),
  //               child: Stack(
  //                 children: [
  //                   Container(
  //                     decoration: BoxDecoration(
  //                       color: Colors.blue.withOpacity(0.1),
  //                       borderRadius: BorderRadius.circular(8.0),
  //                       border: Border.all(
  //                         color: Colors.blue,
  //                         width: 0.5,
  //                       ),
  //                     ),
  //                     child: ListTile(
  //                       subtitle: 
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );




// Container(
//                           height: 60,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.2),
//                                 blurRadius: 5,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 studentsClass.name,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),


