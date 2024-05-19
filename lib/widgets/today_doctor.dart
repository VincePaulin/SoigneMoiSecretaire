import 'package:flutter/material.dart';

class TodayDoctorList extends StatelessWidget {
  const TodayDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Docteur présents aujourd'hui"),
            const SizedBox(height: 8),
            TodayDoctorItem(
              name: 'Ronald Richards',
              status: 'Disponible',
            ),
            TodayDoctorItem(
              name: 'Floyd Miles',
              status: 'Disponible',
            ),
            TodayDoctorItem(
              name: 'Cody Fisher',
              status: 'Disponible',
            ),
          ],
        ),
      ),
    );
  }
}

class TodayDoctorItem extends StatelessWidget {
  final String name;
  final String status;

  const TodayDoctorItem({
    super.key,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(status),
        ],
      ),
    );
  }
}
