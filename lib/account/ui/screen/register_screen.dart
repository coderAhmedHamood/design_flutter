import 'package:flutter/material.dart';
import '../../../base/loading_screen.dart';

import '../../bloc/account_bloc.dart';
import '../widget/curve_cliper.dart';
import '../widget/custom_text.dart';
import 'login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:get/get.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyUsername = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPassword = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    image: AssetImage('assets/school.jpg'),
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
                    key: _formKeyEmail,
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
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKeyUsername,
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        hintText: 'اسم المستخدم',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'يرجى إدخال اسم المستخدم';
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
                        if (_formKeyEmail.currentState!.validate() &&
                            _formKeyUsername.currentState!.validate() &&
                            _formKeyPassword.currentState!.validate()) {
                          // LoadingScreen.show(
                          //     context, "انتضر من فضلك يتم انشاء الحساب ");
                          // تم التحقق من صحة الحقول
                          context.read<AccountBloc>().add(RegisterEvent(
                              email: _emailController.text,
                              username: _usernameController.text,
                              password: _passwordController.text));
                          // BlocProvider.of<AccountBloc>(context).add(
                          //     RegisterEvent(
                          //         email: _emailController.text,
                          //         username: _usernameController.text,
                          //         password: _passwordController.text));
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
                            text: 'إنشاء حساب',
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
                    'لديك حساب؟',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      'الذهاب الى تسجيل الدخول',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
