import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: Container(
        color: const Color.fromARGB(255, 219, 220, 220), // لون الخلفية الهادئ
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white, // لون الحاوية
                borderRadius: BorderRadius.circular(20), // التوائم
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                
                child: Image.asset('assets/school.jpg',width: double.infinity,), // الصورة
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white, // لون الخلفية
                borderRadius: BorderRadius.circular(10), // التوائم
              ),
              child: Column(
                children: [
                  Text(
                    'نصائح مهمة',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'قم بمتابعة ابنك الطالب وحفزه على تحقيق التفوق الأكاديمي. استخدم وقت فراغك لمتابعة تقدمه وتقديم الدعم اللازم.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'قم بتشجيعه على المشاركة في الأنشطة المدرسية الإضافية ومساعدته في اختيار المسار الأكاديمي المناسب له.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}