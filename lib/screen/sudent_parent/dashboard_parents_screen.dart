import 'package:flutter/material.dart';

import 'parents/AssignmentsScreen.dart';
 
import 'parents/AttendanceScreen.dart';
import 'parents/BehaviorScreen.dart';
import 'parents/MonthlyTestsScreen.dart';
import 'parents/permission_request.dart';
import 'dashboard_student_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        children: [


        if(1==1)//techer option
          buildDashboardItem(
            icon: Icons.settings, // Change the icon to event
            title: 'العمليات',
            subtitle: 'العمليات المختصة بالطالب ',
            color: Color.fromARGB(255, 145, 147, 148),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardStudentScreen()),
              );
            },
          ),
       
          buildDashboardItem(
            icon: Icons.event, // Change the icon to event
            title: 'الحضور',
            subtitle: 'عرض سجلات الحضور',
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttendanceStudentViewScreen()),
              );
            },
          ),
       
       
       
          buildDashboardItem(
            icon: Icons.thumb_up, // Change the icon to thumb_up
            title: 'السلوك والانضباط',
            subtitle: 'عرض سجلات السلوك والانضباط',
            color: Colors.orange,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BehaviorStudentViewScreen()),
              );
            },
          ),
          buildDashboardItem(
            icon: Icons.school, // Change the icon to school
            title: 'الاختبارات الشهرية',
            subtitle: 'عرض نتائج الاختبارات الشهرية',
            color: Colors.purple,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MonthlyTestsStudentViewScreen()),
              );
            },
          ),
          buildDashboardItem(
            icon: Icons.assignment, // Change the icon to assignment
            title: 'الواجبات',
            subtitle: 'عرض تفاصيل الواجبات',
            color: Colors.teal,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AssignmentsStudentViewScreen()),
              );
            },
          ),
          buildDashboardItem(
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
      ),
    );
  }

  Widget buildDashboardItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 48,
              ),
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Arabic',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Arabic',
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}