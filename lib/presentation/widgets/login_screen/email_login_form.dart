import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/helpers/theme_helper.dart';
import 'package:skill_swap/services/locator_service.dart';

class EmailLoginForm extends StatelessWidget {
  EmailLoginForm({super.key});

  final Key _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            decoration: ThemeHelper().inputBoxDecorationShadow(),
            child: TextField(
              controller: _emailController,
              decoration: ThemeHelper().textInputDecoration(
                  'Email Address', 'Enter your email address'),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            decoration: ThemeHelper().buttonBoxDecoration(context),
            child: ElevatedButton(
              style: ThemeHelper().buttonStyle(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  'Sign In'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              onPressed: () => login(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> login() async {
    try {
      LocatorService.authService.sendEmailLink(
        _emailController.text.trim(),
        ActionCodeSettings(
            url:
                'https://skillswap-e84de.web.app/login?email=${_emailController.text.trim()}',
            handleCodeInApp: true,
            iOSBundleId: 'dev.nikkothe.skillswap',
            androidPackageName: 'dev.nikkothe.skillswap',
            androidInstallApp: true,
            androidMinimumVersion: '12'),
      );
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }
}
