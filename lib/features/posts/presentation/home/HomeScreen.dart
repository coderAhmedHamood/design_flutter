import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/my_colors.dart';
import '../../domain/entities/post.dart';
import '../bloc/posts/posts_bloc.dart';
import '../widgets/posts_page/post_list_widget.dart';

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
          child: BlocConsumer<PostsBloc, PostsState>(
            listener: (context, state) {
              if (state is LoadedPostsState) {
                posts = state.posts;
                print(posts);
              }
            },
            builder: (context, state) {
              if (state is LoadedPostsState) {
                posts = state.posts; // تخزين البيانات في الحالة المؤقتة
              }
              if (state is GetValueNotificationBarState) {
                BlocProvider.of<PostsBloc>(context)
                      .add(GetAllPostsEvent());
              }
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<PostsBloc>(context)
                      .add(GetValueNotificationBarEvent());
                  
                },
                    child: PostListWidget(posts: posts),
              );
            },
          )),
    );
  }
}
