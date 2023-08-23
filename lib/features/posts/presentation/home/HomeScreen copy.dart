// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../constants/my_colors.dart';
// import '../../domain/entities/post.dart';
// import '../bloc/posts/posts_bloc.dart';
// import '../widgets/posts_page/message_display_widget.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<StatefulWidget> {
//   // late Post posts;
//   List<Post> posts = [];

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Container(
//           color: const Color.fromARGB(255, 135, 135, 135),
//           // color: Color.fromARGB(255, 197, 187, 187),
//           child: BlocConsumer<PostsBloc, PostsState>(
//             listener: (context, state) {
//               if (state is LoadedPostsState) {
//                 posts = state.posts;
//                 print(posts);
//               } 
//             },
//             builder: (context, state) {
//               if (state is LoadedPostsState) {
//                 posts = state.posts; // تخزين البيانات في الحالة المؤقتة
//               }
//               // عند الاضافة يضهر هاذا الخطاء
//               // else if (state is ErrorPostsState) {
//               //   return Center(
//               //     child: SingleChildScrollView(
//               //       child: Text(
//               //         state.message,
//               //         style: TextStyle(fontSize: 25),
//               //         textAlign: TextAlign.center,
//               //       ),
//               //     ),
//               //   );
//               //   // return MessageDisplayWidget(message: state.message);
//               // }
//               return RefreshIndicator(
//                 onRefresh: () async {
//                   BlocProvider.of<PostsBloc>(context)
//                       .add(GetValueNotificationBarEvent());
//                 },
//                 child: ListView.builder(
//                   itemCount: posts.length,
//                   itemBuilder: (context, index) {
//                     Post post = posts[index];
//                     List<bool> conditionMetTrue =
//                         List<bool>.filled(posts.length, true);
//                     List<bool> conditionMetFalse =
//                         List<bool>.filled(posts.length, false);

//                     return Card(
//                       // color: Color,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ListTile(
//                             leading: CircleAvatar(
//                                 backgroundImage:
//                                     AssetImage("assets/ahmed.jpg")),
//                             title: Text(
//                               post.username,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             subtitle: Text(
//                               post.time,
//                               style: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Text(
//                               post.postText,
//                               style: TextStyle(
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           // إضافة صورة المنشور إذا كانت موجودة في النموذج
//                           if (post.postImage != "")
//                             Image.asset(
//                               post.postImage,
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                             ),
//                           SizedBox(height: 8),
//                           Container(
//                             height: 2,
//                             width: double.infinity,
//                             child: Divider(
//                               color: Colors.black,
//                               thickness: 0.2,
//                               indent: 16,
//                               endIndent: 16,
//                             ),
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       onPressed: () {
//                                         if (!post.islikes) {
//                                           setState(() {
//                                             print(conditionMetTrue[index]);
//                                             conditionMetTrue[index] = true;
//                                           });
//                                         } else {
//                                           setState(() {
//                                             print(conditionMetFalse[index]);
//                                             conditionMetFalse[index] = false;
//                                           });
//                                         }
//                                       },
//                                       icon: Icon(
//                                         post.islikes
//                                             ? Icons.favorite
//                                             : Icons.favorite_border,
//                                         color: post.islikes ? Colors.red : null,
//                                         // color: conditionMetFalse[index]? Colors.red: null,
//                                       ),
//                                     ),
//                                     SizedBox(width: 8),
//                                     // Text(likesCount.toString()),
//                                     Text(
//                                       post.likes.toString(),
//                                     ),
//                                   ],
//                                 ),
//                                 VerticalDivider(
//                                   thickness: 1,
//                                   width: 1,
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     // إجراء التعليق
//                                   },
//                                   icon: Icon(
//                                     Icons.comment,
//                                     color: MyColors.blue,
//                                   ),
//                                 ),
//                                 VerticalDivider(
//                                   thickness: 1,
//                                   width: 1,
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     // إجراء المشاركة
//                                   },
//                                   icon: Icon(
//                                     Icons.share,
//                                     color: MyColors.blue,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           )),
//     );
//   }
// }
