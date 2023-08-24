import '../../../../../constants/my_colors.dart';
 import 'package:flutter/material.dart';

import '../../../domain/entities/branch.dart';

 
class BranchListWidget extends StatelessWidget {
  final List<Branch> branches;
  const BranchListWidget({
    Key? key,
    required this.branches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
            itemCount: branches.length,
            // itemCount: posts.length,
            itemBuilder: (context, index) {
              Branch branch = branches[index];
              
              // return buildPost(context, index);
               return Container(
      margin: EdgeInsets.all(25),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            color: Colors.black,
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage(branch.imageUrl),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Colors.white.withOpacity(.5),
            ),
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    branch.title,
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    branch.location,
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '❤ ${branch.likes}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
 
            },
          );
      
 
  }
}
