import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importer le package intl
import 'package:soigne_moi_secretaire/screens/home/home.dart';
import 'package:soigne_moi_secretaire/widgets/entry_card.dart';
import 'package:soigne_moi_secretaire/widgets/exit_card.dart';
import 'package:soigne_moi_secretaire/widgets/today_doctor.dart';

class DashboardPage extends StatelessWidget {
  final HomeController controller;
  const DashboardPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Get today's date
    String today = DateFormat('dd/MM/yyyy').format(DateTime.now());

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Show today's date at the top
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Text(
                'Aujourd\'hui: $today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  // Add your refresh logic here
                  controller.reload();
                },
              ),
            ],
          ),
        ),
        Row(
          children: [
            Flexible(
                child: EntryCard(
              controller: controller,
            )),
            const SizedBox(width: 16),
            Flexible(
                child: ExitCard(
              controller: controller,
            )),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
                child: TodayDoctorList(
              doctors: controller.doctorToday,
            ))
          ],
        ),
      ],
    );
  }
}
