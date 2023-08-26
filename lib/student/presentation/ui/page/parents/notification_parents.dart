// import 'package:flutter/material.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

// class CustomNotification {
//   final IconData icon;
//   final Color iconBackgroundColor;
//   final String title;
//   final String message;
//   final String date;

//   CustomNotification({
//     required this.icon,
//     required this.iconBackgroundColor,
//     required this.title,  required this.message,
//     required this.date,
//   });
// }

// final List<CustomNotification> notifications = [
//   CustomNotification(
//     icon: Icons.info,
//     iconBackgroundColor: Colors.blue,
//     title: 'عنوان الإشعار الأول',
//     message:
//         'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
//     date: '13 أغسطس 2023',
//   ),
//   CustomNotification(
//     icon: Icons.warning,
//     iconBackgroundColor: Colors.orange,
//     title: 'عنوان الإشعار الثاني',
//     message:
//         'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
//     date: '12 أغسطس 2023',
//   ),
//   CustomNotification(
//     icon: Icons.error,
//     iconBackgroundColor: Colors.red,
//     title: 'عنوان الإشعار الثالث',
//     message:
//         'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
//     date: '11 أغسطس 2023',
//   ),
//   CustomNotification(
//     icon: Icons.error,
//     iconBackgroundColor: Colors.red,
//     title: 'عنوان الإشعار الثالث',
//     message:
//         'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
//     date: '11 أغسطس 2023',
//   ),
//   CustomNotification(
//     icon: Icons.error,
//     iconBackgroundColor: Colors.red,
//     title: 'عنوان الإشعار الثالث',
//     message:
//         'نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا. نص الإشعار الثاني يظهر هنا.',
//     date: '11 أغسطس 2023',
//   ),
// ];

// class NotificationsPage extends StatelessWidget {
//   void showGradeInputDialog(
//       BuildContext context, String title, String message) {
//     Alert(
//       context: context,
//       type: AlertType.error,
//       title: title,
//       desc: message,
//       buttons: [
//         DialogButton(
//           child: Text(
//             "موافق",
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//           onPressed: () => Navigator.pop(context),
//           width: 120,
//         )
//       ],
//     ).show();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Color.fromARGB(255, 255, 252, 252),
//         appBar: AppBar(
//           title: Text(' الإشعارات'),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 3),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 height: 100,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(255, 19, 194, 45),
//                       // Color.fromARGB(255, 37, 179, 169),
//                       Color.fromARGB(255, 4, 255, 209)
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     stops: [0.1, 0.9],
//                   ),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     topRight: Radius.circular(24),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       offset: Offset(0, 7),
//                       blurRadius: 4,
//                     ),
//                   ],
//                 ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       'مدارس العربية السعيدة',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 4),
//             WidgetListView(),

//          WidgetNots(),  ],
//         ),
//       ),
//     );
//   }

//   Widget WidgetListView() {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: notifications.length,
//         itemBuilder: (context, index) {
//           final notification = notifications[index];
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
//             child: Card(
//               elevation: 2,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Container(
//                 color: Color.fromARGB(255, 243, 243, 170),
//                 child: ListTile(
//                   contentPadding: EdgeInsets.all(16),
//                   leading: CircleAvatar(
//                     backgroundColor: notification.iconBackgroundColor,
//                     child: Icon(
//                       notification.icon,
//                       color: Colors.white,
//                     ),
//                   ),
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           notification.title,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                           textAlign: TextAlign.right,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 8, 254, 110),
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         child: Text(
//                           'جديد',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 8),
//                       Text(
//                         notification.message,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                         textAlign: TextAlign.right,
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         notification.date,
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 222, 3, 3),
//                           fontSize: 12,
//                         ),
//                         textAlign: TextAlign.right,
//                       ),
//                     ],
//                   ),
//                   trailing: Icon(
//                     Icons.arrow_forward,
//                     color: Colors.grey[500],
//                   ),
//                   onTap: () {
//                     print("ok ..........ok print showdialog");
//                     showGradeInputDialog(
//                         context, notification.title, notification.message);
//                   },
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

// Widget WidgetNots(){
//   return    Container(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 gradient: LinearGradient(
//                   colors: [
//            Color.fromARGB(255, 207, 245, 176),
//         Colors.greenAccent,
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     offset: Offset(0, 2),
//                     blurRadius: 4,
//                   ),
//                 ],
//               ),
//               child: Transform(
//                 transform: Matrix4.skewX(-0.3),
//                 child: Container(
//                   padding: EdgeInsets.only(left: 8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.white,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.lightbulb,
//                         color: Colors.yellow[800],
//                         size: 24,
//                       ),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           'نصيحة مهمة!\n يُنصح دائمًا بالتواصل المستمر معنا للحفاظ على تحديثات أبنائكم المستمرة',
//                           textAlign: TextAlign.right,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 16),
//                     ],
//                   ),
//                 ),
//               ),
//             );
        
// }
// }
