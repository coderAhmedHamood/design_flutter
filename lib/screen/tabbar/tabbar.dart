import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../home_main/presentation/bloc/posts/posts_bloc.dart';
import '../../notification/presentation/bloc/notification/Notifications_bloc.dart';
import '../../notification/presentation/bloc/notification/Notifications_state.dart';
import 'Notification_class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController? tabController;
// NotificationHome;

  CustomTabBar({this.tabController});

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
              color: MyColors.facebook,
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
          child: WidgetTabBar(),
        ),
      ),
    );
  }

  Widget WidgetTabBar() {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        if (state is GetValueNotificationBarState) {
          BlocProvider.of<PostsBloc>(context).add(GetAllPostsEvent());
        }
        return TabBar(
          controller: tabController,
          indicatorColor: MyColors.facebook,
          labelColor: MyColors.facebook,
          unselectedLabelColor: MyColors.appbarColor,

          // unselectedLabelColor: MyColors.appbarColor,
          dividerColor: Colors.red,
          tabs: [
            WidgetTab(Icons.home_outlined, 35),
            WidgetTab(Icons.photo_library_outlined, 35),
            WidgetTabNotification(
                Icons.assignment, 35, NotificationHome.assignment),
            WidgetTabNotification(
                Icons.notifications, 35, NotificationHome.notifications),
            WidgetTab(Icons.menu, 35),
          ],
        );
      },
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

  Widget WidgetTabNotification(
      IconData icon, double size, int notificationCount) {
    return Tab(
      icon: Stack(
        children: [
          Icon(
            icon,
            size: size,
          ),
          if (notificationCount > 0) // يتم عرض الرقم فقط إذا كان أكبر من صفر
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
