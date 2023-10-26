// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart'; 
 

import '../widget/wiget_login_and_register.dart';
 
class ActiveAccountScreen extends StatefulWidget {
  const ActiveAccountScreen({Key? key}) : super(key: key);

  @override
  State<ActiveAccountScreen> createState() => _ActiveAccountScreenState();
}

class _ActiveAccountScreenState extends State<ActiveAccountScreen> {
 
  @override
  Widget build(BuildContext context) {
    return WidgetLoginOrRegisterScreen(pageName: "active",);
  }
}
