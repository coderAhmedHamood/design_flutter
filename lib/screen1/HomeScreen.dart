import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: 5, // عدد المنشورات
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    // الصورة الشخصية
                    backgroundImage: AssetImage('assets/notification1.png'),
                  ),
                  title: Text(
                    'اسم المستخدم', // اسم المستخدم
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'وقت المنشور', // وقت المنشور
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'نص المنشور نص المنشور نص المنشور نص المنشورنص المنشورنص المنشور نص المنشور نص المنشور نص المنشور نص المنشور', // نص المنشور
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // Image.asset(
                //   'assets/post_image.png', // صورة المنشور
                //   fit: BoxFit.cover,
                // ),
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
                            icon: Icon(Icons.favorite_border), // أيقونة الإعجاب
                          ),
                          SizedBox(width: 8),
                          Text(
                            '30', // عدد الإعجابات
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
                        icon: Icon(Icons.comment), // أيقونة التعليق
                      ),
                      VerticalDivider(
                        thickness: 1,
                        width: 1,
                      ),
                      IconButton(
                        onPressed: () {
                          // إجراء المشاركة
                        },
                        icon: Icon(Icons.share), // أيقونة المشاركة
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Drawer(
                //   width: 30,
                //   backgroundColor: Colors.grey,
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
