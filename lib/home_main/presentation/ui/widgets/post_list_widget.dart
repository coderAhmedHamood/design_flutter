 import 'package:flutter/material.dart';

import '../../../../base/constants/my_colors.dart';
import '../../../domain/entities/post.dart';



// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<StatefulWidget> {

// class PostListWidget extends StatefulWidget {
  //  @override
//   _PostListWidgetState createState() => _PostListWidgetState();
// }
// class _PostListWidgetState extends State<StatefulWidget> {
  

// List<Post> posts=[];
class PostListWidget extends StatelessWidget {
  final List<Post> posts;
  const PostListWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    Post post = posts[index];
                  
                    return Card(
                      // color: Color,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/ahmed.jpg")),
                            title: Text(
                              post.username,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              post.time,
                              style: TextStyle(
                                color: MyColors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              post.postText,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          // إضافة صورة المنشور إذا كانت موجودة في النموذج
                          if (post.postImage != "")
                            Image.asset(
                              post.postImage,
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
                                        // if (!post.islikes) {
                                        //   setState(() {
                                        //     print(conditionMetTrue[index]);
                                        //     conditionMetTrue[index] = true;
                                        //   });
                                        // } else {
                                        //   setState(() {
                                        //     print(conditionMetFalse[index]);
                                        //     conditionMetFalse[index] = false;
                                        //   });
                                        // }
                                      },
                                      icon: Icon(
                                        post.islikes
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: post.islikes ? MyColors.red : null,
                                        // color: conditionMetFalse[index]? Colors.red: null,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    // Text(likesCount.toString()),
                                    Text(
                                      post.likes.toString(),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  thickness: 1,
                                  width: 1,
                                ),
                                IconButton(
                                  onPressed: () {
                                    // إجراء التعليق
                                  },
                                  icon: Icon(
                                    Icons.comment,
                                    color: MyColors.blue,
                                  ),
                                ),
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
