// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../home_main/presentation/ui/home/HomeScreen.dart';
import '../../home_main/presentation/ui/home/menu_drawer.dart';
 import '../../branch/presentation/ui/branch/view_branch.dart';


import '../../notification/presentation/ui/notification/notification.dart';
 import '../../parent/presentation/ui/page/chick_dashboard_parents.dart';
import 'tabbar.dart';

class TabBarViewScreen extends StatefulWidget {
    final int? initialIndexValue;
  const TabBarViewScreen({Key? key, this.initialIndexValue}) : super(key: key);

  @override
  _TabBarViewScreenState createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
 
  @override
  void initState() {
    
    super.initState();
    int initialIndex;
    if (widget.initialIndexValue==null) {
    initialIndex=0;  
    }
    else{
      initialIndex = widget.initialIndexValue??0;
    }
    
      _tabController = TabController(length: 5, vsync: this, initialIndex: initialIndex);

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
            ChickDashboardScreen(),
            NotificationsScreen(),
            MenuPage(),
          ],
        ),

        // drawer: CustomDrawer(),
      ),
    );
  }
}
