import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skill_swap/services/locator_service.dart';

class FacebookLoginButton extends StatelessWidget {
  const FacebookLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FaIcon(
        FontAwesomeIcons.facebook,
        size: 35,
        color: HexColor("#3E529C"),
      ),
      onTap: () => LocatorService.authService.signInWithFacebook(),
    );
  }
}
