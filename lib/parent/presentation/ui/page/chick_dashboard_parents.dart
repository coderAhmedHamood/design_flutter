import 'package:flutter/material.dart';
import 'package:flutter_design/parent/presentation/bloc/parent_bloc.dart';
import 'package:flutter_design/student/presentation/ui/page/dashboard_student_screen.dart';

import '../../../../account/data/model/stor.dart';

import '../../../../account/ui/screen/login_screen.dart';
import '../../../../account/ui/widget/widget_else.dart';

import '../widgets/page_route_login.dart';
import 'choose_student.dart';

import 'dashboard_parents_screen.dart';

class ChickDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = UserData.id != null;
    bool permissions = false;
    bool parentHaveStudent = false;
    int idStuden = 0;

    if (isUserLoggedIn) {
      // TeacherData permission = UserData.teacherData;
      String permission = UserData.permissions.toString();
      if (permission.contains("مدير")) {
        permissions = true;
      } else if (permission.contains("ولي امر")) {
        if (UserData.parentData != null &&
            UserData.parentData!.studentName.length > 1) {
          parentHaveStudent = true;
          idStuden = UserData.parentData!.studentName[0].id!;
        }
      }
    }

    if (parentHaveStudent) {
      return ChooseStudentScreen();
    } else if (isUserLoggedIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen(idStuden)),
        );
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });
    }

return Scaffold(
  backgroundColor: Colors.grey[200],
  body: SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Text(
            'نصائح مهمة',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/school.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(20),
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'قم بمتابعة ابنك الطالب وحفزه على تحقيق التفوق الأكاديمي. استخدم وقت فراغك لمتابعة تقدمه وتقديم الدعم اللازم.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'قم بتشجيعه على المشاركة في الأنشطة المدرسية الإضافية ومساعدته في اختيار المسار الأكاديمي المناسب له.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardStudentScreen(),
                    ),
                  );
                },
                child: Text("عرض درجات الطالب"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              // permissions?
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(idStuden),
                    ),
                  );
                },
                child: Text("رفع درجات الطالب"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);
}
}



// class ChickDashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     bool isUserLoggedIn = UserData.id != null;
//     bool permissions = false;
//     bool parentHaveStudent = false;
//     int idStuden=0; 
     

//     if (isUserLoggedIn) {
//       // TeacherData permission = UserData.teacherData;
//       String permission = UserData.permissions.toString();
//       if (permission.contains("مدير")) {
//         permissions = true;
//       } else if (permission.contains("ولي امر")) {
//         if (UserData.parentData != null &&
//             UserData.parentData!.studentName.length > 1) {
//           parentHaveStudent = true;
//           idStuden=UserData.parentData!.studentName[0].id!;
//         }
//       }
//     }
//     return Scaffold(
//         body: parentHaveStudent
//             ? ChooseStudentScreen()
//             : isUserLoggedIn
//                 ? 
//                 DashboardScreen(idStuden)
//                 : RouteAntherPageScreen());
//                 // : PageChickLoginScreen());
//   }

 
// }
