import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/widgets/dashboard_header.dart';
import 'package:soigne_moi_secretaire/widgets/entry_card.dart';
import 'package:soigne_moi_secretaire/widgets/exit_card.dart';
import 'package:soigne_moi_secretaire/widgets/navigation_bar.dart';
import 'package:soigne_moi_secretaire/widgets/today_doctor.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Side navigation bar
          NavigationSidebar(),
          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    DashboardHeader(),
                    const SizedBox(height: 16),
                    // Inputs and outputs
                    Row(
                      children: [
                        Flexible(child: EntryCard()),
                        const SizedBox(width: 16),
                        Flexible(child: ExitCard()),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TodayDoctorList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
