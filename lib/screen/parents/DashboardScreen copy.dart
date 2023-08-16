import 'package:flutter/material.dart';
import '../behaviour_students.dart';
import '../degree_students.dart';
import '../homework_students.dart';
import '../present_students.dart';
import 'AssignmentsScreen.dart';
import 'AttendanceScreen.dart';
import 'BehaviorScreen.dart';
import 'MonthlyTestsScreen.dart';
import 'notification.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الواجهة الرئيسية',
          style: TextStyle(fontFamily: 'Arabic'),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        children: [
      buildDashboardItem(
  icon: Icons.event, // Change the icon to event
  title: 'الحضور',
  subtitle: 'عرض سجلات الحضور',
  color: Colors.green,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AttendanceScreen()),
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
      MaterialPageRoute(builder: (context) => BehaviorScreen()),
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
      MaterialPageRoute(builder: (context) => MonthlyTestsScreen()),
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
      MaterialPageRoute(builder: (context) => AssignmentsScreen()),
    );
  },
),

buildDashboardItem(
  icon: Icons.notifications, // Change the icon to notifications
  title: 'الاشعارات',
  subtitle: 'عرض اشعارات ولي الامر',
  color: Colors.blue,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Notifications()),
    );
  },
),

buildDashboardItem(
  icon: Icons.event, // Change the icon to assignment
  title: 'التحضير ',
  subtitle: 'رفع درجات تحضير الطلاب',
  color: Color.fromARGB(255, 97, 86, 252),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PreparingStudents()),
    );
  },
),
buildDashboardItem(
  icon: Icons.thumb_up, // Change the icon to thumb_up
  title: 'السلوك',
  subtitle: 'رفع درجات سلوك الطلاب',
  color: Color.fromARGB(255, 205, 95, 27),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BehaviourStudents()),
    );
  },
),
buildDashboardItem(
  icon: Icons.school, // Change the icon to school
  title: 'الاختبارات',
  subtitle: 'رفع درجات اختبارات الطلاب',
  color: Color.fromARGB(255, 249, 50, 162),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DegreeTestStudents()),
    );
  },
),

buildDashboardItem(
  icon: Icons.assignment, // Change the icon to assignment
  title: 'الواجبات',
  subtitle: 'رفع درجات واجبات الطلاب',
  color: Color.fromARGB(255, 17, 189, 241),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeWorkStudents()),
    );
  },
),
        ],
      ),
    );
  }

  Widget buildDashboardItem({required IconData icon,required String title,required String subtitle,required Color color,required VoidCallback onTap,
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