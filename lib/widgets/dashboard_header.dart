import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Tableau de bord',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/avatar.png'),
        ),
        const SizedBox(width: 8),
        Text('Prenom Nom'),
      ],
    );
  }
}
