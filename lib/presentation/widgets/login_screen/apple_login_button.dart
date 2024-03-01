import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skill_swap/services/locator_service.dart';

class AppleLoginButton extends StatelessWidget {
  const AppleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FaIcon(
        FontAwesomeIcons.apple,
        size: 35,
        color: HexColor("#000000"),
      ),
      onTap: () => LocatorService.authService.signInWithApple(),
    );
  }
}
