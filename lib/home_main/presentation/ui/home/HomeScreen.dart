import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../base/constants/my_colors.dart';
import '../../../../notification/presentation/bloc/notification/Notifications_bloc.dart';
import '../../../../notification/presentation/bloc/notification/Notifications_event.dart';
import '../../../domain/entities/post.dart';
import '../../bloc/posts/posts_bloc.dart';
// import '../widgets/post_list_widget.dart';

  List<Post> posts = [];
  bool stateDataToPosts=false;
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StatefulWidget> {

// class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: const Color.fromARGB(255, 135, 135, 135),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is LoadedPostsState) {
              if (!stateDataToPosts) {
              posts = state.posts;
              stateDataToPosts = true;
              }
            }
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<PostsBloc>(context).add(GetAllPostsEvent());
                BlocProvider.of<NotificationsBloc>(context)
                    .add(GetValueNotificationBarEvent());
              },
              child: PostListWidget(),
            );
          },
        ),
      ),
    );
  }

  Widget PostListWidget() {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        // Post post = posts[index];

        return Card(
          // color: Color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/ahmed.jpg")),
                title: Text(
                  posts[index].username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  posts[index].time,
                  style: TextStyle(
                    color: MyColors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  posts[index].postText,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 8),
              // إضافة صورة المنشور إذا كانت موجودة في النموذج
              if (posts[index].postImage != "")
                Image.asset(
                  posts[index].postImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              SizedBox(height: 8),
              Container(
                height: 2,
                width: double.infinity,
                child: Divider(
                  color: MyColors.black,
                  thickness: 0.2,
                  indent: 16,
                  endIndent: 16,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (posts[index].islikes) {
                              setState(() {
                                print("4");
                                print(posts[index].id);
                                print(posts[index].islikes);
                                posts[index].islikes = false;
                              });
                            } else {
                              setState(() {
                                print("5");
                                print(posts[index].id);
                                print(posts[index].islikes);
                                posts[index].islikes = true;
                              });
                            }
                          },
                          icon: Icon(
                            posts[index].islikes
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: posts[index].islikes ? MyColors.red : null,
                            // color: conditionMetFalse[index]? Colors.red: null,
                          ),
                        ),
                        SizedBox(width: 8),
                        // Text(likesCount.toString()),
                        Text(
                          posts[index].likes.toString(),
                        ),
                      ],
                    ),
                    // VerticalDivider(
                    //   thickness: 1,
                    //   width: 1,
                    // ),
                    VerticalDivider(
                      thickness: 1,
                      width: 1,
                    ),
                    IconButton(
                      onPressed: () {
                        // إجراء المشاركة
                      },
                      icon: Icon(
                        Icons.share,
                        color: MyColors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
