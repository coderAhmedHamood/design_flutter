// import 'package:flutter/material.dart';

// class Table extends StatelessWidget {
//  final Student student;

//   Table({required this.student});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تقرير الطالب الشهري'),
//       ),
//       body: Table(
//         border: TableBorder.all(),
//         children: [
//           TableRow(
//             children: [
//               TableCell(
//                 child: Text('التاريخ'),
//               ),
//               TableCell(
//                 child: Text('الحضور'),
//               ),
//               TableCell(
//                 child: Text('الغياب'),
//               ),
//               TableCell(
//                 child: Text('السلوك'),
//               ),
//               TableCell(
//                 child: Text('درجة الواجبات'),
//               ),
//             ],
//           ),
//           for (var entry in student.monthlyReport.entries)
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Text(entry.key), // التاريخ
//                 ),
//                 TableCell(
//                   child: Text(entry.value.attendance), // الحضور
//                 ),
//                 TableCell(
//                   child: Text(entry.value.absence), // الغياب
//                 ),
//                 TableCell(
//                   child: Text(entry.value.behavior), // السلوك
//                 ),
//                 TableCell(
//                   child: Text(entry.value.homeworkGrade), // درجة الواجبات
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }
