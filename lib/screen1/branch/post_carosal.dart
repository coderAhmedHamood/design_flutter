import 'package:flutter/material.dart';
class Post {
  final String title;
  final String location;
  late final int likes;
  late final bool isLikes;
  final int comments;
  final String imageUrl;

  Post({
    required this.title,
    required this.location,
    required this.likes,
    required this.isLikes,
    required this.comments,
    required this.imageUrl,
  });
}

  final List<Post> posts = [
    Post(
      title: 'الفرع الرئيسي',
      location: 'تعز شارع التحرير',
      likes: 10,
      isLikes:true,
      comments: 5,
      imageUrl: 'assets/school/school1.jpg',
      // imageUrl: 'assets/school/school1.jpg',
    ),
    Post(
      title: 'فرع الاربعين',
      location: 'تعز بير باشا',
      likes: 20,
      isLikes:true,
      comments: 8,
      imageUrl: 'assets/school/school2.jpg',
    ),
    Post(
      title: 'فرع ذمار ',
      location: 'جوار محطة الجرموزي ',
      likes: 20,
      isLikes:false,
      comments: 8,
      imageUrl: 'assets/school/school3.jpg',
    ),
    Post(
      title: 'فرع البنين ',
      location: 'ذمار جولة كمران',
      likes: 20,
      isLikes:true,
      comments: 8,
      imageUrl: 'assets/school/school1.jpg',
    ),
    // Add more posts as needed
  ];


class PostCarosal extends StatefulWidget {
  @override
  _PostCarosalState createState() => _PostCarosalState();
}

class _PostCarosalState extends State<StatefulWidget> {
   
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 209, 207, 207),
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return buildPost(context, index);
        },
      ),
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
              color: Colors.white.withOpacity(.5),
            ),
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          
                  Text(
                    post.location,
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '❤ ${post.likes}',
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
            ),
          ),
        ],
      ),
    );
  }
}

//// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new
