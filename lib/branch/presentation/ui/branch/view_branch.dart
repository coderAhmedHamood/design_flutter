import 'package:flutter/material.dart';

 import '../../../domain/entities/branch.dart';
import '../../bloc/branch/branch_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/branch_list_widget.dart';
class BranchScreen extends StatefulWidget {
  @override
  _BranchScreenState createState() => _BranchScreenState();
}

class _BranchScreenState extends State<StatefulWidget> {
  List<Branch> branches=[];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchBloc, BranchState>(
      builder: (context, state) {
        if (state is LoadedBranchState) {
          print("branchhhhhhhhhh");
          branches = state.branch;
        }
        return Container(
          color: Color.fromRGBO(209, 207, 207, 1),
          child: 
      BranchListWidget(branches: branches),
        );
      },
    );
  }

  // Widget buildPost(BuildContext context, int index) {
  //   Branch branchs = branch[index];
  //   return Container(
  //     margin: EdgeInsets.all(25),
  //     height: 300,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(15),
  //       boxShadow: [
  //         BoxShadow(
  //           offset: Offset(2, 2),
  //           color: Colors.black,
  //           blurRadius: 5,
  //         ),
  //       ],
  //     ),
  //     child: Stack(
  //       alignment: AlignmentDirectional.bottomCenter,
  //       children: [
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(15),
  //           child: Image(
  //             image: AssetImage(post.imageUrl),
  //             fit: BoxFit.cover,
  //             height: double.infinity,
  //             width: double.infinity,
  //           ),
  //         ),
  //         Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //               bottomLeft: Radius.circular(15),
  //               bottomRight: Radius.circular(15),
  //             ),
  //             color: Colors.white.withOpacity(.5),
  //           ),
  //           height: 120,
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               // mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Text(
  //                   post.title,
  //                   style: TextStyle(
  //                     fontSize: 23,
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //                 Text(
  //                   post.location,
  //                   style: TextStyle(
  //                     fontSize: 21,
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     Text(
  //                       '❤ ${post.likes}',
  //                       style: TextStyle(
  //                         fontSize: 20,
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

//// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new
