import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username = '';
  String email = '';
  String password = '';
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 3),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple.withOpacity(0.4),
                  Colors.blue.withOpacity(0.4),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 24),
              children: [
                SizedBox(height: 80),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_add, size: 80),
                    SizedBox(height: 10),
                    Text('Create an Account', style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    username = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(FontAwesomeIcons.user)
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(FontAwesomeIcons.envelope)
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(FontAwesomeIcons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(_obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash)
                      )
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print(username);
                    print(email);
                    print(password);
                  },
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                // SizedBox(height: 12),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Log In'),

                    ),
                  ],
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}
