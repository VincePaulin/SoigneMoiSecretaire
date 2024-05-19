import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/widgets/entry_card.dart';
import 'package:soigne_moi_secretaire/widgets/exit_card.dart';
import 'package:soigne_moi_secretaire/widgets/today_doctor.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
