import 'package:flutter/material.dart';
import 'package:flutter_design/student/presentation/bloc/up_data_student/Student_event.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../../account/data/model/stor.dart';
import '../../../../account/ui/screen/login_screen.dart';
import '../../../../account/ui/screen/register_screen.dart';
import '../../../../account/ui/widget/widget_else.dart';
import '../../../../injection_container.dart';
import '../../../../notification/presentation/bloc/notification/Notifications_bloc.dart';
import '../../../../notification/presentation/bloc/notification/Notifications_event.dart';
import '../../../../notification/presentation/ui/notification/notification.dart';
import '../../bloc/up_data_student/student_bloc.dart';
import 'choose_class.dart';
import 'parents/AssignmentsScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'parents/AttendanceScreen.dart';
import 'parents/BehaviorScreen.dart';
import 'parents/MonthlyTestsScreen.dart';
import 'parents/permission_request.dart';
// import 'dashboard_student_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = UserData.id != null;
    bool permissions = false;

    if (isUserLoggedIn) {
      // TeacherData permission = UserData.teacherData;
      String permission = UserData.permissions.toString();
      if (permission.contains("مدير")) {
        permissions = true;
      } else
        print(permissions);
    }
    print(isUserLoggedIn);
    return Scaffold(
        body: isUserLoggedIn
            ? GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16),
                children: [
                  if (permissions) //login user

                    buildDashboardItem(
                      icon: Icons.settings, // Change the icon to event
                      title: 'العمليات',
                      subtitle: 'العمليات المختصة بالطالب ',
                      color: Color.fromARGB(255, 145, 147, 148),
                      onTap: () {
                        // print("PPPPPPPPPPPPPPPPPP");
                        // BlocProvider.of<StudentBloc>(context)
                        //     .add(GetStudentClassEvent());
                        // print("PPPPPPPPPPPPPPPPPP");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseClassScreen()),
                          // builder: (context) => DashboardStudentScreen()),
                        );
                      },
                    ),
                  buildDashboardItem(
                    icon: Icons.assignment_turned_in,
                    title: 'الواجب المكلف',
                    subtitle: 'الواجب المكلف به الطالب القيام بة  ',
                    color: Colors.blue[900]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseClassScreen()),
                      );
                    },
                  ),
                  buildDashboardItem(
                    icon: Icons.event, // Change the icon to event
                    title: 'الحضور',
                    subtitle: 'عرض سجلات الحضور',
                    color: Colors.red,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AttendanceStudentViewScreen()),
                      );
                    },
                  ),
                  buildDashboardItem(
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
                  buildDashboardItem(
                    icon: Icons.school, // Change the icon to school
                    title: 'الاختبارات الشهرية',
                    subtitle: 'عرض نتائج الاختبارات الشهرية',
                    color: Colors.purple,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MonthlyTestsStudentViewScreen()),
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
                        MaterialPageRoute(
                            builder: (context) =>
                                AssignmentsStudentViewScreen()),
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
                            builder: (context) =>
                                PermissionRequestStudentViewScreen()),
                      );
                    },
                  ),
                ],
              )
            : PageChickLoginScreen());
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
