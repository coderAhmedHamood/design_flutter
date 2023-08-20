// import 'package:flutter/material.dart';


 
// class Product extends StatefulWidget {
//   @override
//   _ProductState createState() => _ProductState();
// }

// class _ProductState extends State<Product> with SingleTickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('الصفحة الرئيسية'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [Colors.red, Colors.blue],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           'منتج $index',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'سعر: 100 دولار',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             IconButton(
//                               icon: Icon(Icons.favorite_border),
//                               onPressed: () {},
//                             ),
//                             ElevatedButton(
//                               child: Text('إضافة إلى السلة'),
//                               onPressed: () {
//                                 showDialog(
//                                   context: context,
//                                   barrierDismissible: false,
//                                   builder: (BuildContext context) {
//                                     return LoadingDialog(key: UniqueKey());
//                                   },
//                                 );
//                               },
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
