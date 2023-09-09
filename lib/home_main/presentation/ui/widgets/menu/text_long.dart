// import 'package:flutter/material.dart';

// import '../../../../../base/constants/my_colors.dart';

// class TextLongInMenu extends StatelessWidget {
//   const TextLongInMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//        return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(
//               onPressed: () {
//                 context.read<AccountBloc>().add(LogoutEvent());
//               },
//               child: Text(
//                 "تسجيل الخروج",
//                 style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold,
//                     color: MyColors.black),
//               ),
//             ),
//           ],
//         );
//   }
// }