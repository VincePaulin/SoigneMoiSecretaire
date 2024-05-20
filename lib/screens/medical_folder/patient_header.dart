import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/model/user.dart';

class PatientInfoHeader extends StatelessWidget {
  final User user;
  const PatientInfoHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            user.email,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Numéro: ${user.id}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 16),
              Text(
                user.address!,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          // We could put the weight and height here
        ],
      ),
    );
  }
}
