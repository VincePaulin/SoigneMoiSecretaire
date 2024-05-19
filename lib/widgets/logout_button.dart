import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        key: const Key('logoutButton'),
        onPressed: () async {
          // Delete token from shared preferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('access_token');
          await prefs.setBool('isLoggedIn', false);

          // Navigate to the login page
          if (context.mounted) {
            Navigator.of(context).pushReplacementNamed('/login');
          }
        },
        child: const Text(
          'Se déconnecter',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
