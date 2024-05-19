import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soigne_moi_secretaire/screens/dashboard_page.dart';
import 'package:soigne_moi_secretaire/screens/login_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData && snapshot.data!) {
            return const DashboardPage();
          } else {
            return const LoginPage();
          }
        }
      },
    );
  }
}
