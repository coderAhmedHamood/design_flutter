// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../home_main/presentation/ui/home/HomeScreen.dart';
import '../../home_main/presentation/ui/home/menu_drawer.dart';
 import '../../branch/presentation/ui/branch/view_branch.dart';


import '../../notification/presentation/ui/notification/notification.dart';
 import '../../student/presentation/ui/page/dashboard_parents_screen.dart';
import 'tabbar.dart';

class TabBarViewScreen extends StatefulWidget {
  const TabBarViewScreen({Key? key}) : super(key: key);

  @override
  _TabBarViewScreenState createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomTabBar(tabController: _tabController),

        body: TabBarView(
          controller: _tabController,
          children: [
            HomeScreen(),
            BranchScreen(),
            DashboardScreen(),
            NotificationsScreen(),
            MenuPage(),
          ],
        ),

        // drawer: CustomDrawer(),
      ),
    );
  }
}
