// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart'; 

import '../../../parent/presentation/ui/page/chick_dashboard_parents.dart';
import '../../../screen/tabbar/home_Tabbar.dart';
import '../../bloc/account_bloc.dart';
import '../widget/curve_cliper.dart';
import '../widget/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/wiget_login_and_register.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
  @override
  Widget build(BuildContext context) {
    return WidgetLoginOrRegisterScreen(pageName: "login",);
  }
}
