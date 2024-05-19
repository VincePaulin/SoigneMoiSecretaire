import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soigne_moi_secretaire/config/app_config.dart';

import 'login_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginController createState() => LoginController();
}

class LoginController extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailError;
  String? passwordError;
  bool loading = false;
  bool showPassword = false;
  late final Dio dio;
  String? error;

  @override
  void initState() {
    super.initState();
    // Initialize dio base options
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }

  void toggleShowPassword() =>
      setState(() => showPassword = !loading && !showPassword);

  Future<void> login() async {
    // If all goes well, reset passwordError
    setState(() => passwordError = null);

    if (emailController.text.isEmpty) {
      setState(() => emailError = "Veuillez remplir ce champ");
    } else {
      setState(() => emailError = null);
    }
    if (passwordController.text.isEmpty) {
      setState(() => passwordError = "Veuillez remplir ce champ");
    } else {
      setState(() => passwordError = null);
    }

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return;
    }

    setState(() => loading = true);

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        error = 'Email and password are required';
      });
      return;
    }

    setState(() {
      loading = true;
      error = null;
    });

    try {
      final response = await dio.post(
        "/secretary/login",
        data: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        // Save the token and set isLoggedIn to true
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', responseData['token']);
        await prefs.setBool('isLoggedIn', true);

        // Redirect to the dashboard or do other necessary actions
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("Exception when calling backend log: $e\n");
      }

      // Display Dio error messages to the user
      if (e.response?.data != null) {
        final errorMessage = e.response?.data['message'];
        setState(() => passwordError = errorMessage);
      } else {
        setState(() => passwordError = "Erreur réseau");
      }
      return setState(() => loading = false);
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
      setState(() => passwordError = "error");
      return setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(
      controller: this,
    );
  }
}
