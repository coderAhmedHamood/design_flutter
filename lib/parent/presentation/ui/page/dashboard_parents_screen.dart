import 'package:flutter/material.dart';

import '../../../../account/data/model/stor.dart';

import '../../../../student/presentation/ui/page/choose_class.dart';
import '../widgets/student/build_dashboard_item.dart';
import 'choose_student.dart';
import 'parents/AssignmentsScreen.dart';
import 'parents/AttendanceScreen.dart';
import 'parents/BehaviorScreen.dart';
import 'parents/MonthlyTestsScreen.dart';
import 'parents/permission_request.dart';
// import 'dashboard_student_screen.dart';

class DashboardScreen extends StatelessWidget {
  final int _idStudent;
  DashboardScreen(this._idStudent);
  @override
  Widget build(BuildContext context) {
    bool permissions = false;
    String permission = UserData.permissions.toString();
    if (permission.contains("مدير")) {
      permissions = true;
    }

    return Scaffold(
      appBar: AppBar(),
      
        body: GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16),
      children: [
        if (permissions) //login user

          DashboardItem(
            icon: Icons.settings, // Change the icon to event
            title: 'العمليات',
            subtitle: 'العمليات المختصة بالطالب ',
            color: Color.fromARGB(255, 145, 147, 148),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChooseClassScreen()),
              );
            },
          ),
        DashboardItem(
          icon: Icons.assignment_turned_in,
          title: 'الواجب المكلف',
          subtitle: 'الواجب المكلف به الطالب القيام بة  ',
          color: Colors.blue[900]!,
          onTap: () {
            print("الواجب المكلف");
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => ChooseClassScreen()),
            // );
          },
        ),
        DashboardItem(
          icon: Icons.event, // Change the icon to event
          title: 'الحضور',
          subtitle: 'عرض سجلات الحضور',
          color: Colors.red,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AttendanceStudentViewScreen()),
            );
          },
        ),
        DashboardItem(
          icon: Icons.thumb_up,
          title: 'السلوك والانضباط',
          subtitle: 'عرض سجلات السلوك والانضباط',
          color: Colors.green,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BehaviorStudentViewScreen()),
              // MaterialPageRoute(builder: (context) => NotificationsScreen()),
            );
          },
        ),
        DashboardItem(
          icon: Icons.school, // Change the icon to school
          title: 'الاختبارات الشهرية',
          subtitle: 'عرض نتائج الاختبارات الشهرية',
          color: Colors.purple,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MonthlyTestsStudentViewScreen()),
            );
          },
        ),
        DashboardItem(
          icon: Icons.assignment, // Change the icon to assignment
          title: 'الواجبات',
          subtitle: 'عرض تفاصيل الواجبات',
          color: Colors.teal,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AssignmentsStudentViewScreen()),
            );
          },
        ),
        DashboardItem(
          icon: Icons.request_page, // تعيين الأيقونة المناسبة
          title: 'طلب الاستئذان',
          subtitle: 'طلب استئذان لطالب',
          color: Colors.blue, // اختر لونًا مناسبًا
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PermissionRequestStudentViewScreen()),
            );
          },
        ),
      ],
    ));
  }
}
