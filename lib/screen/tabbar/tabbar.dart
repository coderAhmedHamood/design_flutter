import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController? tabController;

  const CustomTabBar({this.tabController});

  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'مدارس العربية السعيدة',
            style: TextStyle(
              color: Color.fromARGB(255, 4, 4, 243),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          color: Colors.white,
          child: TabBar(
            controller: tabController,
            indicatorColor: MyColors.blue,
            labelColor: MyColors.blue,
            unselectedLabelColor: MyColors.appbarColor,
            dividerColor: Colors.green,
            tabs: [
              WidgetTab(Icons.home_outlined, 35),
              WidgetTab(Icons.photo_library_outlined, 35),
              WidgetTabNotification(Icons.assignment, 35, 23),
              WidgetTabNotification(Icons.notifications, 35,95),
              WidgetTab(Icons.menu, 35),
            ],
          ),
        ),
      ),
    );
  }

  Widget WidgetTab(IconData icon, double size) {
  return Tab(
    icon: Icon(
      icon,
      size: size,
    ),
  );
}
Widget WidgetTabNotification(IconData icon, double size,int notificationCount) {
  return Tab(
    icon: Stack(
      children: [
        Icon(
          icon,
          size: size,
        ),
       
        if (notificationCount > 0)  // يتم عرض الرقم فقط إذا كان أكبر من صفر
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 16, 0),
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Text(
                notificationCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    ),
  );
}



}