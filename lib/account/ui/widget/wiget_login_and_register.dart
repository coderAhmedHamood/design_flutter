import 'package:flutter/material.dart';

import '../../../screen/tabbar/home_Tabbar.dart';
import '../../bloc/account_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screen/register_screen.dart';
import 'curve_cliper.dart';
import 'custom_text.dart';

class WidgetLoginOrRegisterScreen extends StatelessWidget {
  String pageName;
  WidgetLoginOrRegisterScreen({super.key, required this.pageName});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPassword = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is SuccessLoginState) {
          print("?????????(((((((((((((((okokokok))))))))))))))??????????");
          print("SuccessLoginState");
          print("SuccessLoginStatel");
          print("?????????(((((((((((((((okokokok))))))))))))))??????????");
          print("SuccessLoginStatel");
          print("SuccessLoginState");
          print("SuccessLoginStatel");
          print("?????????(((((((((((((((okokokok))))))))))))))??????????");
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => TabBarViewScreen(
                        initialIndexValue: 2,
                      )),
            );
          });
        }
        return Scaffold(
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Color.fromARGB(255, 240, 247, 247),
                child: Material(
                  color: Color.fromARGB(255, 240, 247, 247),
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
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            // obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              labelText: "ادخل البريد الإلكتروني",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: Icon(Icons.email, color: Colors.blue),
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
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Form(
                          key: _formKeyPassword,
                          child: TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            // obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              labelText: "ادخل كلمة المرور",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              prefixIcon: Icon(
                                Icons.lock_rounded,
                                color: Colors.blue,
                              ),
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
                      SizedBox(height: 30),
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
                                print(_emailController.text);
                                print(_passwordController.text);
                                context.read<AccountBloc>().add(LoginEvent(
                                    email: _emailController.text,
                                    password: _passwordController.text));
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
                        SizedBox(height: 15),
                        Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
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
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
