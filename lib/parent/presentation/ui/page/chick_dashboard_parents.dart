import 'package:flutter/material.dart';
import '../../../../account/data/model/stor.dart';
import '../../../../account/ui/screen/login_screen.dart';
import '../../../../student/presentation/ui/page/choose_class.dart';
import '../widgets/student/alert.dart';
import 'choose_student.dart';
import 'dashboard_parents_screen.dart';

class ChickDashboardScreen extends StatelessWidget {
// class ChickDashboardScreen extends StatefulWidget {
//   @override
//   _ChickDashboardScreenState createState() => _ChickDashboardScreenState();
// }

// class _ChickDashboardScreenState extends State<ChickDashboardScreen> {
  int idStudent = 0;

  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = UserData.id != null;
    if ( UserData.id==0) {
      isUserLoggedIn =false;
    }
    String permission = UserData.permissions.toString();
    int _lengthArray = UserData.parentData?.studentName.length ?? 0;
    // int _lengthArray = UserData.parentData!.studentName.length;
    // bool _emptyData = UserData.parentData != null;
    bool parentHaveStudent = false;
    bool findStudent = false;
    bool teacherHaveStudent = false;
    bool teacherPermission = false;

print("logout ,,,,,,,,,,,chick ...xxxxxxxxxxxxxxxxxxx........,");
print('isUserLoggedIn: $isUserLoggedIn');
print('permission: $permission');
print('_lengthArray: $_lengthArray');
print("logout ,,,,,,,xxxxxxxxxxxxxxxxxxxxxxxxx,,,,chick ...........,");
// print(UserData.parentData != null);

    if (isUserLoggedIn) {
      if (permission.contains("مدرس")) {
        if (UserData.parentData != null && _lengthArray == 0) {
          teacherPermission = true;
        }
      }
      if (UserData.parentData != null) {
        if (_lengthArray == 1) {
          findStudent = true;
          idStudent = UserData.parentData!.studentName[0].id!;
        } else if (_lengthArray > 1) {
          parentHaveStudent = true;
          idStudent = 0;
        }
      }

      if (permission.contains("مدرس")) {
        if (findStudent || parentHaveStudent) {
          teacherHaveStudent = true;
          parentHaveStudent = false;
        }
      }
    }

    return teacherPermission
        ? ChooseClassScreen()
        : parentHaveStudent
            ? ChooseStudentScreen()
            :
             teacherHaveStudent
                ? GradeInputDialogScreen(studentId: idStudent)
                :
                 isUserLoggedIn
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