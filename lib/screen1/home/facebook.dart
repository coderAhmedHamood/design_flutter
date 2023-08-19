// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
 
 import '../../screen/parents/DashboardScreen.dart';
import '../branch/post_carosal.dart';
import '../branch/tabbar/tabbar.dart';
import 'HomeScreen.dart';
import 'custom_drawer.dart';
import 'notification.dart';

class FacebookTabBarView extends StatefulWidget {
  const FacebookTabBarView({Key? key}) : super(key: key);

  @override
  _FacebookTabBarViewState createState() => _FacebookTabBarViewState();
}

class _FacebookTabBarViewState extends State<FacebookTabBarView>
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
            PostCarosal(),
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

 
 
 
