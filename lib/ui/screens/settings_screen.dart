import 'package:flutter/material.dart';
import 'package:skill_swap/services/locator_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            LocatorService.authService.signOut();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
