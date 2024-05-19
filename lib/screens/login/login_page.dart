import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/config/app_config.dart';
import 'package:soigne_moi_secretaire/widgets/auth_widget.dart';
import 'login.dart';

class LoginView extends StatelessWidget {
  final LoginController controller;
  const LoginView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Logo
                        Image.asset(
                          'assets/logo.png',
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(height: 20),
                        // Titre
                        Text(
                          AppConfig.applicationName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        // Email TextField
                        buildLoginEmailTextField(controller),
                        const SizedBox(height: 10),
                        // Password TextField
                        buildLoginPasswordTextField(controller),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Login Button
                    buildLoginButton(controller),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
