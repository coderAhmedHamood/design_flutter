import 'package:flutter/material.dart';
import 'package:flutter_design/screen/sudent_parent/students/behaviour_students.dart';
import 'package:flutter_design/screen/sudent_parent/students/degree_test_students.dart';
import 'package:flutter_design/screen/sudent_parent/students/homework_students.dart';

import 'students/present_students.dart';

class DashboardStudentScreen extends StatelessWidget {
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
            icon: Icons.event, // Change the icon to assignment
            title: 'التحضير ',
            subtitle: 'رفع درجات تحضير الطلاب',
            color: Color.fromARGB(255, 97, 86, 252),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreparingStudentsScreen()),
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
                MaterialPageRoute(builder: (context) => BehaviourStudentsScreen()),
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
                MaterialPageRoute(builder: (context) => DegreeTestStudentsScreen()),
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
                MaterialPageRoute(builder: (context) => HomeWorkStudentsScreen()),
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
