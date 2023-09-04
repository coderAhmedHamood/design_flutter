import 'package:flutter/material.dart';
import 'package:flutter_design/parent/presentation/bloc/parent_event.dart';

import '../../../../account/data/model/stor.dart';

import '../../../../account/ui/screen/login_screen copy.dart';
import '../../../../notification/presentation/bloc/notification/Notifications_bloc.dart';
import '../../../../notification/presentation/bloc/notification/Notifications_event.dart';
import '../../../../notification/presentation/ui/notification/notification_parent.dart';
import '../../../../student/presentation/ui/page/choose_class.dart';
import '../../bloc/parent_bloc.dart';
import '../widgets/student/build_dashboard_item.dart';
import 'parents/AssignmentsScreen.dart';
import 'parents/AttendanceScreen.dart';
import 'parents/MonthlyTestsScreen.dart';
import 'parents/permission_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  final int _idStudent;
  DashboardScreen(this._idStudent);
  @override
  Widget build(BuildContext context) {
    // bool isUserLoggedIn = UserData.id != null;
    bool permissions = false;
    String permission = UserData.permissions.toString();
    print(permission);
    print("permission.....");
    if (permission.contains("مدرس")) {
      permissions = true;
    }

    return 
    _idStudent!=0
        ? 
    Scaffold(
        // appBar: AppBar(),

        body: Column(
      children: [
        SizedBox(height: 5),
        buildPersonItem(),
        
        Container(
          height: 600,
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(20),
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
                      MaterialPageRoute(
                          builder: (context) => ChooseClassScreen()),
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
                  BlocProvider.of<ParentBloc>(context)
                      .add(GetDataStudentToParentEvent(idStuden: _idStudent));
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
                  BlocProvider.of<NotificationsBloc>(context)
                      .add(GetNotificationToParentEvent(idStudent: _idStudent));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsParentScreen()),
                  );
                },
              ),
              DashboardItem(
                icon: Icons.school, // Change the icon to school
                title: 'الاختبارات الشهرية',
                subtitle: 'عرض نتائج الاختبارات الشهرية',
                color: Colors.purple,

                onTap: () {
                  BlocProvider.of<ParentBloc>(context).add(
                      GetDataStudentToParentMonthlyTestEvent(
                          idStuden: _idStudent));
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
                  BlocProvider.of<ParentBloc>(context).add(
                      GetDataStudentToParentAssignmentsEvent(
                          idStuden: _idStudent));
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
                  BlocProvider.of<ParentBloc>(context).add(
                      GetDataStudentToParentPermissionEvent(
                          idStuden: _idStudent));

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PermissionRequestStudentViewScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    )):
     LoginScreen();
  
  }
 
Widget buildPersonItem() {
  return Container(
    height: 120,
    margin: EdgeInsets.only(left: 0, right: 0, top: 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 93, 117, 236),
          Color.fromARGB(255, 0, 146, 255),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/school.jpg"),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "person.name",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Age: person.age',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
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
