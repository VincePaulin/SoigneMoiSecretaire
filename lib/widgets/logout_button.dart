import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () async {
          // Delete token from shared preferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('access_token');
          await prefs.setBool('isLoggedIn', false);

          // Navigate to the login page
          if (context.mounted) {
            // Navigate to the login page
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/login',
                  (Route<dynamic> route) => false,
            );
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
