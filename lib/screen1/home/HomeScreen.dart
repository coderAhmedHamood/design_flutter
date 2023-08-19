import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

class Post {
  int id;
  String username;
  String time;
  String postText;
  String postImage;
  int likes;
  bool islikes;

  Post({
    required this.id,
    required this.username,
    required this.time,
    required this.postText,
    required this.postImage,
    required this.likes,
    required this.islikes,
  });
}

List<Post> posts = [
  Post(
    id: 1,
    username: 'اسم المستخدم 1',
    time: '2024/3/5',
    postText:
        ' تعبكم راحه , يكفي ثقتكم في مجموعهمدارس العربية السعيدة الاهلية   رحله كل 10 ايام للفنكوش..',
    postImage: "",
    // postImage: 'assets/post_image1.png',
    likes: 30,
    islikes: true,
  ),
  Post(
    id: 2,
    username: 'ابو العرب',
    time: '2024/3/4',
    postText:
        'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    postImage: 'assets/school/ahmed.jpg',
    likes: 15,
    islikes: false,
  ),
  Post(
    id: 3,
    username: 'ابو العرب',
    time: '2024/3/4',
    postText:
        'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    postImage: "",
    likes: 15,
    islikes: true,
  ),
  Post(
    id: 4,
    username: 'اسم المستخدم 2',
    time: '2024/3/4',
    postText:
        'Work with tabs Flutter documentationhttps:docs.flutter.dev › Cookbook › DesignYou',
    postImage: 'assets/school/school2.jpg',
    likes: 15,
    islikes: false,
  ),
  Post(
    id: 5,
    username: 'اسم المستخدم 2',
    time: '2024/3/4',
    postText:
        'بسم الله ماشاء الله تبارك الرحمن الانتهاء من تفتيش ثالث برادات  #مجموعة_شركات_الماظة_للشحن_الدولي 16/8/2023 الان من امام ميناء سفاجا والتوجه الي المخازن في جمهورية مصر العربية للتواصل والاستفسارات 00971582040166 00971582040155 00971582616061 00971504113132 للتواصل والاستفسارات مكتب مصر 002011111004449',
    postImage: 'assets/school/school1.jpg',
    likes: 15,
    islikes: false,
  ),
  // إضافة منشورات إضافية هنا
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StatefulWidget> {
  late Post post;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: const Color.fromARGB(255, 135, 135, 135),
        // color: Color.fromARGB(255, 197, 187, 187),
        child: ListView.builder(
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
                        backgroundImage: AssetImage("assets/ahmed.jpg")),
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
                      color: Colors.black,
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
                                setState(() {
                                  if (post.islikes) {
                                    post.islikes = !post.islikes;
                                    post.likes = post.likes - 1;
                                  } else {
                                    post.islikes = !post.islikes;
                                    post.likes = post.likes + 1;
                                  }
                                });
                              },
                              icon: Icon(
                                post.islikes
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: post.islikes ? Colors.red : null,
                              ),
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
        ),
      ),
    );
  }
}
