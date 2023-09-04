import 'package:flutter/material.dart';

import '../../../../../student/presentation/ui/page/choose_class.dart';
import '../../page/choose_student.dart';
import '../../page/dashboard_parents_screen.dart';
import 'build_dashboard_item.dart';

class GradeInputDialogScreen extends StatefulWidget {
  final int studentId;
  GradeInputDialogScreen({required this.studentId}); 
  @override
  _GradeInputDialogScreenState createState() => _GradeInputDialogScreenState();
}

class _GradeInputDialogScreenState extends State<GradeInputDialogScreen> {
 
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
                if (widget.studentId==0) {
                   Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChooseStudentScreen(),
                  ),
                );
                }
               else{
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(widget.studentId),
                  ),
                );
               }
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
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      widget.studentId==0?"متابعة طلابي":'متابعة طالب',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChooseClassScreen(),
                  ),
                );
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
                      Icons.upload,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'رفع درجات',
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