import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_design/notification/presentation/bloc/notification/Notifications_event.dart';
import '../../../../account/data/model/stor.dart';
import '../../../../account/ui/widget/widget_else.dart';
import '../../../domain/entities/notification.dart';
import '../../bloc/notification/Notifications_bloc.dart';
import '../../bloc/notification/Notifications_state.dart';
import '../widgets/notification_list_widget.dart';

class NotificationsParentScreen extends StatelessWidget {
  // bool isNotificationClicked = false;
  List<NotificationClass> notifications = []; 
  
  @override
  Widget build(BuildContext context) {
        bool isUserLoggedIn = UserData.id != null;
    
    
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        if (state is LoadedNotificationState) {
          
          notifications = state.notification;
          
        }
        if (state is GetValueNotificationBarState) {
           BlocProvider.of<NotificationsBloc>(context)
              .add(GetAllNotificationsEvent());
          BlocProvider.of<NotificationsBloc>(context)
              .add(ReadValueNotificationBarEvent());
              
        }

        return
        isUserLoggedIn
        ? Directionality(
          textDirection: TextDirection.rtl, // تغيير اتجاه النصوص والعناصر
          child: Scaffold(
            appBar: AppBar(),
            body:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  // color: const Color.fromARGB(255, 234, 231, 231),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                            Icons.search,
                            size: 30,
                          ),
                       Text(
                          "الاشعارات",
                          style: TextStyle(
                              //  backgroundColor: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                              //  height: .0

                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              NotificationListWidget(notifications: notifications),
            ],
          ),
      
          ),
          )
        :PageChickLoginScreen();
      },
    );
  }
}
