import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:skill_swap/ui/widgets/login_screen/apple_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final emailLink = await _auth.sendSignInLinkToEmail(
        email: _emailController.text.trim(),
        actionCodeSettings: ActionCodeSettings(
            url: 'https://www.example.com/finishSignUp?cartId=1234',
            handleCodeInApp: true,
            iOSBundleId: 'dev.nikkothe.skillswap',
            androidPackageName: 'dev.nikkothe.skillswap',
            androidInstallApp: true,
            androidMinimumVersion: '12'),
      );
      final UserCredential userCredential = await _auth.signInWithEmailLink(
          email: _emailController.text.trim(), emailLink: "");

      // TODO: Handle successful login
    } catch (e) {
      // TODO: Handle login error
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loginWithFacebook(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // TODO: Handle successful login with Facebook
      } else {
        // TODO: Handle Facebook login error
        print(result.message);
      }
    } catch (e) {
      // TODO: Handle Facebook login error
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isLoading ? null : () => _login(context),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Login'),
              ),
              const SizedBox(height: 16.0),
              InkWell(
                onTap: _isLoading ? null : () => _loginWithFacebook(context),
                child: Container(
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 8.0),
                      Text(
                        'Login with Facebook',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const AppleLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
