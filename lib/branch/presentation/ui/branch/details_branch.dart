import 'package:flutter/material.dart';

class DetailsBranchScreen extends StatelessWidget {
  final String name = "الفرع الرئيسي";
  final String type = "اساسي إعدادي ثانوي";
  final String phone = "تواصل: 0455638";
  final String director = "مدير: عبداللة سيف المطار";
  final String openingDate = "افتتاح الفرع: 2011/5";
  final String location = "location";
  final List<String> features = [
    "فرعنا اول فرع للبنين",
    "فرعنا يتميز بالمتابعة المستمرة",
    "فرعنا لدية الاجهزة الحديثة",
    "فرعنا يمتلك كادر متميز ",
    "ويمتلك الفعاليات والمسابقات في كل نصف السنة "
  ];

  // const DetailsBranchScreen({
  //   required this.name,
  //   required this.type,
  //   required this.phone,
  //   required this.director,
  //   required this.openingDate,
  //   required this.location,
  //   required this.features,
  // });

// مثال لتحسين تنسيق الألوان واختيار الأماكن

// تحديد مجموعة جديدة من الألوان
  Color primaryColor = Color(0xFF4A90E2);
  Color accentColor = Color(0xFFFFA726);
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تفاصيل الفرع",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            // top: 20,
            bottom: 500,
            child: Image.asset(
              "assets/school.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.22,
            child: Container(
              // color: Color.fromRGBO(209, 207, 207, 1),
              width: MediaQuery.of(context).size.width,
              // اقلعي ارتفاع هنا بحيث يكون أصغر من ارتفاع الشاشة
              height: MediaQuery.of(context).size.height * 0.78,
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                // color: Colors.white,
                color: Color.fromRGBO(240, 237, 237, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 90),
                      child: Center(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InfoItem(
                            Icons.school,
                            type,
                            Colors.blue,
                          ),
                          InfoItem(
                            Icons.phone,
                            phone,
                            Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InfoItem(
                            Icons.person,
                            director,
                            Colors.blue,
                          ),
                          InfoItem(
                            Icons.calendar_today,
                            openingDate,
                            Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "المميزات",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: features
                          .map(
                            (feature) => ListTile(
                              leading: Icon(Icons.check, color: Colors.green),
                              title: Text(
                                feature,
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "تفاصيل الفرع",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "جوار البنك الدولي",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "المرافق المتاحة:",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "البرامج التعليمية:",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.13,
            left: MediaQuery.of(context).size.width * 0.35,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: Image.asset(
                    "assets/notification2.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget InfoItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 32,
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        ),
      ],
    );
  }
}
