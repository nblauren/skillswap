import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FacebookLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignInWithAppleButton(
      onPressed: () {
        // Logic for Facebook login
        signInWithFacebook();
      },
      text: 'Sign in with Facebook',
    );
  }

  Future<void> signInWithFacebook() async {
    final AuthorizationCredentialAppleID appleIdCredential =
        await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final OAuthCredential credential = OAuthProvider("apple.com").credential(
      idToken: appleIdCredential.identityToken,
      accessToken: appleIdCredential.authorizationCode,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
