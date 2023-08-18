import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
  itemCount: posts.length,
  itemBuilder: (context, index) {
    Post post = posts[index];

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(post.postImage),
            ),
            title: Text(
              post.username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              post.time,
              style: TextStyle(
                color: Colors.grey,
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
          if (post.postImage != null)
            Image.asset(
              post.postImage,
              fit: BoxFit.cover,
            ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // إجراء الإعجاب
                      },
                      icon: Icon(Icons.favorite_border),
                    ),
                    SizedBox(width: 8),
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
                  icon: Icon(Icons.comment),
                ),
                VerticalDivider(
                  thickness: 1,
                  width: 1,
                ),
                IconButton(
                  onPressed: () {
                    // إجراء المشاركة
                  },
                  icon: Icon(Icons.share),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  },
),
       );
  }
}



class Post {
  String username;
  String time;
  String postText;
  String postImage;
  int likes;

  Post({
    required this.username,
    required this.time,
    required this.postText,
    required this.postImage,
    required this.likes,
  });
}

List<Post> posts = [
  Post(
    username: 'اسم المستخدم 1',
    time: '2024/3/5',
    postText: ' create a TabBar with three Tab widgets and place it within an AppBar . content_copy. a TabController ·Create the tabs ·Create content for each tab',
    postImage: 'assets/post_image1.png',
    likes: 30,
  ),
  Post(
    username: 'اسم المستخدم 2',
    time: '2024/3/4',
    postText: 'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    postImage: 'assets/post_image2.png',
    likes: 15,
  ),
    Post(
    username: 'اسم المستخدم 2',
    time: '2024/3/4',
    postText: 'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    postImage: 'assets/post_image2.png',
    likes: 15,
  ),
    Post(
    username: 'اسم المستخدم 2',
    time: '2024/3/4',
    postText: 'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    postImage: 'assets/post_image2.png',
    likes: 15,
  ),
    Post(
    username: 'اسم المستخدم 2',
    time: '2024/3/4',
    postText: 'بسم الله ماشاء الله تبارك الرحمن الانتهاء من تفتيش ثالث برادات  #مجموعة_شركات_الماظة_للشحن_الدولي 16/8/2023 الان من امام ميناء سفاجا والتوجه الي المخازن في جمهورية مصر العربية للتواصل والاستفسارات 00971582040166 00971582040155 00971582616061 00971504113132 للتواصل والاستفسارات مكتب مصر 002011111004449',
    postImage: 'assets/post_image2.png',
    likes: 15,
  ),
  // إضافة منشورات إضافية هنا
];