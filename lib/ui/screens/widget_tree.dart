import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_swap/services/locator_service.dart';
import 'package:skill_swap/ui/screens/add_personal_info_screen.dart';
import 'package:skill_swap/ui/screens/login_screen.dart';
import 'package:skill_swap/ui/screens/skeleton_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: LocatorService.authService.authStateChanges,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            return FutureBuilder(
              future: LocatorService.userRepository
                  .getUserByFirebaseUid(snapshot.data!.uid),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasData) {
                    return const SkeletonScreen();
                  } else {
                    return const AddPersonalInfoScreen();
                  }
                }
              },
            );
          } else {
            return const LoginScreen();
          }
        }
      },
    );
  }
}
