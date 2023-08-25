// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
 import '../../../base/loading_screen.dart';
 
 import '../widget/curve_cliper.dart';
import '../widget/custom_text.dart';
import 'package:get/get.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPassword = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
     return Scaffold(
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.grey[200],
                child: Material(
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipPath(
                        clipper: CurveCliper(),
                        child: Image(
                          height: MediaQuery.of(context).size.height / 2.5,
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/school.jpg'),
                        ),
                      ),
                      Center(
                        child: CustomText(
                          text: 'مدارس العربية السعيدة',
                          fontSize: 37,
                          color: Colors.blue,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.email),
                              hintText: 'البريد الإلكتروني',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'يرجى إدخال البريد الإلكتروني';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Form(
                          key: _formKeyPassword,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.lock_rounded),
                              hintText: 'كلمة المرور',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'يرجى إدخال كلمة المرور';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                          ),
                          child: MaterialButton(
                            height: 50,
                            onPressed: () {
                              if (_formKey.currentState!.validate() &&
                                  _formKeyPassword.currentState!.validate()) {
                                // LoadingScreen.show(
                                //     context, "انتضر من فضلك يتم تسجيل الدخول ");
                                // تم التحقق من صحة الحقول
                                // context.read<AccountBloc>().add(LoginEvent(
                                //     email: _emailController.text,
                                //     password: _passwordController.text));
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.login,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  text: 'تسجيل الدخول',
                                  fontSize: 19,
                                  color: Colors.white,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        MaterialButton(
                          onPressed: (){
                            // Get.to(RegisterScreen());
                            // Get.put("/register");
                            Get.toNamed("/register");
                            // Navigator.of(context).pushReplacementNamed("/register");
                            // Navigator.of(context).pushNamed("/register");
                            // Get.toNamed('/');
                          },
                          child: Text(
                            'انشأ حساب',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ]
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
   
  }
}
