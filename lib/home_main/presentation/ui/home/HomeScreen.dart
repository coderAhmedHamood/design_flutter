import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/loading_screen.dart';
import '../../../../notification/presentation/bloc/notification/Notifications_bloc.dart';
import '../../../../notification/presentation/bloc/notification/Notifications_event.dart';
import '../../../../notification/presentation/bloc/notification/Notifications_state.dart';
import '../../../domain/entities/post.dart';
import '../../bloc/posts/posts_bloc.dart';
import '../widgets/post_list_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StatefulWidget> {
  // late Post posts;
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: const Color.fromARGB(255, 135, 135, 135),
        // color: Color.fromARGB(255, 197, 187, 187),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            // if (state is LoadingPostsState) {
            //   WidgetsBinding.instance.addPostFrameCallback((_) {
            //     LoadingScreen.show(context, "loading data");
            //   });
            // }
            if (state is LoadedPostsState) {
              // LoadingScreen.hide(context);
              posts = state.posts; // تخزين البيانات في الحالة المؤقتة
              BlocProvider.of<NotificationsBloc>(context)
                  .add(GetValueNotificationBarEvent());
            }
            if (state is GetValueNotificationBarState) {
              BlocProvider.of<PostsBloc>(context).add(GetAllPostsEvent());
            }
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<NotificationsBloc>(context)
                    .add(GetValueNotificationBarEvent());
              },
              child: PostListWidget(posts: posts),
            );
          },
        ),
      ),
    );
  }
}