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

    return _idStudent != 0
        ? Scaffold(
          backgroundColor: Color.fromARGB(255, 222, 239, 239),

            body: Column(
            children: [
           _WidgetAppbar(),
              //  SizedBox(height: 5),
              buildPersonItem(),
              Container(
                height: 600,
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.only(left: 40,right: 40,top: 30,bottom: 30),
                  children: [
                    if (permissions) //login user

                      DashboardItem(
                        icon: Icons.settings, // Change the icon to event
                        title: 'العمليات',
                        color: Color.fromARGB(255, 145, 147, 148),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseClassScreen()),
                          );
                        },
                      ),
                      // SizedBox(width: 20,),
                    DashboardItem(
                      icon: Icons.assignment_turned_in,
                      title: 'الواجب المكلف',
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
                       color: Colors.red,
                      onTap: () {
                        BlocProvider.of<ParentBloc>(context).add(
                            GetDataStudentToParentEvent(idStuden: _idStudent));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AttendanceStudentViewScreen()),
                        );
                      },
                    ),
                    DashboardItem(
                      icon: Icons.thumb_up,
                      title: 'السلوك والانضباط',
                       color: Colors.green,
                      onTap: () {
                        BlocProvider.of<NotificationsBloc>(context).add(
                            GetNotificationToParentEvent(
                                idStudent: _idStudent));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  NotificationsParentScreen()),
                        );
                      },
                    ),
                    DashboardItem(
                      icon: Icons.school, // Change the icon to school
                      title: 'الاختبارات الشهرية',
                       color: Colors.purple,

                      onTap: () {
                        BlocProvider.of<ParentBloc>(context).add(
                            GetDataStudentToParentMonthlyTestEvent(
                                idStuden: _idStudent));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MonthlyTestsStudentViewScreen()),
                        );
                      },
                    ),
                    DashboardItem(
                      icon: Icons.assignment, // Change the icon to assignment
                      title: 'الواجبات',
                       color: Colors.teal,
                      onTap: () {
                        BlocProvider.of<ParentBloc>(context).add(
                            GetDataStudentToParentAssignmentsEvent(
                                idStuden: _idStudent));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AssignmentsStudentViewScreen()),
                        );
                      },
                    ),
                    DashboardItem(
                      icon: Icons.request_page, // تعيين الأيقونة المناسبة
                      title: 'طلب الاستئذان',
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
          ))
        : LoginScreen();
  }


Widget _WidgetAppbar(){
  return    Container(
                color: Color.fromARGB(255, 11, 89, 138),
                // color: Color.fromARGB(255, 24, 55, 140),
                
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.notifications_active_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          "صفحة المتابعة",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: PopupMenuButton(
                              
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem(
                                    child: Text('تسجيل الدخول'),
                                    value: 'login',
                                  ),
                                  // قائمة القوائم الأخرى
                                ];
                              },
                              onSelected: (value) {
                                if (value == 'login') {
                                  // تنفيذ إجراء تسجيل الدخول
                                } else {
                                  // تنفيذ الإجراءات الأخرى
                                }
                              },
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
          
}
 
 
  Widget buildPersonItem() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 120,
        margin: EdgeInsets.only(left: 0, right: 0, top: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 136, 177, 194),
              Color.fromARGB(255, 106, 141, 161),
              // Color.fromARGB(255, 31, 96, 160),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
          child: Align(
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/school/ahmed.jpg"),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "المقداد ابن عمر",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      ' سنه 15',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
