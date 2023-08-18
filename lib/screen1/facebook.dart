import 'package:flutter/material.dart';
import 'package:flutter_design/screen1/notification.dart';

import 'HomeScreen.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'مدارس العربية السعيدة',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.message,
                color: Colors.black,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              color: Colors.black,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.white,
                tabs: const [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.group)),
                  Tab(icon: Icon(Icons.ondemand_video)),
                  Tab(icon: Icon(Icons.notifications)),
                  Tab(icon: Icon(Icons.menu)),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children:  [
            HomeScreen(),
            GroupScreen(),
            VideoScreen(),
            NotificationsScreen(),
            MenuScreen(),
          ],
        ),
      ),
    );
  }
}



class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Group Screen'),
    );
  }
}

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Video Screen'),
    );
  }
}

// class NotificationsScreen extends StatelessWidget {
//   const NotificationsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Notifications Screen'),
//     );
//   }
// }

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Menu Screen'),
    );
  }
}