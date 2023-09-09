import 'package:flutter/material.dart';

import '../../bloc/branch/branch_bloc.dart';
import '../branch/view_all_student_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseOptionDialogScreen extends StatefulWidget {
  final int idBranch;
  ChooseOptionDialogScreen({required this.idBranch});
  @override
  _GradeInputDialogScreenState createState() => _GradeInputDialogScreenState();
}

class _GradeInputDialogScreenState extends State<ChooseOptionDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'اختر إجراء',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                context.read<BranchBloc>().add(
                      GetAllDataStudentEvent(idBranch: widget.idBranch),
                    );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAllDataStudentScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.accessible_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      ' مميزات الفرع',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                context.read<BranchBloc>().add(
                      GetAllDataStudentEvent(idBranch: widget.idBranch),
                    );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAllDataStudentScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.brightness_5_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      ' الاوائل في الفرع',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
