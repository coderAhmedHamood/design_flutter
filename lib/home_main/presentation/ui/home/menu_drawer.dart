import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_design/account/bloc/account_bloc.dart';

import '../../../../account/data/model/stor.dart';
import '../../../../account/ui/screen/login_screen.dart';
import '../../../../base/constants/my_colors.dart';
import '../../../../main.dart';
import '../widgets/menu/FeatureContainer.dart';
import '../widgets/menu/MenuItem.dart';
import '../widgets/menu/UserProfile.dart';
import '../widgets/menu/title.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isUserLogin = UserData.id != null;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 247, 247),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              if (isUserLogin) 
              TitleInMenu(text: "ملفي الشخصي",),
              if (isUserLogin)
                UserProfileInMenu(
                  name: "ابو العرب",
                  imagePath: "assets/ahmed.jpg",
                ),
              SizedBox(height: 40),
              TitleInMenu(text: "الإختصارات"),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 4, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeatureContainer(
                      icon: Icons.assessment_outlined,
                      iconColor: Color.fromARGB(255, 237, 101, 242),
                      backgroundColor: MyColors.white,
                      text: "ميزات او اختصارات",
                    ),
                    SizedBox(width: 10),
                    FeatureContainer(
                      icon: Icons.person,
                      iconColor: Color.fromARGB(255, 155, 16, 160),
                      backgroundColor: MyColors.white,
                      text: "ميزات او اختصارات",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 4, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeatureContainer(
                      icon: Icons.assessment_outlined,
                      iconColor: Color.fromARGB(255, 236, 156, 57),
                      backgroundColor: MyColors.white,
                      text: "ميزات او اختصارات",
                    ),
                    SizedBox(width: 10),
                    FeatureContainer(
                      icon: Icons.person,
                      iconColor: Color.fromARGB(255, 76, 246, 195),
                      backgroundColor: MyColors.white,
                      text: "ميزات او اختصارات",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              TitleInMenu(text: "الإعدادات والخصوصية"),
              
          RadioListTile<Locale>(
            title: Text("English"),
            value: Locale("en"),
            groupValue: Localizations.localeOf(context),
            onChanged: (Locale? value) {
              if (value != null) {
              _changeLanguage(value, context);

              }
            },
          ),
          RadioListTile<Locale>(
            title: Text("Arabic"),
            value: Locale("ar"),
            groupValue: Localizations.localeOf(context),
            onChanged: (Locale? value) {
              if (value != null) {
             _changeLanguage(value, context);

              }
            },
          ),

          
              Column(
                children: [
                  MenuItem(
                    text: "الإعدادات",
                    onPressed: () {
                      // اضف الاكواد التي تريد تنفيذها عند الضغط على الإعدادات
                    },
                  ),
                  SizedBox(height: 10),
                  MenuItem(
                    text: "المساعدة",
                    onPressed: () {
                      // اضف الاكواد التي تريد تنفيذها عند الضغط على المساعدة
                    },
                  ),
                  SizedBox(height: 10),
                  MenuItem(
                    text: "حول فريق العمل",
                    onPressed: () {
                      // اضف الاكواد التي تريد تنفيذها عند الضغط على حول فريق العمل
                    },
                  ),
                  SizedBox(height: 10),
                  MenuItem(
                    text: isUserLogin ? "تسجيل الخروج" : "تسجيل دخول",
                    onPressed: () {
                      if (isUserLogin) {
                        context.read<AccountBloc>().add(LogoutEvent());
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeLanguage(Locale locale, BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => MyApp(locale: locale)),
    (route) => false,
  );
}

}
