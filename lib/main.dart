import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soigne_moi_secretaire/config/app_colors.dart';
import 'package:soigne_moi_secretaire/screens/home/home.dart';
import 'package:soigne_moi_secretaire/screens/login/login.dart';
import 'package:soigne_moi_secretaire/utils/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoigneMoi Secretaire',
      theme: buildAppTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Wrapper(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
      },
    );
  }
}
