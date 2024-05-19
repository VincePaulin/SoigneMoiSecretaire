import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/screens/home/home.dart';

class HomeHeader extends StatelessWidget {
  final HomeController controller;
  const HomeHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    String title;
    switch (controller.selectedIndex) {
      case 0:
        title = 'Tableau de bord';
        break;
      case 1:
        title = 'Patients';
        break;
      case 2:
        title = 'Docteurs';
        break;
      default:
        title = 'Tableau de bord';
    }

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            key: Key('pageTitle_$title'),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/avatar.png'),
        ),
        const SizedBox(width: 8),
        const Text('Secretaire'),
      ],
    );
  }
}
