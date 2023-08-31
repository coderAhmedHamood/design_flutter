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
          // print(UserData.parentData!.studentName.length);
      } else if (permission.contains("ولي امر")) {
        if (UserData.parentData != null &&
            UserData.parentData!.studentName.length > 1) {
          parentHaveStudent = true;
          // print(UserData.parentData!.studentName.length);
          // print(UserData.parentData!.studentName[0].name);
          // print(UserData.parentData!.studentName[0].id);
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
              color: Colors.green,
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
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تعزيز أهمية الواجبات',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ننصحك بتخصيص وقتٍ مناسب لابنك/ابنتك لأداء الواجبات المدرسية. يجب أن يدركوا أن الواجبات تعزز فهمهم للمواد وتساعدهم في تطوير مهاراتهم الأكاديمية.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'التحضير للاختبارات',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'قم بتشجيع ابنك/ابنتك على التحضير المبكر للاختبارات. يمكنك تنظيم جدول زمني للدراسة والمراجعة، وتقديم المساعدة في فهم المواد الدراسية.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'تعزيز السلوك الإيجابي',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ننصحك بتعزيز السلوك الإيجابي لابنك/ابنتك داخل وخارج المدرسة. قم بتحفيزهم على الاحترام والانضباط، والمشاركة الفعّالة في الفصل الدراسي.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'تعزيز التواصل والمتابعة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'يوصى بتعزيز التواصل المستمر بينك وبين المدرسين لمتابعة تقدم ابنك/ابنتك والتحدث عن أي قضايا قد تطرأ. حضور اولي الأمر للاجتماعات الدراسية والمشاركة في أنشطة المدرسة أيضًا سيكون له تأثير إيجابي على تطور الطالب.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
             setState(() {
               print("Ok mm ok");
             });
            },
            child: Text("المتابعة"),
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
    ),
  ),
);




}
}
