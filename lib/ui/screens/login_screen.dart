import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/helpers/theme_helper.dart';
import 'package:skill_swap/ui/widgets/header_widget.dart';
import 'package:skill_swap/ui/widgets/login_screen/apple_login_button.dart';
import 'package:skill_swap/ui/widgets/login_screen/email_login_form.dart';
import 'package:skill_swap/ui/widgets/login_screen/facebook_login_button.dart';
import 'package:skill_swap/ui/widgets/login_screen/google_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      const Text(
                        'Hello',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Signin into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      EmailLoginForm(),
                      const SizedBox(height: 30.0),
                      const Text(
                        "Or signin using social media",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 25.0),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GoogleLoginButton(),
                          SizedBox(
                            width: 30.0,
                          ),
                          FacebookLoginButton(),
                          SizedBox(
                            width: 30.0,
                          ),
                          AppleLoginButton()
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
