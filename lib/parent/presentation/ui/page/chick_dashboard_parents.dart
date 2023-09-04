import 'package:flutter/material.dart';
import '../../../../account/data/model/stor.dart';
import '../../../../account/ui/screen/login_screen.dart';
import 'choose_student.dart';
import 'dashboard_parents_screen.dart';

class ChickDashboardScreen extends StatefulWidget {
  

  
  @override
  _ChickDashboardScreenState createState() => _ChickDashboardScreenState();
}

class _ChickDashboardScreenState extends State<ChickDashboardScreen> {
     int idStudent = 0;
     bool goToDashbord=false;
 @override
  void didUpdateWidget(ChickDashboardScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('تم تحديث الصفحة');
  }

  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = UserData.id != null;

    bool parentHaveStudent = false;
 
    if (isUserLoggedIn) {
      String permission = UserData.permissions.toString();
      if (permission.contains("مدرس")) {
        print("lllllllllllllhhhhhhhhhhhhhhhhhh");
        print(UserData.parentData);
        print("lllllllllllllhhhhhhhhggggggggghhhhhhhhhh");
        if (UserData.parentData != null &&
            UserData.parentData!.studentName.length > 1) {
        print("llllMMMMMMMMMMMMMMMMMMMMMMMMM");
          parentHaveStudent = true;
        }
        else  if (UserData.parentData != null &&
            UserData.parentData!.studentName.length == 1) {
          parentHaveStudent = false;
        print("GGGGGGGGGGGGGGGGGGGGGGGGGG");
           idStudent = UserData.parentData!.studentName[0].id!;
        } 
       } else if (permission.contains("ولي امر")) {
        if (UserData.parentData != null &&
            UserData.parentData!.studentName.length > 1) {
          print(UserData.parentData!.studentName.length);
          parentHaveStudent = true;
           idStudent = UserData.parentData!.studentName[0].id!;
        }
        else  if (UserData.parentData != null &&
            UserData.parentData!.studentName.length == 1) {
          parentHaveStudent = false;
           idStudent = UserData.parentData!.studentName[0].id!;
        }
      }
    }



    return parentHaveStudent
        ? ChooseStudentScreen()        
        : isUserLoggedIn
            ? DashboardScreen(idStudent)
            : LoginScreen();

  }
}

    // if (parentHaveStudent) {
    //   return ChooseStudentScreen();
    // } else if (isUserLoggedIn) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => DashboardScreen(idStuden)),
    //     );
    //   });
    // }