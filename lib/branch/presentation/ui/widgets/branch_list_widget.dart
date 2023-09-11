import 'package:flutter/material.dart';
import '../../../../base/constants/my_colors.dart';
import '../../../domain/entities/branch.dart';

import '../../bloc/branch/branch_bloc.dart';
import '../branch/characters_screen.dart';
import '../branch/start.dart';
import '../branch/view_all_student_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BranchListWidget extends StatelessWidget {
  final List<Branch> branches;
  const BranchListWidget({
    Key? key,
    required this.branches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: branches.length,
      // itemCount: posts.length,
      itemBuilder: (context, index) {
        Branch branch = branches[index];

        return Container(
          margin: EdgeInsets.all(25),
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                color: MyColors.black,
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
                  color:
                      const Color.fromARGB(255, 177, 174, 174).withOpacity(.3),
                ),
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        branch.title,
                        style: TextStyle(
                          fontSize: 23,
                          color: MyColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        branch.location,
                        style: TextStyle(
                          fontSize: 17,
                          color: MyColors.black,
                          // fontWeight:FontWeight.bold,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<BranchBloc>().add(
                                    GetAllDataStudentEvent(
                                        idBranch: branch.id!),
                                  );
                          
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        // DataStudentsScreen(),
                                        // PageStartScreen(),
                                        ViewAllDataStudentScreen(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.school,
                                  color: Colors.blue,
                                  // size: 30,
                                ),
                                Text(
                                  'أوائل الفرع',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print(branch.id);
                              print(
                                  "OK   click on   ' مميزات الفرع'${branch.id!} ");
                              context.read<BranchBloc>().add(
                                    GetAllDataStudentEvent(
                                        idBranch: branch.id!),
                                  );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ViewAllDataStudentScreen(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.lightbulb, color: Colors.red),
                                Text(
                                  ' مميزات الفرع',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
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

  // void _showGradeInputDialog(BuildContext context, int index) async {
  //   final selectedBehaviour = await showDialog<List>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return ChooseOptionDialogScreen(idBranch: index);
  //     },
  //   );

  //   if (selectedBehaviour != null) {
  //     // تم تحديد التصنيف
  //     print(selectedBehaviour[0]);
  //     print(selectedBehaviour[1]);
  //     print(selectedBehaviour[2]);

  //     // setState(() {
  //     //   students[indexArray].behaviourStudentsClass = BehaviourStudentsClass(
  //     //       title: selectedBehaviour[1], message: selectedBehaviour[2]);
  //     // });

  //     // قم بمعالجة القيمة المختارة كما ترغب
  //   } else {
  //     // تم إلغاءالعملية
  //     print('Dialog Canceled');
  //     // قم بمعالجة الإلغاء كما ترغب
  //   }
  // }
}
