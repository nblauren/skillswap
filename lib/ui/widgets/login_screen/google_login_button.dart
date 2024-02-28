import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skill_swap/services/locator_service.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FaIcon(
        FontAwesomeIcons.googlePlus,
        size: 35,
        color: HexColor("#EC2D2F"),
      ),
      onTap: () => LocatorService.authService.signInAnon(),
    );
  }
}
