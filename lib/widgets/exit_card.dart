import 'package:flutter/material.dart';

class ExitCard extends StatelessWidget {
  const ExitCard({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = [
      {'name': 'John Doe', 'motif': 'Consultation'},
      {'name': 'Jane Smith', 'motif': 'Opération'},
      {'name': 'Bob Johnson', 'motif': 'Contrôle'},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Sorties'),
            const SizedBox(height: 8),
            // Use Flexible with FlexFit.loose to avoid undefined constraints
            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  return ListTile(
                    title: Text(entry['name']!),
                    subtitle: Text(entry['motif']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
