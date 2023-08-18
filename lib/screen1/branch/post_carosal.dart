import 'package:flutter/material.dart';

class Post {
  final String title;
  final String location;
  final int likes;
  final int comments;
  final String imageUrl;

  Post({
    required this.title,
    required this.location,
    required this.likes,
    required this.comments,
    required this.imageUrl,
  });
}

class PostCarosal extends StatelessWidget {
  final List<Post> posts = [
    Post(
      title: 'الفرع الرئيسي',
      location: 'تعز شارع التحرير',
      likes: 10,
      comments: 5,
      imageUrl: 'assets/school/school1.jpg',
      // imageUrl: 'assets/school/school1.jpg',
    ),
    Post(
      title: 'فرع الاربعين',
      location: 'تعز بير باشا',
      likes: 20,
      comments: 8,
      imageUrl: 'assets/school/school2.jpg',
    ),
    Post(
      title: 'فرع ذمار ',
      location: 'جوار محطة الجرموزي ',
      likes: 20,
      comments: 8,
      imageUrl: 'assets/school/school3.jpg',
    ),
    Post(
      title: 'فرع البنين ',
      location: 'ذمار جولة كمران',
      likes: 20,
      comments: 8,
      imageUrl: 'assets/school/school1.jpg',
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return buildPost(context, index);
      },
    );
  }

  Widget buildPost(BuildContext context, int index) {
    Post post = posts[index];
    return Container(
      margin: EdgeInsets.all(25),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            color: Colors.black,
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage(post.imageUrl),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Colors.white.withOpacity(.7),
            ),
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    post.location,
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '❤ ${post.likes}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Colors.blue,
                          ),
                          Text(
                            ' ${post.comments}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildPost(BuildContext context, int index) {
  //   Post post = posts[index];
  //   return Container(
  //     margin: EdgeInsets.all(25),
  //     height: 300, // تحديد ارتفاع العنصر حسب الحاجة
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(15),
  //       boxShadow: [
  //         BoxShadow(
  //           offset: Offset(2, 2),
  //           color: Colors.black,
  //           blurRadius: 5,
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         Expanded(
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(15),
  //             child: Image(
  //               image: AssetImage(post.imageUrl),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //         Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //               bottomLeft: Radius.circular(15),
  //               bottomRight: Radius.circular(15),
  //             ),
  //             color: Colors.white.withOpacity(.7),
  //           ),
  //           height: 120,

  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   post.title,
  //                   style: TextStyle(
  //                     fontSize: 23,
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Text(
  //                   post.location,
  //                   style: TextStyle(
  //                     fontSize: 21,
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       '❤ ${post.likes}',
  //                       style: TextStyle(
  //                         fontSize: 20,
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     ),
  //                     Row(
  //                       children: [
  //                         Icon(
  //                           Icons.comment,
  //                           color: Colors.blue,
  //                         ),
  //                         Text(
  //                           ' ${post.comments}',
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             color: Colors.black,
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

//// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new
