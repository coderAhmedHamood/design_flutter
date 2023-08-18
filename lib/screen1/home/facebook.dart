import 'package:flutter/material.dart';


import '../branch/post_carosal.dart';
import 'HomeScreen.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'مدارس العربية السعيدة',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search,
              size: 25,
               color: Colors.green),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message, 
               size: 25,
              color: Colors.green),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(icon: Icon(Icons.home, size: 35, color: Colors.green)),
                  Tab(icon: Icon(Icons.group, size: 35, color: Colors.green)),
                  Tab(
                      icon: Icon(Icons.photo_library_outlined,
                          size: 35, color: Colors.green)),
                  Tab(
                      icon: Icon(
                    Icons.notifications,
                    size: 35,
                    color: Colors.green,
                  )),
                  Tab(icon: Icon(Icons.menu, size: 35, color: Colors.green)),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomeScreen(),
            GroupScreen(),
            PostCarosal(),
           
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

// class VideoScreen extends StatelessWidget {
//   const VideoScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Video Screen'),
//     );
//   }
// }

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
