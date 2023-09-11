// import 'package:flutter/material.dart';

// class SelectionScreen extends StatefulWidget {
//   @override
//   _SelectionScreenState createState() => _SelectionScreenState();
// }

// class _SelectionScreenState extends State<SelectionScreen> {
//   bool isAllPresent = false;

//   void toggleSelection() {
//     setState(() {
//       if (isAllPresent) {
//         for (var student in students) {
//           student.stateHomeWork = "غير مسلم";
//         }
//       } else {
//         for (var student in students) {
//           student.stateHomeWork = "مسلم";
//         }
//       }
//       isAllPresent = !isAllPresent;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: toggleSelection,
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//           child: Row(
//             children: [
//               Icon(
//                 isAllPresent ? Icons.check_box : Icons.check_box_outline_blank,
//                 color: Colors.black,
//               ),
//               Text(
//                 isAllPresent ? 'إلغاء' : 'تحديد',
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(width: 8),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }